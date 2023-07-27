//
//  ContentView.swift
//  FacebookUI
//
//  Created by renupunjabi on 6/17/23.
//

import SwiftUI

struct ContentView: View {
    
    let notifications: [Notification] = mockNotifications
    
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Text("Home")
                    Image(systemName: "house.fill")
                }
            FriendPageView()
                .tabItem {
                    VStack {
                        Text("Friends")
                        Image(systemName: "person.3.fill")
                    }
                }
            
            WatchPageView()
                .tabItem {
                    Image(systemName: "play.tv.fill")
                }

            MarketPlaceView()
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Marketplace")
                }
            NavigationView {
                NotificationsView(notifications: notifications)
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarHidden(true)
            }
            .tabItem {
                Image(systemName: "bell.fill")
                Text("Notifications")
            }
            
            Text("Menu")
                .tabItem {
                    Image(systemName: "line.horizontal.3")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
