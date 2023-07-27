//
//  FriendProfilePageView.swift
//  FacebookUI
//
//  Created by Edward Kyles on 7/23/23.
//

import SwiftUI

struct FriendsPost {
    let id: Int
    let author: String
    let authorProfileImageName: String
    let timeSincePosted: String
    let content: String
    let imageName: String?
}

struct FriendProfilePageView: View {
    let wall: [FriendsPost] = [
        FriendsPost(id: 1, author: "Amber Farrell", authorProfileImageName: "FriendPage_AmberFarrell", timeSincePosted: "1 hours ago", content: "Yummy, its coffee time!", imageName: "social_media_post1"),
        FriendsPost(id: 2, author: "Brenda Tran", authorProfileImageName: "FriendPage_BrendaTran", timeSincePosted: "3 hours ago",content: "Hanging out with @amberfarrell", imageName: "social_media_post2"),
        FriendsPost(id: 3, author: "Amber Farrell", authorProfileImageName: "FriendPage_AmberFarrell", timeSincePosted: "10 days ago",content: "Laying in bed, my favorite hobby lol", imageName: "social_media_post3"),
        FriendsPost(id: 4, author: "Amber Farrell", authorProfileImageName: "FriendPage_AmberFarrell", timeSincePosted: "3 weeks ago", content: "Felt Cute, might delete", imageName: "social_media_post4"),
        FriendsPost(id: 5, author: "Juan Taylor", authorProfileImageName: "FriendPage_JuanTaylor", timeSincePosted: "2 months ago", content: "Working hard!", imageName: "social_media_post5"),
    ]
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(wall, id: \.id) { post in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(post.authorProfileImageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(post.author)
                                    .font(.headline)
                                Text(post.timeSincePosted)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        Text(post.content)
                            .font(.body)
                        if let imageName = post.imageName {
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .clipped()
                        }
                        Divider()
                        
                        HStack {
                            Button(action: {}) {
                                HStack {
                                    Image(systemName: "hand.thumbsup.fill")
                                        .imageScale(.large)
                                        .foregroundColor(.black)
                                    Text("Like")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                }
                            }
                            Button(action: {}) {
                                HStack {
                                    Image(systemName: "captions.bubble.fill")
                                        .imageScale(.large)
                                        .foregroundColor(.black)
                                    Text("Comment")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                }
                            }
                            Button(action: {}) {
                                HStack {
                                    Image(systemName: "paperplane.fill") 
                                        .imageScale(.large)
                                        .foregroundColor(.black)
                                    Text("Message")
                                        .font(.headline)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                        .padding(.top, 10)
                        
                    }
                    .padding()
                    Divider()
                }
            }
        }
    }
}
struct FriendProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        FriendProfilePageView()
    }
}
