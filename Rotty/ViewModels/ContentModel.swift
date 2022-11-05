//
//  ContentModel.swift
//  Rotty
//
//  Created by Rostislav Brož on 9/28/22.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    
    // MARK: State vars
    
    @AppStorage("onboardingShown") var onboardingShown = false
    @AppStorage("isDarkMode") var isDarkMode = false
    @AppStorage("showingHelpView") var showingHelpView = false
    @AppStorage("showingMissionsView") var showingMissionsView = false
    
    @AppStorage("points") var points = 0
    @AppStorage("currentLevel") var currentLevel = 0
    @AppStorage("isLevel0") var isLevel0 = true
    @AppStorage("isLevel1") var isLevel1 = false
    @AppStorage("isLevel2") var isLevel2 = false
    @AppStorage("isLevel3") var isLevel3 = false
    @AppStorage("isLevel4") var isLevel4 = false
    @AppStorage("isLevel5") var isLevel5 = false
    @AppStorage("isLevel6") var isLevel6 = false
    @AppStorage("isLevel7") var isLevel7 = false
    @AppStorage("isLevel8") var isLevel8 = false
    
    
    func checkLevel() {
        
        if points > 799 {
         
            currentLevel = 8
            isLevel7 = false
            isLevel8 = true
            
        } else if points > 699 {
            
            currentLevel = 7
            isLevel6 = false
            isLevel7 = true
            isLevel8 = false
            
        } else if points > 599 {
            
            currentLevel = 6
            isLevel5 = false
            isLevel6 = true
            isLevel7 = false
            
        } else if points > 499 {
            
            currentLevel = 5
            isLevel4 = false
            isLevel5 = true
            isLevel6 = false
            
        } else if points > 399 {
            
            currentLevel = 4
            isLevel3 = false
            isLevel4 = true
            isLevel5 = false
            
        } else if points > 299 {
            
            currentLevel = 3
            isLevel2 = false
            isLevel3 = true
            isLevel4 = false
            
        } else if points > 199 {
            
            currentLevel = 2
            isLevel1 = false
            isLevel2 = true
            isLevel3 = false
            
        } else if points > 99 {
            
            currentLevel = 1
            isLevel0 = false
            isLevel1 = true
            isLevel2 = false
            
        } else if points < 100 {
            
            currentLevel = 0
            isLevel1 = false
            isLevel0 = true
            
        }
        
    }
    
}
