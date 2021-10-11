//
//  Network.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation
import Combine

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public protocol NetworkProtocol {
    func request<T: Decodable>(url: URL, method: HTTPMethod, resultQueue: DispatchQueue) -> AnyPublisher<T, NetworkError>
}

public final class Network: NetworkProtocol {
    public init(_ urlSesison: URLSession = URLSession.shared) {
        self.urlSesison = urlSesison
    }

    public func request<T: Decodable>(
        url: URL,
        method: HTTPMethod,
        resultQueue: DispatchQueue = .main)-> AnyPublisher<T, NetworkError> {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return self.urlSesison
            .dataTaskPublisher(for: urlRequest)
            .subscribe(on: queue)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ error in
                NetworkError(error: error as NSError)
            })
            .receive(on: resultQueue)
            .eraseToAnyPublisher()
    }

    // MARK: - private variables

    private let queue = DispatchQueue(label: "photoclient.Network.Queue")
    private var urlSesison: URLSession
}
