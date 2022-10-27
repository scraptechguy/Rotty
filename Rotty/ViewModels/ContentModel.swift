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
    
    // Stored as @State var for testing purposes
    @AppStorage("onboardingShown") var onboardingShown = false

    @State var showingAccountView: Bool = false
    
}
