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
    func searchImage(_ keyword: String, _ page: Int) -> AnyPublisher<ResponseEntity, NetworkError>
}

public final class SearchImageService: SearchImageServiceProtocol {
    var network: NetworkProtocol

    public init(_ network: NetworkProtocol) {
        self.network = network
    }

    public func searchImage(_ keyword: String, _ page: Int) -> AnyPublisher<ResponseEntity, NetworkError> {
        let url = PixabayAPI.getSearchURL(keyword, page)
        guard let url = url else {
            return Fail(error: NetworkError.NotReachedServer).eraseToAnyPublisher()
        }
        return network.request(url: url, method: .get, resultQueue: .main)
    }
}
