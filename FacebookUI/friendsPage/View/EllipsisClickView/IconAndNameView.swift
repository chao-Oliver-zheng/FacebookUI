//
//  IconAndNameView.swift
//  FacebookUI
//
//  Created by Oliver Zheng on 7/1/23.
//

import SwiftUI

struct IconAndNameView: View {
    var friend: FriendsPageListingData
    var body: some View {
        VStack(alignment: .leading) {
            //This is user name, picture, user since
            HStack{
                Image(friend.profilePicturePath)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.trailing, 6)
                VStack(alignment: .leading){
                    Text(friend.name)
                        .bold()
                        .font(.system(size: 22))
                    Text("Friends since December 2017")
                        .font(.system(size: 16))
                        .opacity(0.6)
                }
            }
            .padding(.horizontal)
            //This is the long horizontal line
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.gray)
                .cornerRadius(30)
                .opacity(0.5)
        }
    }
}

struct IconAndNameView_Previews: PreviewProvider {
    static var previews: some View {
        IconAndNameView(friend: FriendsPageListingData.mockData[0])
    }
}
