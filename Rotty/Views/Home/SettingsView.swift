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
                Section(header: Text("General").foregroundColor(model.isHighContrast ? .primary : .secondary).fontWeight(model.fontIsBold ? .bold : .regular)) {
                    Toggle(isOn: $model.isDarkMode) {
                        Label("Dark mode", systemImage: model.isDarkMode ? "sun.max.fill" : "sun.min")
                            .fontWeight(model.fontIsBold ? .bold : .regular)
                    }
                    
                    HStack {
                        Label("App language", systemImage: "character.book.closed")
                            .fontWeight(model.fontIsBold ? .bold : .regular)
                        
                        Spacer()
                        
                        Text("English")
                            .foregroundColor(model.isHighContrast ? .primary : .secondary)
                            .fontWeight(model.fontIsBold ? .bold : .regular)
                        
                        Image(systemName: "arrow.up.right")
                            .font(.footnote)
                            .foregroundColor(model.isHighContrast ? .primary : .secondary)
                            .fontWeight(model.fontIsBold ? .bold : .regular)
                    }.onTapGesture {
                        if let url = URL(string: UIApplication.openSettingsURLString) {
                            if UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        }
                    }
                }
                
                Section(header: Text("Accessibility").foregroundColor(model.isHighContrast ? .primary : .secondary).fontWeight(model.fontIsBold ? .bold : .regular)) {
                    Toggle(isOn: $model.fontIsBold) {
                        Label("Bold font", systemImage: "character")
                            .fontWeight(model.fontIsBold ? .bold : .regular)
                    }
                    
                    Toggle(isOn: $model.isHighContrast) {
                        Label("High contrast", systemImage: model.isHighContrast ? "eye.fill" : "eye")
                            .fontWeight(model.fontIsBold ? .bold : .regular)
                    }
                    
                    NavigationLink(destination: HelpView().navigationBarTitle("Dictation")) {
                        Label("Dictation", systemImage: "rectangle.3.group.bubble.left")
                            .fontWeight(model.fontIsBold ? .bold : .regular)
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
            .preferredColorScheme(.dark)
    }
}
