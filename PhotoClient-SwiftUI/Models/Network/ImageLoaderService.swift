//
//  ImageLoaderService.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation
import SwiftUI
import Combine

//public protocol ImageLoaderServiceProtocol {
//    func getImage() -> AnyPublisher<UIImage, PhotoClientError>
//}
//
//public final class ImageLoaderService: ImageLoaderServiceProtocol {
//    public init(_ network: NetworkProtocol) {
//        self.network = network
//    }
//
//    public func getImage(_ url: String) -> AnyPublisher<UIImage, PhotoClientError> {
//        self.network.requestJSON(url: url, method: "GET", parameters: PixabayAPI.requestParameters).flatMap { data in
//            decode(data)
//        }
//    }
//
//    // MARK: private variables
//
//    var network: NetworkProtocol<UIImage>
//}
