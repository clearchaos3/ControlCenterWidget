//
//  ControlCenterWidgetApp.swift
//  Shared
//
//  Created by Ryan Lee on 6/30/20.
//

import SwiftUI

@main
struct ControlCenterWidgetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(brightness: 100.0, volume: 100.0)
        }
    }
}
