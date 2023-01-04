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
                
                Section(header: Text("Information").foregroundColor(model.isHighContrast ? .primary : .secondary).fontWeight(model.fontIsBold ? .bold : .regular)) {
                    NavigationLink(destination: HelpView().navigationBarTitle("Help")) {
                        Label("Help", systemImage: "questionmark")
                            .fontWeight(model.fontIsBold ? .bold : .regular)
                    }.listRowBackground(Color("ListRowBackground"))
                    
                    Link(destination: URL(string: "https://astro.troja.mff.cuni.cz/mira/sh/sh.php")!) {
                        HStack {
                            Label {
                                Text("Website")
                                    .foregroundColor(.primary)
                            } icon: {
                                Image(systemName: "heart.text.square")
                            }.fontWeight(model.fontIsBold ? .bold : .regular)
                            
                            Spacer()
                            
                            Image(systemName: "link")
                                .font(.footnote)
                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                .fontWeight(model.fontIsBold ? .bold : .regular)
                        }
                    }.swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(action: {
                            UIPasteboard.general.string = "https://astro.troja.mff.cuni.cz/mira/sh/sh.php"
                        }, label: {
                            Label("Copy to clipboard", systemImage: "rectangle.on.rectangle")
                        })
                    }
                    .listRowBackground(Color("ListRowBackground"))
                    
                    Link(destination: URL(string: "https://github.com/scraptechguy/Peep/blob/main/docs/PRIVACY.md")!) {
                        HStack {
                            Label {
                                Text("Privacy Policy")
                                    .foregroundColor(.primary)
                            } icon: {
                                Image(systemName: "person.badge.key")
                            }.fontWeight(model.fontIsBold ? .bold : .regular)
                            
                            Spacer()
                            
                            Image(systemName: "link")
                                .font(.footnote)
                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                .fontWeight(model.fontIsBold ? .bold : .regular)
                        }
                    }.swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(action: {
                            UIPasteboard.general.string = "https://github.com/scraptechguy/Peep/blob/main/docs/PRIVACY.md"
                        }, label: {
                            Label("Copy to clipboard", systemImage: "rectangle.on.rectangle")
                        })
                    }
                    .listRowBackground(Color("ListRowBackground"))
                    
                    Link(destination: URL(string: "https://github.com/scraptechguy/Peep")!) {
                        HStack {
                            Label {
                                Text("GitHub")
                                    .foregroundColor(.primary)
                            } icon: {
                                Image(systemName: "xserve")
                            }.fontWeight(model.fontIsBold ? .bold : .regular)
                            
                            Spacer()
                            
                            Image(systemName: "link")
                                .font(.footnote)
                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                .fontWeight(model.fontIsBold ? .bold : .regular)
                        }
                    }.swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(action: {
                            UIPasteboard.general.string = "https://github.com/scraptechguy/Peep"
                        }, label: {
                            Label("Copy to clipboard", systemImage: "rectangle.on.rectangle")
                        })
                    }
                    .listRowBackground(Color("ListRowBackground"))
                    
                    Link(destination: URL(string: "https://apps.apple.com/us/app/p%C3%ADp/id6444575713")!) {
                        HStack {
                            Label {
                                Text("Write a review")
                                    .foregroundColor(.primary)
                            } icon: {
                                Image(systemName: "leaf")
                            }.fontWeight(model.fontIsBold ? .bold : .regular)
                            
                            Spacer()
                            
                            Text("App Store")
                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                .fontWeight(model.fontIsBold ? .bold : .regular)
                            
                            Image(systemName: "arrow.up.right")
                                .font(.footnote)
                                .foregroundColor(model.isHighContrast ? .primary : .secondary)
                                .fontWeight(model.fontIsBold ? .bold : .regular)

                        }
                    }.swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button(action: {
                            UIPasteboard.general.string = "https://apps.apple.com/us/app/p%C3%ADp/id6444575713"
                        }, label: {
                            Label("Copy to clipboard", systemImage: "rectangle.on.rectangle")
                        })
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
    }
}
