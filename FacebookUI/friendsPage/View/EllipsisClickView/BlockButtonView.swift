//
//  BlockButtonView.swift
//  FacebookUI
//
//  Created by Oliver Zheng on 7/1/23.
//

import SwiftUI

struct BlockButtonView: View {
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
                Image(systemName: "person.fill.badge.minus")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 23, height: 23)
                    .foregroundColor(.black)
            }
            .padding(.trailing, 6)
            VStack(alignment: .leading){
                Text("Block \(friend.firstName)")
                    .font(.system(size: 18))
                Text("\(friend.firstName) won't able to see you or contact you on FaceBook.")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .opacity(0.6)
            }
        }
    }
}

struct BlockButtonView_Previews: PreviewProvider {
    static var previews: some View {
        @State var isShowingMenu = true
        BlockButtonView(friend: FriendsPageListingData.mockData[0], isShowingMenu: $isShowingMenu)
    }
}
