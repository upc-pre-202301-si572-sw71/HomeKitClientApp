//
//  ContentView.swift
//  HomeKitClientApp
//
//  Created by Usuario de proyectos on 25/5/23.
//

import SwiftUI
import HomeKit

struct HomeView: View {
    @ObservedObject var model: HomeStore
    
    var body: some View {
        List {
            Section(header: HStack {
                Text("My Home")
            }) {
                ForEach(model.homes, id: \.uniqueIdentifier) { home in
                    Text("\(home.name)")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(model: HomeStore())
    }
}

