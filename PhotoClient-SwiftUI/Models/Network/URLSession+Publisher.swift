//
//  URLSession+Publisher.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation
import Combine

struct NetworkResponse<T: Decodable>: Decodable {
    var result: T
}

extension URLSession {
    func publisher<T: Decodable>(
        for url: URL,
        responseType: T.Type = T.self,
        decoder: JSONDecoder = .init()
    ) -> AnyPublisher<T, PhotoClientError> {
        dataTaskPublisher(for: url)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                return element.data
                }
            .decode(type: responseType, decoder: JSONDecoder())
            .mapError({ error in
                PhotoClientError.setup(descritpion: error.localizedDescription)
            })
            .eraseToAnyPublisher()
    }
}
