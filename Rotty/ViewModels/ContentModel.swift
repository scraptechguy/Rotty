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
    
}
