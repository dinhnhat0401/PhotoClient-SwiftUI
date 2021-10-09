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
    internal static let apiURL = "https://pixabay.com/api/"

    internal static var requestParameters: [String: Any] {
        return [
            "key": Config.apiKey, // Fill with your own API key.
            "image_type": "photo",
            "safesearch": true,
            "per_page": 50,
        ]
    }
}
