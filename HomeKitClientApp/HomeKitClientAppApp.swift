//
//  HomeKitClientAppApp.swift
//  HomeKitClientApp
//
//  Created by Usuario de proyectos on 25/5/23.
//

import SwiftUI

@available(iOS 16.0, *)
@main
struct HomeKitClientAppApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(model: HomeStore())
        }
    }
}
