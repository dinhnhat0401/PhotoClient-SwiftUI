//
//  Parsing.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, PhotoClientError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    return Just(data).decode(type: T.self, decoder: decoder)
        .mapError { error in
        .parsing(descritpion: error.localizedDescription)
        }
        .eraseToAnyPublisher()
}
