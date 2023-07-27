//
//  FollowButtonView.swift
//  FacebookUI
//
//  Created by Oliver Zheng on 7/1/23.
//

import SwiftUI

struct FollowButtonView: View {
    
    var friend: FriendsPageListingData
    @Binding var isShowingMenu: Bool
    @Binding var selectedIdx: Int
    @ObservedObject var viewModel: ViewModel
    
    
    var body: some View {
        
       
            
            Button(action: {
                $isShowingMenu.wrappedValue = false
                viewModel.mockData[selectedIdx].follow.toggle()
                
            }) {
                ZStack{
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.3)
                        .frame(width: 35, height: 35)
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                        .clipShape(Circle())
                }
                .padding(.trailing, 6)
                VStack(alignment: .leading){
                    if friend.follow {
                        Text("Unfollow \(friend.firstName)")
                            .font(.system(size: 18))
                        Text("Stop seeing posts but stay friends.")
                            .font(.system(size: 15))
                            .opacity(0.6)
                    } else {
                        Text("Follow \(friend.firstName)")
                            .font(.system(size: 18))
                        Text("See posts from \(friend.firstName)")
                            .font(.system(size: 15))
                            .opacity(0.6)
                    }
                }
                
            }
        }
}
