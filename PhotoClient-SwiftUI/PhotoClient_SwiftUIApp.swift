//
//  PhotoClient_SwiftUIApp.swift
//  PhotoClient-SwiftUI
//
//  Created by Đinh Văn Nhật on 2021/10/07.
//

import SwiftUI

@main
struct PhotoClient_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            GeometryReader { geometry in
                VStack {
                    ContentView()
                }.frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
        }
    }
}
