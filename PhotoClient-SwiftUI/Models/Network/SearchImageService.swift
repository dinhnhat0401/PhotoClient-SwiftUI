//
//  SearchImageService.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation
import Combine
import UIKit

public protocol SearchImageServiceProtocol {
    func searchImage(_ keyword: String, _ page: Int) -> AnyPublisher<ResponseEntity, PhotoClientError>
}

public final class SearchImageService: SearchImageServiceProtocol {
//    var network: NetworkProtocol

    public init() {
//        self.network = network
    }

    public func searchImage(_ keyword: String, _ page: Int) -> AnyPublisher<ResponseEntity, PhotoClientError> {
        let url = PixabayAPI.getSearchURL(keyword, page)
        guard let url = url else {
            return Fail(error: PhotoClientError.setup(descritpion: "")).eraseToAnyPublisher()
        }
        return URLSession.shared.publisher(for: url, responseType: ResponseEntity.self, decoder: JSONDecoder())
    }

    // MARK: private variables

//    private let path = PixabayAPI.apiURL
}
