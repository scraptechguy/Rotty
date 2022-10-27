//
//  OnboardingModel.swift
//  Rotty
//
//  Created by Rostislav Brož on 10/27/22.
//

import SwiftUI

struct Intro: Identifiable {
    
    var id: String = UUID().uuidString
    var imageName: String
    var title: String
    
}

var intros: [Intro] = [

    .init(imageName: "rotty_mad", title: "Don't be a jerk"),
    .init(imageName: "rotty_coolaf", title: "Be cool af"),

]
