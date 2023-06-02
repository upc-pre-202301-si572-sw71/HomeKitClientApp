//
//  ServicesView.swift
//  HomeKitClientApp
//
//  Created by Usuario de proyectos on 2/6/23.
//

import SwiftUI
import HomeKit

@available(iOS 16.0, *)
struct ServicesView: View {
    var accessoryId: UUID
    var homeId: UUID
    
    @ObservedObject var model: HomeStore
    
    var body: some View {
        List {
            Section(header: HStack {
                Text("Services")
            }) {
                ForEach(model.services, id: \.uniqueIdentifier) { service in
                    NavigationLink(value: service) {
                        Text("\(service.name)")
                    }.navigationDestination(for: HMService.self) {_ in 
                        // TODO: Add Characteristics View
                    }
                    
                }
            }
        }
    }
}

