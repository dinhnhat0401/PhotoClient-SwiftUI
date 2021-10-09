//
//  NetworkError.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation

public enum NetworkError: Error {
    case badNetwork(description: String)
    case invalidResponse(description: String)
}
