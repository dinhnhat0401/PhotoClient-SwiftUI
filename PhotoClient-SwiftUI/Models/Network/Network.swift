//
//  Network.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation
import Combine

public protocol NetworkProtocol {
//    associatedtype T: Decodable
    func requestJSON(url: String, method: String, parameters: [String: Any]?) -> AnyPublisher<Any, NetworkError>
}

public final class Network<T: Decodable>: NetworkProtocol {
//    public typealias T = M: Decodable

    public init() { }

    public func requestJSON(url: String, method: String, parameters: [String: Any]?) -> AnyPublisher<Any, NetworkError> {
        return URLSession.shared.dataTaskPublisher(for: URLRequest(url:URL(string: url)!))
//            .map(\.data)
//            .decode(type: T.self, decoder: JSONDecoder())
            .mapError({ error in
                NetworkError.invalidResponse(description: error.localizedDescription)
            })
            .map({ output in
                output.data
            })
            .eraseToAnyPublisher()
    }

    // MARK: - private variables

    private let queue = DispatchQueue(label: "photoclient.Network.Queue")
}
