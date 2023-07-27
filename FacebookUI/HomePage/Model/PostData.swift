//
//  PostData.swift
//  FacebookUI
//
//  Created by Jon Chang on 7/17/23.
//

import Foundation

struct PostData: Identifiable {
    let id = UUID()
    let userImg:String
    let userName:String
    
    let datePosted:String
    let suggested:Bool
    
    let postDesc:String
    let postImg:String
    
    let likes:Int
    let commentCount:Int
    let shares:Int
    
    static let mockPost:PostData = PostData(userImg: "DefaultProfilePic", userName: "Some really long name for a user", datePosted: "Apr 12", suggested: true, postDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tempus sollicitudin tincidunt. Proin commodo ullamcorper massa quis posuere.", postImg: "DefaultPostImg", likes: 50, commentCount: 12, shares: 83)
}
