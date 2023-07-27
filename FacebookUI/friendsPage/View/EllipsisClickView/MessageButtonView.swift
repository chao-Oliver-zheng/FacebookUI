//
//  MessageButtonView.swift
//  FacebookUI
//
//  Created by Oliver Zheng on 7/1/23.
//

import SwiftUI

struct MessageButtonView: View {
    
    var friend: FriendsPageListingData
    @Binding var isShowingMenu: Bool
    @ObservedObject var viewModel: ViewModel
    @State private var isShowingMessagePage = false
    
    
    var body: some View {
            Button(action: {
                $isShowingMenu.wrappedValue = false
            }) {
                
                HStack{
                    ZStack{
                        Circle()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: 35, height: 35)
                        Image("FacebookMessenger")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 23, height: 23)
                            .foregroundColor(.gray)
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 6)
                    Text("Message \(friend.firstName)")
                        .font(.system(size: 18))
                }
                .onTapGesture {
                    isShowingMessagePage.toggle()
                        }
                .fullScreenCover(isPresented: $isShowingMessagePage) {
                           MessagerView(viewModel: viewModel)
                        }

            }

        
    }
}

