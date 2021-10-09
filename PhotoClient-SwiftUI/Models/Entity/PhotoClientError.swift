//
//  PhotoClientError.swift
//  PhotoClientModels
//
//  Created by Đinh Văn Nhật on 2021/10/09.
//

import Foundation

public enum PhotoClientError: Error {
    case parsing(descritpion: String)
    case setup(descritpion: String)
}
