//
//  SettingsView.swift
//  Rotty
//
//  Created by Rostislav Brož on 1/3/23.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("General").foregroundColor(.secondary)) {
                    Toggle(isOn: $model.isDarkMode) {
                        Label("Light mode", systemImage: model.isDarkMode ? "sun.max.fill" : "sun.min")
                    }
                    
                    HStack {
                        Label("App language", systemImage: "character.book.closed")
                        
                        Spacer()
                        
                        Text("English")
                            .foregroundColor(.secondary)
                        
                        Image(systemName: "arrow.up.right")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }.onTapGesture {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            if UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                    }
                }
            }.navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(ContentModel())
    }
}
