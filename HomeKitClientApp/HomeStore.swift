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
    @Published var accessories: [HMAccessory] = []
    @Published var services: [HMService] = []
    @Published var characteristics: [HMCharacteristic] = []
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
    
    func findAccessories(homeId: UUID) {
        guard let devices = homes
            .first(where: {$0.uniqueIdentifier == homeId})?
            .accessories else {
            print("Error: No Accessories found!")
            return
        }
        accessories = devices
    }
    
    func findServices(accessoryId: UUID, homeId: UUID) {
        guard let accessoryServices = homes
            .first(where: {$0.uniqueIdentifier == homeId })?
            .accessories.first(where: {$0.uniqueIdentifier == accessoryId})?
            .services else {
            print("Error: No services found!")
            return
        }
        services = accessoryServices
    }
    
    func findCharacteristics(serviceId: UUID, accessoryId: UUID, homeId: UUID) {
        guard let serviceCharacteristics = homes
            .first(where: {$0.uniqueIdentifier == homeId})?
            .accessories.first(where: {$0.uniqueIdentifier == accessoryId})?
            .services.first(where: {$0.uniqueIdentifier == serviceId})?
            .characteristics else {
            print("Error: No characteristics found!")
            return
        }
        characteristics = serviceCharacteristics
    }
}
