//
//  PixabayAPI.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation
import Combine
import UIKit

internal struct PixabayAPI {

    internal static func getSearchURL(_ keyword: String, _ page: Int) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path

        urlComponents.queryItems = requestParameters.map { (key: String, value: Any) in
            return URLQueryItem(name: key, value: value as? String)
        }

        urlComponents.queryItems?.append(URLQueryItem(name: "q", value: keyword))
        urlComponents.queryItems?.append(URLQueryItem(name: "page", value: String(page)))

        return urlComponents.url
    }

    private static let scheme = "https"
    private static let host = "pixabay.com"
    private static let path = "/api/"
    private static var requestParameters: [String: Any] {
        return [
            "key": Config.apiKey, // Fill with your own API key.
            "image_type": "photo",
            "safesearch": "true",
            "per_page": "50",
        ]
    }
}
