//
//  NotificationModel.swift
//  FacebookUI
//
//  Created by Eric Young on 7/12/23.
//

import Foundation
import SwiftUI

struct User: Identifiable {
    let id = UUID()
    var firstName: String?
    var lastName: String?
    var profilePicture: String
    
    var getFullName: String {
        if let firstName = firstName, let lastName = lastName {
            return firstName + " " + lastName
        } else if let firstName = firstName {
            return firstName
        } else if let lastName = lastName {
            return lastName
        } else {
            return ""
        }
    }
}

struct PostTest {
    let userID : UUID?
    let user : User?
    var postContent : String?
    var image : [String]?
    var video : [String]?
    let timePosted : Date
    let location : String?
    let group : String?
    
    func getPostLocation() -> String {
        if let location = location {
            return " at \(location)"
        } else {
            return ""
        }
    }
}

struct Notification : Identifiable{
    let id = UUID()
    let post : PostTest?
    let typeOfNotification: TypeOfNotification
    let timeAgo: TimeInterval
    let relatedUsers: [User]?
    let relatedPosts: [PostTest]?
    var isRead : Bool
    
}


enum TypeOfNotification : String {
    case post = "post"
    case birthday = "birthday"
    case location = "location"
    case reminder = "reminder"
    case memories = "memories"
}

//Mock Data

let mockUsers : [User] = [
    User(firstName: "Edwin", lastName: "Higgins", profilePicture: "EdwinHiggins.png"),
    User(firstName: "Brenda", lastName: "Tran", profilePicture: "BrendaTran.png"),
    User(firstName: "Elijah", lastName: "Johnson", profilePicture: "Elijah.png"),
    User(firstName: "Elise", lastName: "Brown", profilePicture: "Elise.png"),
    User(firstName: "Juan", lastName: "Taylor", profilePicture: "JuanTaylor.png"),
    User(firstName: "Kiran", lastName: "Sheikh", profilePicture: "Kiran.png"),
    User(firstName: "Amber", lastName: "Farrell", profilePicture: "AmberFarrell.png"),
    User(firstName: "Briony", lastName: "Lynn", profilePicture: "BrionyLynn.png"),
    User(firstName: "Stephen", lastName: "Curry", profilePicture: "StephCurry.png"),
    User(firstName: "Brock", lastName: "Purdy", profilePicture: "BrockPurdy.png")
]

let mockPosts: [PostTest] = [
    PostTest(userID: mockUsers[0].id, user: mockUsers[0], postContent: "Hello, everyone!", image: ["photo.jpg"], video: nil, timePosted: Date(), location: nil, group : "Bay Area Programmers"),
    PostTest(userID: mockUsers[1].id, user: mockUsers[1], postContent: "Check out this amazing video!", image: nil, video: ["video.jpg"], timePosted: Date(), location: nil, group : "Quintrix"),
    PostTest(userID: mockUsers[2].id, user: mockUsers[2], postContent: "Throwback to a fun day!", image: nil, video: nil, timePosted: Date(), location: nil, group : nil),
    PostTest(userID: mockUsers[3].id, user: mockUsers[3], postContent: "Sharing my thoughts...", image: ["photo.jpg"], video: ["video.jpg"], timePosted: Date(), location: nil, group : nil),
//    Birthday
    PostTest(userID: nil, user: nil, postContent: nil, image: nil, video: nil, timePosted: Date(), location: nil, group : nil),
    PostTest(userID: mockUsers[5].id, user: mockUsers[5], postContent: "Hello, everyone!", image: nil, video: nil, timePosted: Date(), location: nil, group : nil),
    PostTest(userID: mockUsers[6].id, user: mockUsers[6], postContent: "Check out this amazing photo!", image: ["photo.jpg"], video: nil, timePosted: Date(), location: nil, group : "Quintrix"),
    PostTest(userID: mockUsers[7].id, user: mockUsers[7], postContent: "Throwback to a fun day!", image: nil, video: nil, timePosted: Date(), location: nil, group : nil),
    PostTest(userID: mockUsers[8].id, user: mockUsers[8], postContent: "Announcing my next shoe", image: ["photo.jpg"], video: nil, timePosted: Date(), location: nil, group : nil),
    PostTest(userID: mockUsers[9].id, user: mockUsers[9], postContent: "Sunday can't come sooner 👀", image: nil, video: nil, timePosted: Date(), location: nil, group : "San Francisco 49ers")
]

