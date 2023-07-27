//
//  NotificationCell.swift
//  FacebookUI
//
//  Created by Eric Young on 7/12/23.
//

import SwiftUI
import Foundation

struct NotificationCell: View {
    let notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
    }
    
    @State private var isSheetPresented = false
    
    let blueGradient = ColorConstants.blueGradient
    let redGradient = ColorConstants.redGradient
    
    
    var notificationMessage: Text {
        generateNotificationMessage(for: notification)
    }
    
    var body: some View {
        HStack {
            VStack {
                ZStack {
                    
//                    Profile Picture based on type of notification
                    if(notification.typeOfNotification == .birthday) {
                        
                        if let profPic = notification.relatedUsers?.first?.profilePicture {
                            
                            Image(uiImage: UIImage(named: profPic) ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                                .clipShape(Circle())
                        }
                    } else {
                        Image(uiImage: UIImage(named : notification.post?.user?.profilePicture ?? "person.fill") ?? UIImage(systemName : "person.fill")!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                            .clipShape(Circle())
                    }
                    
                    
                    
//                    Handles sub image based on the type of notification & post contents
                    ZStack {
                        
                        if(notification.post?.group != nil) {
                            Circle()
                                .fill(LinearGradient(
                                    gradient: blueGradient,
                                    startPoint:.top,
                                    endPoint: .bottom
                                ))
                                .frame(width: 35, height: 35)
                            
                            Image(systemName: "person.3.fill")
                                .font(.system(size: 15).bold())
                                .foregroundColor(.white)
                        } else  {
                            
                            if(notification.typeOfNotification == .post) {
                                if(notification.post?.image != nil && notification.post?.video != nil) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: blueGradient,
                                            startPoint:.top,
                                            endPoint: .bottom
                                        ))
                                        .frame(width: 35, height: 35)
                                    
                                    Image(systemName: "play.rectangle.on.rectangle.fill")
                                        .font(.system(size: 16).bold())
                                        .foregroundColor(.white)
                                }
                                else if(notification.post?.image != nil) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: blueGradient,
                                            startPoint:.top,
                                            endPoint: .bottom
                                        ))
                                        .frame(width: 35, height: 35)
                                    
                                    Image(systemName: "photo")
                                        .font(.system(size: 20).bold())
                                        .foregroundColor(.white)
                                } else if (notification.post?.video != nil) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: blueGradient,
                                            startPoint:.top,
                                            endPoint: .bottom
                                        ))
                                        .frame(width: 35, height: 35)
                                    
                                    Image(systemName: "play.tv.fill")
                                        .font(.system(size: 16).bold())
                                        .foregroundColor(.white)
                                } else {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: blueGradient,
                                            startPoint:.top,
                                            endPoint: .bottom
                                        ))
                                        .frame(width: 35, height: 35)
                                    
                                    Image(systemName: "note.text")
                                        .font(.system(size: 20).bold())
                                        .foregroundColor(.white)
                                }
                            }
                            
                            
                            if(notification.typeOfNotification == .birthday) {
                                Circle()
                                    .fill(LinearGradient(
                                        gradient: redGradient,
                                        startPoint:.top,
                                        endPoint: .bottom
                                    ))
                                    .frame(width: 35, height: 35)
                                
                                Image(systemName: "birthday.cake.fill")
                                    .font(.system(size: 16).bold())
                                    .foregroundColor(.white)
                            }
                            
                            if(notification.typeOfNotification == .memories) {
                                Circle()
                                    .fill(LinearGradient(
                                        gradient : blueGradient,
                                        startPoint :. top,
                                        endPoint : .bottom
                                    ))
                                    .frame(width:35, height:35)
                                
                                Image(systemName : "clock.arrow.circlepath")
                                    .font(.system(size:20).bold())
                                    .foregroundColor(.white)
                            }
                        }
                        
                    }
                    .offset(x:30, y:22)
                    
                }
            }
            .padding(.horizontal,10)
            
            
//            Display the notification message based on type of event
            VStack {
                HStack {
                    if notification.typeOfNotification == .birthday {
                        Text("\(notificationMessage)")
                            .font(.subheadline)
                            .frame(width: 225, alignment: .leading)
                            .lineLimit(3)
                    } else {
                        Text("\(notificationMessage): \"\(notification.post?.postContent ?? "")\"")
                            .font(.subheadline)
                            .frame(width: 225, alignment: .leading)
                            .lineLimit(3)

                    }
                }
                
                Text(formatTimeAgo(timeAgo: notification.timeAgo))
                    .font(.subheadline)
                    .frame(width:225, alignment: .leading)
                    .foregroundColor(.primary)
                    .opacity(0.7)
                
            }
            
            VStack {
                

                Button(action: {
                    // Set the state variable to true when the button is tapped
                    isSheetPresented = true
                }) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 32))
                        .foregroundColor(.primary)
                }
                .sheet(isPresented: $isSheetPresented) {
                    SheetContentView(notification: notification)
                        .presentationDetents([
                            .height(375),
                            .large])
                    
                }

            }
            .frame(width:50)
        }
        .padding(.vertical,10)
        .frame(maxWidth: .infinity)
        .background(notification.isRead ? .white : .blue.opacity(0.20))
    }
    
    private var profileImage: UIImage {
        if let profilePicture = notification.post?.user?.profilePicture,
           let image = UIImage(named: profilePicture) {
            return image
        } else {
            return UIImage(systemName: "person.fill") ?? UIImage()
        }
    }
    
}

func formattedDate(from date: Date?) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d"
    if let date = date {
        return formatter.string(from: date)
    }
    return ""
}

func formatTimeAgo(timeAgo: TimeInterval) -> String {
    let secondsInMinute: TimeInterval = 60
    let secondsInHour: TimeInterval = 60 * secondsInMinute
    let secondsInDay: TimeInterval = 24 * secondsInHour
    
    if timeAgo < secondsInHour {
        // Less than an hour ago
        let minutes = Int(timeAgo / secondsInMinute)
        return "\(minutes)m"
    } else if timeAgo < secondsInDay {
        // Less than a day ago
        let hours = Int(timeAgo / secondsInHour)
        return "\(hours)h"
    } else {
        // More than a day ago
        let days = Int(timeAgo / secondsInDay)
        return "\(days)d"
    }
}


func getDate(from timeAgo: TimeInterval) -> Date {
    return Date(timeIntervalSinceNow: -timeAgo)
}


struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell(notification: mockNotification)
    }
}
