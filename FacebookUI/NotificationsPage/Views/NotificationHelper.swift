//
//  NotificationHelper.swift
//  FacebookUI
//
//  Created by Eric Young on 7/15/23.
//

import SwiftUI

func generateNotificationMessage(for notification : Notification) -> Text {
        switch notification.typeOfNotification {
        case .post:
            if let user = notification.post?.user, let individualPost = notification.post {
                if let group = individualPost.group {
                    // If there is a group in the post
                    if individualPost.video != nil && individualPost.image != nil {
                        return Text("\(Text(user.getFullName).bold()) posted a new picture and a video in \(Text(group).bold())")
                    } else if individualPost.video != nil {
                        return Text("\(Text(user.getFullName).bold()) posted a new video in \(Text(group).bold())")
                    } else if individualPost.image != nil {
                        return Text("\(Text(user.getFullName).bold()) posted a new picture in \(Text(group).bold())")
                    } else {
                        return Text("\(Text(user.getFullName).bold()) posted in \(Text(group).bold())")
                    }
                } else {
                    // If there is no group in the post
                    if individualPost.video != nil && individualPost.image != nil {
                        return Text("\(Text(user.getFullName).bold()) posted a new picture and a video")
                    } else if individualPost.video != nil {
                        return Text("\(Text(user.getFullName).bold()) posted a new video")
                    } else if individualPost.image != nil {
                        return Text("\(Text(user.getFullName).bold()) posted a new picture")
                    } else {
                        return Text("\(Text(user.getFullName).bold()) posted")
                    }
                }
            }
        case .birthday:
            if let users = notification.relatedUsers, let firstUser = users.first {
                let birthdaysCount = users.count - 1
                let pluralSuffix = birthdaysCount > 1 ? "s" : ""
                let otherFriendsString = "\(birthdaysCount) other friend\(pluralSuffix)"
                let date = formattedDate(from: getDate(from: notification.timeAgo))
                
                if birthdaysCount > 0 {
                    return Text("\(Text(firstUser.getFullName).bold()) and \(Text(otherFriendsString).bold()) had birthdays on \(date)")
                } else {
                    return Text("\(Text(firstUser.getFullName).bold()) had a birthday on \(date)")
                }
            }
            
        case .location:
            if let firstUser = notification.relatedUsers?.first, let firstPost = notification.relatedPosts?.first {
                let postLocation = firstPost.getPostLocation()
                return Text("\(firstUser.getFullName) is at \(postLocation)")
            } else if let firstUser = notification.relatedUsers?.first {
                return Text("\(firstUser.getFullName)")
            }
        case .reminder:
            if let firstUser = notification.relatedUsers?.first {
                return Text("\(firstUser.getFullName) reminded you about something")
            }
        case .memories:
            if let userNames = notification.relatedUsers?.map({ $0.getFullName }), !userNames.isEmpty {
                let memoriesMessage = userNames.count > 1 ? "memories with" : "a memory with"
                let memoriesText = Text("You have \(memoriesMessage) ")
                + Text(userNames.joined(separator: " and ")).bold()
                + Text(" to look back on today")
                return memoriesText
            }
        }
        return Text("")
}
