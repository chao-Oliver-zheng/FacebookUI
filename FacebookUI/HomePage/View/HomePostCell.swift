//
//  HomePostCell.swift
//  FacebookUI
//
//  Created by Jon Chang on 7/15/23.
//

import SwiftUI

struct HomePostCell: View {
    let post: PostData
    
    var body: some View {
        VStack(spacing: 15) {
            VStack {
                HStack(alignment: .top) {
                    titleView(post)
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .resizable()
                        .scaledToFit()
                        .frame(width:18, height: 18)
                        .bold()
                        .foregroundColor(Color.gray)
                        .padding([.trailing], 20)
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width:18, height:18)
                        .bold()
                        .foregroundColor(Color.gray)
                }
                
                Text(post.postDesc)
                    .multilineTextAlignment(.leading)
            }
            .padding([.horizontal])
            
            
            Image(post.postImg)
                .resizable()
                .frame(maxWidth: .infinity, maxHeight:250)
            
            likeView(post)
            
            Divider()
                .frame(height: 1)
                .overlay(Color(.systemGray3))
                .padding([.horizontal])
            
            likeBar()
                
        }
        .padding([.vertical])
    }
    
    private func titleView(_ post:PostData) -> some View {
        let suggestedForYou = post.suggested ? "Suggested for you • " : ""
        
        return (HStack(alignment: .top) {
            Image(post.userImg)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color(.systemGray4), lineWidth: 1))
                .padding([.trailing], 3)
            
            VStack(alignment: .leading) {
                Text(post.userName)
                    .bold()
                    .font(.system(size:15))
                    .multilineTextAlignment(.leading)
                    .padding([.bottom], 1)
                HStack {
                    Text(suggestedForYou + "\(post.datePosted) •")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(Color.gray)
                    Image(systemName: "globe.americas.fill")
                        .resizable()
                        .frame(width:12, height:12)
                        .foregroundColor(Color.white)
                        .background(Color(.systemGray))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(.systemGray), lineWidth: 1))
                        .padding([.leading], -5)
                }
            }
        }
        .frame(width: 250, alignment: .leading))
    }
    
    private func likeView(_ post: PostData) -> some View {
        HStack {
            Image("LikeEmoji")
                .resizable()
                .frame(width: 20, height: 20)
            Text("\(post.likes)")
            
            Spacer()
            
            Text("\(post.commentCount) comments • \(post.shares) shares")
        }
        .fontWeight(.medium)
        .foregroundColor(Color.gray)
        .padding([.horizontal])
    }
    
    private func likeBar() -> some View {
        HStack {
            Image("LikeButton")
                .resizable()
                .frame(width: 30, height: 30)
            Text("Like")
            Spacer()
            Image("CommentButton")
                .resizable()
                .frame(width: 30, height: 30)
            Text("Comment")
            Spacer()
            Image("ShareButton")
                .resizable()
                .frame(width: 30, height: 30)
            Text("Share")
        }
        .fontWeight(.medium)
        .foregroundColor(Color.gray)
        .padding([.horizontal], 30)
    }
}

struct HomePostCell_Previews: PreviewProvider {
    static var previews: some View {
        HomePostCell(post: PostData.mockPost)
    }
}
