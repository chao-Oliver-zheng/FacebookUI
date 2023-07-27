//
//  FriendPageView.swift
//  FacebookUI
//
//Created by Anthony Nuon-Prak on 6/27/23.
//Updated by Chao Zheng ob 0/29/23
import SwiftUI

struct FriendPageView: View {
    
    @State var textField: String = ""
    @State private var isShowingMenu = false
    @StateObject var viewModel = ViewModel()
    //sheet can't go through Foreach loop, this variable will remember objects in foreach loop
    @State private var selectedIdx: Int = 0
    
    var body: some View {
        /// Created a NavigationStack to list all friends. Furthermore, gives access to the methods searchable that includes a searchbar.
        NavigationStack {
            /// When there are lots of friends, scrolling is required.
            ScrollView(.vertical, showsIndicators: false) {
                /// If the user types nothing, load friends normally.
                /// Otherwise, filter the list by name looking for friends that contain the string the user typed.
                if textField == "" {
                    friendsList(viewModel.mockData)
                }
                else {
                    friendsList(viewModel.mockData.filter { $0.name.contains(textField) })
                }
            }
            .navigationTitle("Your friends")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup {
                    Button {
                        // TODO: Add functionality
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.primary)
                            .bold()
                    }
                }
            }
        }
        .searchable(text: $textField, prompt: Text("Search Friends"))
    }
    
    private func friendsList(_ arr: [FriendsPageListingData]) -> some View {
        /// A helper function that renders the friends list portion of this view.
        /// Takes in an array of FriendsPageListingData to be used to fill the NavigationStack.
        VStack {
            HStack {
                /// The total number of friends the user connected with.
                Text("\(arr.count) friend\(arr.count > 1 || arr.count == 0 ? "s" : "")")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                /// A button that will eventually sort the user's friend list in a certain order.
                Button {
                    // TODO: Sort by what?
                } label: {
                    Text("Sort")
                }
            }
            .padding(.horizontal)
            
            /// The loop that builds each friend view.
            ForEach(arr.indices, id: \.self ) { idx in
                NavigationLink {
                    // TODO: What content should be shown on a particular friend?
                } label: {
                    HStack {
                        Image(arr[idx].profilePicturePath)
                            .resizable()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text(arr[idx].name)
                                .fontWeight(.semibold)
                            
                            Text("\(arr[idx].numMutualFriends) mutual friend\(arr[idx].numMutualFriends > 1 || arr[idx].numMutualFriends == 0 ? "s" : "")")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        // TODO: Add functionality
                        Button ( action: {
                                isShowingMenu = true
                                selectedIdx = idx
                            }) {
                                Image(systemName: "ellipsis")
                                    .bold()
                            }
                            //handle the ellipsis button click
                            .sheet(isPresented: $isShowingMenu) {
                                FriendListEllipsisView(isShowingMenu: $isShowingMenu, friend: arr[selectedIdx], index: selectedIdx)
                                    .presentationDetents([.height(350)])
                            }
                            
                    }
                    .padding(.horizontal)
                }
                .foregroundColor(.primary)
            }
        }
    }
    //Helper function that handle the ellipsis click
    private func FriendListEllipsisView(isShowingMenu: Binding<Bool>, friend: FriendsPageListingData, index: Int ) -> some View {
        NavigationView{
            VStack(alignment: .leading){
                // This is a small dash
                DashView()
                    .frame(maxWidth: .infinity, alignment: .center)
                //This is friend icon, name and friend since
                IconAndNameView(friend: friend)
                VStack(alignment: .leading) {
                    //This is button that message to a friend
                    MessageButtonView(friend: friend, isShowingMenu: $isShowingMenu,viewModel: viewModel)
                    //This is a button unfollow a friend
                    FollowButtonView(friend: friend, isShowingMenu: $isShowingMenu, selectedIdx: $selectedIdx, viewModel: viewModel)
                    //This is a button to block a friend
                    BlockButtonView(friend: friend, isShowingMenu: $isShowingMenu)
                    //This is a button to unfriend
                    FriendButtonView(friend: friend, isShowingMenu: $isShowingMenu)
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
        }
        }
    }


struct FriendPageView_Previews: PreviewProvider {
    static var previews: some View {
        FriendPageView()
    }
}
