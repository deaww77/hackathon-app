//
//  testappApp.swift
//  testapp
//
//  Created by admin on 29/8/24.
//

import SwiftUI

@main
struct testappApp: App {
    @State private var isActive: Bool = false
    var body: some Scene {
        WindowGroup {
            loading()
            //LoginView()
        }
    }
}
