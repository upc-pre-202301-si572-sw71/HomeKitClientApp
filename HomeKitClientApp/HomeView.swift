//
//  ContentView.swift
//  HomeKitClientApp
//
//  Created by Usuario de proyectos on 25/5/23.
//

import SwiftUI
import HomeKit

@available(iOS 16.0, *)
struct HomeView: View {
    @State private var path = NavigationPath()
    @ObservedObject var model: HomeStore
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section(header: HStack {
                    Text("My Home")
                }) {
                    ForEach(model.homes, id: \.uniqueIdentifier) { home in
                        NavigationLink(value: home) {
                            Text("\(home.name)")
                        }.navigationDestination(for: HMHome.self) {
                            AccessoriesView(homeId: $0.uniqueIdentifier, model: model)
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 16.0, *) {
            HomeView(model: HomeStore())
        } else {
            // Fallback on earlier versions
        }
    }
}