let mockNotification = Notification(post: mockPosts[5], typeOfNotification: .post, timeAgo: TimeInterval(8400), relatedUsers: nil, relatedPosts: nil, isRead : false)
//let mockNotification = Notification(post: nil, typeOfNotification: .birthday, timeAgo: TimeInterval(80000), relatedUsers: [mockUsers[8], mockUsers[9]], relatedPosts: nil)
//let mockNotification = Notification(post: mockPosts[2], typeOfNotification: .memories, timeAgo: TimeInterval(7200), relatedUsers: [mockUsers[6]], relatedPosts: nil, isRead : true)
//let mockNotification = Notification(post: mockPosts[0], typeOfNotification: .post, timeAgo: TimeInterval(3600), relatedUsers: [mockUsers[0]], relatedPosts: [mockPosts[0]], isRead : false)

let mockNotifications : [Notification] = [
    Notification(post: mockPosts[0], typeOfNotification: .post, timeAgo: TimeInterval(1800), relatedUsers: [mockUsers[0]], relatedPosts: [mockPosts[0]], isRead : false),
    Notification(post: mockPosts[1], typeOfNotification: .post, timeAgo: TimeInterval(2400), relatedUsers: nil, relatedPosts: nil, isRead : false),
//    Memory Notification
    Notification(post: mockPosts[2], typeOfNotification: .memories, timeAgo: TimeInterval(3600), relatedUsers: [mockUsers[6]], relatedPosts: nil, isRead : true),
    Notification(post: mockPosts[3], typeOfNotification: .post, timeAgo: TimeInterval(7200), relatedUsers: nil, relatedPosts: nil, isRead : false),
//    Birthday Notification
    Notification(post: nil, typeOfNotification: .birthday, timeAgo: TimeInterval(16000), relatedUsers: [mockUsers[8], mockUsers[9]], relatedPosts: nil, isRead : true),
    Notification(post: mockPosts[5], typeOfNotification: .post, timeAgo: TimeInterval(86400), relatedUsers: nil, relatedPosts: nil, isRead : true),
    Notification(post: mockPosts[6], typeOfNotification: .post, timeAgo: TimeInterval(172800), relatedUsers: nil, relatedPosts: nil, isRead : true),
    Notification(post: mockPosts[7], typeOfNotification: .post, timeAgo: TimeInterval(259200), relatedUsers: nil, relatedPosts: nil, isRead : false),
    Notification(post: mockPosts[8], typeOfNotification: .post, timeAgo: TimeInterval(270000), relatedUsers: nil, relatedPosts: nil, isRead : false),
    Notification(post: mockPosts[9], typeOfNotification: .post, timeAgo: TimeInterval(345600), relatedUsers: nil, relatedPosts: nil, isRead : false),
    Notification(post: mockPosts[0], typeOfNotification: .post, timeAgo: TimeInterval(196000), relatedUsers: [mockUsers[0]], relatedPosts: [mockPosts[0]], isRead : false),
    Notification(post: mockPosts[1], typeOfNotification: .post, timeAgo: TimeInterval(19600), relatedUsers: [mockUsers[0]], relatedPosts: [mockPosts[0]], isRead : true),
    Notification(post: mockPosts[3], typeOfNotification: .post, timeAgo: TimeInterval(20000), relatedUsers: [mockUsers[0]], relatedPosts: [mockPosts[0]], isRead : false),
    Notification(post: mockPosts[6], typeOfNotification: .post, timeAgo: TimeInterval(24000), relatedUsers: [mockUsers[0]], relatedPosts: [mockPosts[0]], isRead : true),
]
