//
//  WatchPageView.swift
//  FAC-3
//
//  Created by allyza elnar on 7/11/23.
//

import SwiftUI

// stories cell (fac-14) -> for you tab for watch page
// tabs: for you, live, reels, music, games, sports(?)
// watchpageview includes: header, and diff tabs
// for custom blue for header
extension Color {
    static let fbBlue = Color(red: 201 / 255, green: 228 / 255, blue: 255 / 255)
}

struct WatchHomeView: View {
    
    // for button and view toggling
    @State private var toggleFYP: Bool = true
    @State private var toggleLive: Bool = false
    @State private var toggleReels: Bool = false
    @State private var toggleMusic: Bool = false
    @State private var toggleGames: Bool = false
    @State private var toggleSports: Bool = false
    
    var body: some View {
        
        // header vstack for the diff tabs / views
        VStack {
            
            // main watch title
            Text("Watch")
                .font(.system(size: 40))
                .bold()
                .frame(maxWidth: 360, alignment: .topLeading)
            
            Spacer()
            
                // tabs
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    
                    // stack of tabs, made them all buttons
                    // so i could toggle the bg color for them
                    HStack {
                        
                        // for each button, toggle the background and also
                        // this will determine what view shows up underneath
                        Button(action: {
                            self.toggleFYP = true
                            self.toggleLive = false
                            self.toggleReels = false
                            self.toggleMusic = false
                            self.toggleGames = false
                            self.toggleSports = false
                        } ){
                          Text("For You")
                                .font(.system(size: 24))
                                .padding(10)
                        }
                        .background(toggleFYP ? Color.fbBlue : Color.white)
                        .foregroundColor(toggleFYP ? Color.blue : Color.black)
                        .cornerRadius(10)
                        
                        Button(action: {
                            self.toggleFYP = false
                            self.toggleLive = true
                            self.toggleReels = false
                            self.toggleMusic = false
                            self.toggleGames = false
                            self.toggleSports = false
                        } ) {
                        Text("Live")
                            .font(.system(size: 24))
                            .padding(10)
                        }
                        .background(toggleLive ? Color.fbBlue : Color.white)
                        .foregroundColor(toggleLive ? Color.blue : Color.black)
                        .cornerRadius(10)
                        
                        Button(action: {
                            self.toggleFYP = false
                            self.toggleLive = false
                            self.toggleReels = true
                            self.toggleMusic = false
                            self.toggleGames = false
                            self.toggleSports = false
                        } ) {
                        Text("Reels")
                            .font(.system(size: 24))
                            .padding(10)
                        }
                        .background(toggleReels ? Color.fbBlue : Color.white)
                        .foregroundColor(toggleReels ? Color.blue : Color.black)
                        .cornerRadius(10)
                        
                        Button(action: {
                            self.toggleFYP = false
                            self.toggleLive = false
                            self.toggleReels = false
                            self.toggleMusic = true
                            self.toggleGames = false
                            self.toggleSports = false
                        } ) {
                        Text("Music")
                            .font(.system(size: 24))
                            .padding(10)
                        }
                        .background(toggleMusic ? Color.fbBlue : Color.white)
                        .foregroundColor(toggleMusic ? Color.blue : Color.black)
                        .cornerRadius(10)
                        
                        Button(action: {
                            self.toggleFYP = false
                            self.toggleLive = false
                            self.toggleReels = false
                            self.toggleMusic = false
                            self.toggleGames = true
                            self.toggleSports = false
                        } ) {
                        Text("Games")
                            .font(.system(size: 24))
                            .padding(10)
                        }
                        .background(toggleGames ? Color.fbBlue : Color.white)
                        .foregroundColor(toggleGames ? Color.blue : Color.black)
                        .cornerRadius(10)
                        
                        Button(action: {
                            self.toggleFYP = false
                            self.toggleLive = false
                            self.toggleReels = false
                            self.toggleMusic = false
                            self.toggleGames = false
                            self.toggleSports = true
                        } ) {
                        Text("Sports")
                            .font(.system(size: 24))
                            .padding(10)
                        }
                        .background(toggleSports ? Color.fbBlue : Color.white)
                        .foregroundColor(toggleSports ? Color.blue : Color.black)
                        .cornerRadius(10)
                        
                    } // tabs hstack end
                } // scrollview tabs end
                .frame(maxWidth: 360, maxHeight: .infinity, alignment: .topLeading)
                .clipped() // end scrollview mods
            
            Spacer()
            
            // where views are toggled based on button states
            // default will be fyp view
            // since there's only fyp view the other tabs have mock views
            if(toggleLive) { // live view
                Mock2View()
            }
            else if (toggleReels) {
                Mock1View()
            }
            else if (toggleMusic) {
                Mock2View()
            }
            else if (toggleGames) {
                Mock1View()
            }
            else if (toggleSports) {
                Mock2View()
            }
            else { // last view -> default
                // fyp view, where short stories view should go
                WatchPageView()
            }
            
        } // main vstack end
        
    }
}

struct WatchHomeView_Previews: PreviewProvider {
    static var previews: some View {
        WatchHomeView()
    }
}
