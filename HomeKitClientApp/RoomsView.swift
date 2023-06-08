//
//  RoomsView.swift
//  HomeKitClientApp
//
//  Created by Usuario de proyectos on 8/6/23.
//

import SwiftUI
import HomeKit

struct RoomsView: View {
    var homeId: UUID
    @ObservedObject var model: HomeStore
    
    var body: some View {
        List {
            Section(header: HStack {
                Text("My Rooms")
            }) {
                ForEach(model.rooms, id: \.uniqueIdentifier) { room in
                    NavigationLink(value: room) {
                        Text("\(room.name)")
                    }.navigationDestination(for: HMRoom.self) {_ in
                        AccessoriesView(homeId: homeId, model: model)
                    }
                }
                Button("Add another room") {
                    // addRoom
                }
            }
            Button("Remove this Home") {
                
            }
        }
    
    }.onAppear() {
        model.findRooms(homeId: homeId)
    }
}

