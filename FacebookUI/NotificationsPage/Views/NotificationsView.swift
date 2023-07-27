//
//  NotificationsView.swift
//  FacebookUI
//
//  Created by Eric Young on 7/12/23.
//


import SwiftUI

struct NotificationsView: View {
    let notifications: [Notification]

    var body: some View {
        ScrollView {
            VStack {
                topBarView()
                
                VStack (spacing: 0){
                    ForEach(sortedSectionKeys, id: \.self) { sectionKey in
                        SectionView(title: sectionKey, notifications: sectionedNotifications[sectionKey]!)
                    }
                }
                .offset(y: -15)
                
            }
        }
        .navigationBarHidden(true)
    }
    
//    Display the notifcations in this order, "New", "Today", "Earlier"
    private var sortedSectionKeys: [String] {
        let sectionKeys = sectionedNotifications.keys.sorted { (key1, key2) in
            if key1 == "New" {
                return true
            } else if key2 == "New" {
                return false
            } else if key1 == "Today" {
                return true
            } else if key2 == "Today" {
                return false
            } else {
                return true
            }
        }
        return sectionKeys
    }
    
    
//    Filter the notifications into their respective sections. "New" "Today" "Earlier"
    private var sectionedNotifications: [String: [Notification]] {
        var sectionedDict: [String: [Notification]] = [:]
        
        let newNotifications = notifications.filter { $0.timeAgo < 3 * 3600 }
        let todayNotifications = notifications.filter { $0.timeAgo >= 3 * 3600 && $0.timeAgo < 24 * 3600 }
        let earlierNotifications = notifications.filter { $0.timeAgo >= 24 * 3600 }
        
        if !newNotifications.isEmpty {
            sectionedDict["New"] = newNotifications.sorted { $0.timeAgo < $1.timeAgo }
        }
        if !todayNotifications.isEmpty {
            sectionedDict["Today"] = todayNotifications.sorted { $0.timeAgo < $1.timeAgo }
        }
        if !earlierNotifications.isEmpty {
            sectionedDict["Earlier"] = earlierNotifications.sorted { $0.timeAgo < $1.timeAgo }
        }
        
        return sectionedDict
    }


}


struct SectionView: View {
    let title: String
    let notifications: [Notification]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.system(size: 20).bold())
                .padding(.leading)
                .padding(.top,6)
            
            ForEach(notifications) { notification in
                NotificationCell(notification: notification)
            }
        }
    }
}


struct topBarView: View {
    
    static let color = Color(red: 228/255, green: 229/255, blue: 235/255);
    
    var body: some View {
        HStack {
            Text("Notifications")
                .font(.system(size: 30).bold())
                .foregroundColor(.primary)
            
            Spacer()
            
            
            HStack{
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    ZStack {
                        Circle()
                            .fill(Self.color)
                            .frame(width: 40, height: 40)
                        
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 25).bold())
                            .foregroundColor(.primary)
                    }
                }

                
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    ZStack {
                        Circle()
                            .fill(Self.color)
                            .frame(width: 40, height: 40)
                        
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 25).bold())
                            .foregroundColor(.primary)
                    }
                }
                
                
                Button(action: {
                    // Action to perform when the button is tapped
                }) {
                    ZStack {
                        Circle()
                            .fill(Self.color)
                            .frame(width: 40, height: 40)
                        
                        Image("FB_Messenger_Icon")
                            .resizable()
                            .frame(width:25,height:25)
                        
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}


struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(notifications: mockNotifications)
    }
}
