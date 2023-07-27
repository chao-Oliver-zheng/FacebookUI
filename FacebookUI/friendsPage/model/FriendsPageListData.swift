//
//  FriendsData.swift
//  FacebookUI
//
//  Created by Cameron on 6/24/23.
//

import Foundation

/// Data displayed for one individual friend on the friends page.
struct FriendsPageListingData: Identifiable {
    let id = UUID()
    let name: String
    let firstName: String
    let lastName: String
    let numMutualFriends: Int
    var follow: Bool
    /// Will be used to get asset image for now, until we need something different at a later point.
    let profilePicturePath: String
    var message: [Messages]?
    var online: Bool
    static var dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return formatter
        }()
    static var messagData1: [Messages] = [ Messages(id: "1", text: "Hello!", received: true, timestamp: dateFormatter.date(from: "2023-07-26 10:30:00")!),
                                       Messages(id: "2", text: "Hi there!", received: false, timestamp: dateFormatter.date(from: "2023-07-26 11:45:00")!),
                                       Messages(id: "3", text: "How are you?", received: true, timestamp: dateFormatter.date(from: "2023-07-26 12:15:00")!),
                                       Messages(id: "4", text: "I'm doing great!", received: false, timestamp: dateFormatter.date(from: "2023-07-26 13:00:00")!)
    ]
    static var messageData2: [Messages] = [
        Messages(id: "5", text: "This is a new message.", received: true, timestamp: dateFormatter.date(from: "2023-07-26 10:35:00")!),
        Messages(id: "6", text: "Another new message.", received: false, timestamp: dateFormatter.date(from: "2023-07-26 10:40:00")!),
        Messages(id: "7", text: "A different message.", received: true, timestamp: dateFormatter.date(from: "2023-07-26 10:45:00")!),
        Messages(id: "8", text: "Yet another message.", received: false, timestamp: dateFormatter.date(from: "2023-07-26 10:50:00")!),
    ]
    static var messageData3: [Messages] = [
        Messages(id: "9", text: "Hey there!", received: true, timestamp: dateFormatter.date(from: "2023-07-26 10:55:00")!),
        Messages(id: "10", text: "What's up?", received: false, timestamp: dateFormatter.date(from: "2023-07-26 11:00:00")!),
        Messages(id: "11", text: "Just checking in.", received: true, timestamp: dateFormatter.date(from: "2023-07-26 11:05:00")!),
        Messages(id: "12", text: "Let's catch up soon.", received: false, timestamp: dateFormatter.date(from: "2023-07-26 11:10:00")!),
    ]
    /// Names generated using mock database info website.
    /// Images generated with AI using Midjourney.
    //add the date with first name and last name
    static var mockData: [FriendsPageListingData] = [
        FriendsPageListingData(name: "Amber Farrell", firstName: "Amber", lastName: "Farrell", numMutualFriends: 23, follow: false,
                               profilePicturePath: "FriendPage_AmberFarrell", message: messagData1, online: true),
        FriendsPageListingData(name: "Brenda Tran", firstName: "Brenda", lastName: "Tran",  numMutualFriends: 21, follow: true,
                               profilePicturePath: "FriendPage_BrendaTran", online: false),
        FriendsPageListingData(name: "Briony Lynn", firstName: "Briony", lastName: "Lynn", numMutualFriends: 21, follow: true,
                               profilePicturePath: "FriendPage_BrionyLynn", online: false),
        FriendsPageListingData(name: "Edwin Higgins", firstName: "Edwin", lastName: "Higgins", numMutualFriends: 30, follow: true,
                               profilePicturePath: "FriendPage_EdwinHiggins", online: false),
        FriendsPageListingData(name: "Elijah Erten", firstName: "Elijah", lastName: "Erten",  numMutualFriends: 2, follow: true,
                               profilePicturePath: "FriendPage_Elijah", online: false),
        FriendsPageListingData(name: "Elise Diep", firstName: "Elise", lastName: "Diep", numMutualFriends: 7, follow: true,
                               profilePicturePath: "FriendPage_Elise",message: messageData2, online: false),
        FriendsPageListingData(name: "Juan Taylor", firstName: "Juan", lastName: "Taylor", numMutualFriends: 10, follow: true,
                               profilePicturePath: "FriendPage_JuanTaylor", online: false),
        FriendsPageListingData(name: "Kiran Bruno", firstName: "Kiran", lastName: "Bruno",  numMutualFriends: 15, follow: true,
                               profilePicturePath: "FriendPage_Kiran", online: false),
        FriendsPageListingData(name: "Michelle Manson", firstName: "Michelle", lastName: "Manson", numMutualFriends: 16, follow: false,
                               profilePicturePath: "FriendPage_MichelleManson",message: messageData3, online: false),
        FriendsPageListingData(name: "Peter Barut", firstName: "Peter", lastName: "Barut", numMutualFriends: 5, follow: true,
                               profilePicturePath: "FriendPage_Peter", online: true)
    ]
}

struct Messages: Identifiable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
    
}

class ViewModel: ObservableObject {
    
    @Published var mockData: [FriendsPageListingData] = FriendsPageListingData.mockData

    func unfollowFriend(_ friend: FriendsPageListingData) {
        if let index = mockData.firstIndex(where: {$0.id == friend.id}) {
            
            FriendsPageListingData.mockData[index].follow.toggle()
            
            for obj in mockData{
                if obj.follow == false{
                    print(obj.name)
                }
                
            }
        }
    }
}
