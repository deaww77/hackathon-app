//
//  mainmenu.swift
//  testapp
//
//  Created by admin on 29/8/24.
//

import Foundation
import SwiftUI

struct MainMenuView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: MenuItemView(menuItem: "Home")) {
                    MenuItemRow(title: "Home")
                }
                NavigationLink(destination: MenuItemView(menuItem: "Profile")) {
                    MenuItemRow(title: "Profile")
                }
                NavigationLink(destination: MenuItemView(menuItem: "Settings")) {
                    MenuItemRow(title: "Settings")
                }
                NavigationLink(destination: MenuItemView(menuItem: "Notifications")) {
                    MenuItemRow(title: "Notifications")
                }
                NavigationLink(destination: MenuItemView(menuItem: "About")) {
                    MenuItemRow(title: "About")
                }
            }
            .navigationTitle("หน้าหลัก")
        }
    }
}

struct MenuItemRow: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
    }
}

struct MenuItemView: View {
    let menuItem: String
    
    var body: some View {
        VStack {
            Text(menuItem)
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle(menuItem)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}
