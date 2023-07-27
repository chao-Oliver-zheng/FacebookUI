//
//  HomePageMockData.swift
//  FacebookUI
//
//  Created by Ngoc Nguyen on 6/22/23.
//

import Foundation

//Story Mock data
struct Story {
    let id: String
    let userName: String
    let userProfileImageUrl: String
    let content: [Content]
    var viewed: Bool = false
}

struct Content {
    let type: ContentType
    let url: String
    let postedTime: String
}

enum ContentType: String {
    case image = "image"
    case video = "video"
}

let storyMockData: [Story] = (0..<9).map { index in
    let id = UUID().uuidString
    let content = [Content(type: .image, url: contentImangeUrls[index], postedTime: "\(index)h")]
    return Story(id: id, userName: usernames[index], userProfileImageUrl: profileImageUrls[index], content: content)
}



//Posts Mock Data
struct Post {
    let id: String
    let userName: String
    let userProfileImageUrl: String
    let textContent: String
    let imageUrls: [String]
    let postedTime: String
}

let postMockData: [Post] = (0..<9).map { index in
    let id = UUID().uuidString
    return Post(
        id: id,
        userName: usernames[index],
        userProfileImageUrl: profileImageUrls[index],
        textContent: textContents[index],
        imageUrls: postImageUrls[index],
        postedTime: "\(index)h"
    )
}

//Hardcoded Data
let firstNames = ["John", "Mary", "Paul", "Jessica", "David", "Sara", "Michael", "Amanda", "Robert"]
let lastNames = ["Smith", "Tran", "Parker", "Wilson", "Johnson", "Thomas", "Smith", "Williams", "Jackson"]

let usernames = zip(firstNames, lastNames).map { "\($0) \($1)" }

let profileImageUrls = [
    "https://images.pexels.com/photos/4946515/pexels-photo-4946515.jpeg",
    "https://images.pexels.com/photos/3454298/pexels-photo-3454298.jpeg",
    "https://images.pexels.com/photos/5378700/pexels-photo-5378700.jpeg",
    "https://images.pexels.com/photos/5384445/pexels-photo-5384445.jpeg",
    "https://images.pexels.com/photos/7275385/pexels-photo-7275385.jpeg",
    "https://images.pexels.com/photos/7116213/pexels-photo-7116213.jpeg",
    "https://images.pexels.com/photos/5490276/pexels-photo-5490276.jpeg",
    "https://images.pexels.com/photos/7010696/pexels-photo-7010696.jpeg",
    "https://images.pexels.com/photos/6608313/pexels-photo-6608313.jpeg"
]

let contentImangeUrls = [
    "https://images.pexels.com/photos/4946515/pexels-photo-4946515.jpeg",
    "https://images.pexels.com/photos/3454298/pexels-photo-3454298.jpeg",
    "https://images.pexels.com/photos/5378700/pexels-photo-5378700.jpeg",
    "https://images.pexels.com/photos/5384445/pexels-photo-5384445.jpeg",
    "https://images.pexels.com/photos/7275385/pexels-photo-7275385.jpeg",
    "https://images.pexels.com/photos/7116213/pexels-photo-7116213.jpeg",
    "https://images.pexels.com/photos/5490276/pexels-photo-5490276.jpeg",
    "https://images.pexels.com/photos/7010696/pexels-photo-7010696.jpeg",
    "https://images.pexels.com/photos/6608313/pexels-photo-6608313.jpeg"
]

let textContents = [
    "Enjoying the sunshine at the beach",
    "Just finished a great book! Anyone have any recommendations for what I should read next?",
    "Trying out a new recipe tonight - wish me luck!",
    "Beautiful sunset in the city tonight",
    "Had an amazing time hiking this weekend",
    "Excited to start my new project",
    "Throwback to a fantastic vacation",
    "Feeling grateful for good friends and good times",
    "Getting back into my workout routine - feels great!"
]

let postImageUrls = [
    ["https://images.pexels.com/photos/605408/pexels-photo-605408.jpeg"],
    ["https://images.pexels.com/photos/267586/pexels-photo-267586.jpeg"],
    ["https://images.pexels.com/photos/410648/pexels-photo-410648.jpeg"],
    ["https://images.pexels.com/photos/340874/pexels-photo-340874.jpeg"],
    ["https://images.pexels.com/photos/842155/pexels-photo-842155.jpeg"],
    ["https://images.pexels.com/photos/572056/pexels-photo-572056.jpeg"],
    ["https://images.pexels.com/photos/169193/pexels-photo-169193.jpeg"],
    ["https://images.pexels.com/photos/267202/pexels-photo-267202.jpeg"],
    ["https://images.pexels.com/photos/936075/pexels-photo-936075.jpeg"]
]

let HomePagemockPosts: [PostData] = [
    PostData(userImg: "DefaultProfilePic", userName: "John Doe", datePosted: "Jun 20", suggested: true, postDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempus sollicitudin tincidunt.", postImg: "DefaultPostImg", likes: 50, commentCount: 12, shares: 83),
    PostData(userImg: "DefaultProfilePic", userName: "Mary Jane", datePosted: "Jun 21", suggested: false, postDesc: "Proin commodo ullamcorper massa quis posuere.", postImg: "DefaultPostImg", likes: 100, commentCount: 35, shares: 120),
    PostData(userImg: "DefaultProfilePic", userName: "Peter Parker", datePosted: "Jun 22", suggested: true, postDesc: "Curabitur laoreet purus sed purus lobortis, sit amet mollis ante aliquam.", postImg: "DefaultPostImg", likes: 70, commentCount: 20, shares: 98),
    PostData(userImg: "DefaultProfilePic", userName: "Bruce Wayne", datePosted: "Jun 23", suggested: false, postDesc: "Nam vulputate sem a elit pharetra, vel pharetra erat ullamcorper.", postImg: "DefaultPostImg", likes: 150, commentCount: 55, shares: 143),
    PostData(userImg: "DefaultProfilePic", userName: "Clark Kent", datePosted: "Jun 24", suggested: true, postDesc: "Nulla vitae eros id justo tempor aliquam vitae in mauris.", postImg: "DefaultPostImg", likes: 200, commentCount: 68, shares: 178)
]
