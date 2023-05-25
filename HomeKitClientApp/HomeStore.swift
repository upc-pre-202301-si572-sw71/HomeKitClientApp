//
//  HomeStore.swift
//  HomeKitClientApp
//
//  Created by Usuario de proyectos on 25/5/23.
//

import Foundation
import HomeKit
import Combine

class HomeStore: NSObject, ObservableObject, HMHomeManagerDelegate {
    @Published var homes: [HMHome] = []
    private var manager: HMHomeManager!
    
    override init() {
        super.init()
        load()
    }
    
    func load() {
        if manager == nil {
            manager = .init()
            manager.delegate = self
        }
    }
    
    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        print("DEBUG: Updated Homes")
        self.homes = self.manager.homes
    }
    
}
