//
//  RottyApp.swift
//  Rotty
//
//  Created by Rostislav Brož on 9/28/22.
//

import SwiftUI

@main
struct RottyApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
