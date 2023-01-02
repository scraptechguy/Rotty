//
//  DataController.swift
//  Rotty
//
//  Created by Rostislav Brož on 1/2/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        
        container.loadPersistentStores { desc, error in
            if let error = error {
                
                print("Failed to load data \(error.localizedDescription)")
                
            }
        }
        
    }
    
    func save(context: NSManagedObjectContext) {
        
        do {
            
            try context.save()
            
        } catch {
            
            print("Couldn't save data")
            
        }
        
    }
    
    func addFood(name: String, expiration: Double, context: NSManagedObjectContext) {
        
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.expiration = expiration
        
        save(context: context)
        
    }
    
    func editFood(food: Food, name: String, expiration: Double, context: NSManagedObjectContext) {
        
        food.date = Date()
        food.name = name
        food.expiration = expiration
        
        save(context: context)
        
    }
    
}
