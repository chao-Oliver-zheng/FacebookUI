//
//  FriendButtonView.swift
//  FacebookUI
//
//  Created by Oliver Zheng on 7/1/23.
//

import SwiftUI

struct FriendButtonView: View {
    var friend: FriendsPageListingData
    @Binding var isShowingMenu: Bool
    var body: some View {
        Button(action: {
            $isShowingMenu.wrappedValue = false
        }) {
            ZStack{
                Circle()
                    .foregroundColor(.gray)
                    .opacity(0.3)
                    .frame(width: 35, height: 35)
                Image(systemName: "person.fill.xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 23, height: 23)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 6)
            VStack(alignment: .leading){
                Text("Unfriend \(friend.firstName)")
                    .font(.system(size: 18))
                Text("Remove \(friend.firstName) as a friend.")
                    .font(.system(size: 15))
                    .opacity(0.6)
            }
        }
    }
}
struct FriendButtonView_Previews: PreviewProvider {
    static var previews: some View {
        @State var isShowingMenu = true
        FriendButtonView(friend: FriendsPageListingData.mockData[0], isShowingMenu: $isShowingMenu)
    }
}
