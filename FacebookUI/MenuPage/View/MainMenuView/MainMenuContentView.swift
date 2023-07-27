//
//  ContentView.swift
//  FacebookMenuPage
//
//  Created by Ajinkya Mate on 6/30/23.
//

import SwiftUI

struct MainMenuContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TopBarView()
                Spacer()
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 380, height: 120)
                        .cornerRadius(10)
                    ProfileCellView()
                }
                Text("Your shortcuts")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                YourShortcutsView()
                
                Text("All shortcuts")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                MenuPageCellsView(cellType: "shortcuts")
            }
            
            
        }
        .background(Color(.systemGray6))
    }
}

struct MainMenuContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuContentView()
    }
}
