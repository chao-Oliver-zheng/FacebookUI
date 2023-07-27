//
//  FriendGridView.swift
//  FacebookUI
//
//  Created by Edward Kyles on 7/23/23.
//

import SwiftUI

struct FriendGridView: View {
    struct Friend {
        let name: String
        let imageName: String
        let mutualFriendsCount: Int
    }
    
    let friends: [Friend] = [
        Friend(name: "Brenda Tran", imageName: "FriendPage_BrendaTran", mutualFriendsCount: 10),
        Friend(name: "Briony Lynn", imageName: "FriendPage_BrionyLynn", mutualFriendsCount: 5),
        Friend(name: "Edwin Higgins", imageName: "FriendPage_EdwinHiggins", mutualFriendsCount: 15),
        Friend(name: "Elijah Lyons", imageName: "FriendPage_Elijah", mutualFriendsCount: 20),
        Friend(name: "Elise Jones", imageName: "FriendPage_Elise", mutualFriendsCount: 25),
        Friend(name: "Juan Taylor", imageName: "FriendPage_JuanTaylor", mutualFriendsCount: 30)
    ]
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(friends, id: \.name) { friend in
                    VStack {
                        Image(friend.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                        Text(friend.name)
                            .font(.headline)
                        Text("\(friend.mutualFriendsCount) mutual friends")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
    }
}

struct FriendGridView_Previews: PreviewProvider {
    static var previews: some View {
        FriendGridView()
    }
}
