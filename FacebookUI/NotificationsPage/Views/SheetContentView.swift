//
//  SheetContentView.swift
//  FacebookUI
//
//  Created by Eric Young on 7/14/23.
//

import SwiftUI

struct SheetContentView: View {
    
    let notification : Notification
    
    static let color = Color(red: 228/255, green: 229/255, blue: 235/255);
    
    let blueGradient = ColorConstants.blueGradient
    let redGradient = ColorConstants.redGradient

    var notificationMessage: Text {
        generateNotificationMessage(for: notification)
    }
    
    var body: some View {
        VStack {
            ZStack {
                
                // Profile Picture based on type of notification
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
            
            HStack {
                
                Spacer()
                
                if notification.typeOfNotification == .birthday {
                    Text("\(notificationMessage)")
                        .font(.subheadline)
                        .lineLimit(nil)
                } else {
                    Text("\(notificationMessage): \"\(notification.post?.postContent ?? "")\"")
                        .font(.subheadline)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
            }
            
            Divider()
            
//            Display different options based on type of notification
            if notification.typeOfNotification == .birthday {
                VStack (alignment: .leading){
                    
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Self.color)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "xmark.rectangle.fill")
                                    .font(.system(size: 20).bold())
                                    .foregroundColor(.primary)
                            }
                            
                            Text("Remove this notification")
                                .foregroundColor(.primary)
                            
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Self.color)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "rectangle.stack.fill")
                                    .font(.system(size: 20).bold())
                                    .foregroundColor(.primary)
                                
                                Image(systemName : "xmark")
                                    .font(.system(size:14).bold())
                                    .foregroundColor(.white)
                                    .offset(y:3)
                                
                            }
                            
                            Text("Turn off notifications about friends' birthdays")
                                .foregroundColor(.primary)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.leading)
                            
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Self.color)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "exclamationmark.bubble.fill")
                                    .font(.system(size: 20).bold())
                                    .foregroundColor(.primary)
                            }
                            
                            Text("Report issue to Notifications Team")
                                .foregroundColor(.primary)
                            
                        }
                    }
                    
                }
            } else if notification.post?.group != nil {
                VStack (alignment: .leading){
                    
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Self.color)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "xmark.rectangle.fill")
                                    .font(.system(size: 20).bold())
                                    .foregroundColor(.primary)
                            }
                            
                            Text("Remove this notification")
                                .foregroundColor(.primary)
                            
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Self.color)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 25).bold())
                                    .foregroundColor(.primary)
                                
                                Image(systemName : "person.3.fill")
                                    .font(.system(size:10).bold())
                                    .foregroundColor(.white)
                                
                            }
                            
                            Text("Only get notifications about friends' posts from this group")
                                .foregroundColor(.primary)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.leading)
                            
                        }
                    }
                    
                    
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Self.color)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "exclamationmark.bubble.fill")
                                    .font(.system(size: 20).bold())
                                    .foregroundColor(.primary)
                            }
                            
                            Text("Report issue to Notifications Team")
                                .foregroundColor(.primary)
                            
                        }
                    }
                    
                }
            } else if notification.typeOfNotification == .memories {
                VStack (alignment: .leading){
                    
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Self.color)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "xmark.rectangle.fill")
                                    .font(.system(size: 20).bold())
                                    .foregroundColor(.primary)
                            }
                            
                            Text("Remove this notification")
                                .foregroundColor(.primary)
                            
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Self.color)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "circle.fill")
                                    .font(.system(size: 28).bold())
                                    .foregroundColor(.primary)
                                
                                Image(systemName : "clock.arrow.circlepath")
                                    .font(.system(size:18).bold())
                                    .foregroundColor(.white)
                                    .offset(x:-1)
                                
                            }
                            
                            Text("Turn off notifications about memories")
                                .foregroundColor(.primary)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.leading)
                            
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Self.color)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "exclamationmark.bubble.fill")
                                    .font(.system(size: 20).bold())
                                    .foregroundColor(.primary)
                            }
                            
                            Text("Report issue to Notifications Team")
                                .foregroundColor(.primary)
                            
                        }
                    }
                    
                }
            } else {
                VStack (alignment: .leading){
                    
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Self.color)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "xmark.rectangle.fill")
                                    .font(.system(size: 20).bold())
                                    .foregroundColor(.primary)
                            }
                            
                            Text("Remove this notification")
                                .foregroundColor(.primary)
                            
                        }
                    }
                    
                    HStack {
                        Button(action: {
                            // Action to perform when the button is tapped
                        }) {
                            ZStack {
                                Circle()
                                    .fill(Self.color)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: "exclamationmark.bubble.fill")
                                    .font(.system(size: 20).bold())
                                    .foregroundColor(.primary)
                            }
                            
                            Text("Report issue to Notifications Team")
                                .foregroundColor(.primary)
                            
                        }
                    }
                    
                }
            }
        }
        .frame(height:400)
        .padding(.horizontal,10)
    }
}

struct SheetContentView_Previews: PreviewProvider {
    static var previews: some View {
        SheetContentView(notification: mockNotification)
    }
}
