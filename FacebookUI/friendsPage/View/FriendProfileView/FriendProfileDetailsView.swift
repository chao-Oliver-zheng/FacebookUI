//
//  FriendProfileDetailsView.swift
//  FacebookUI
//
//  Created by Edward Kyles on 7/23/23.
//

import SwiftUI

struct FriendProfileDetailsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                }) {
                    Text("Posts")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.black)
                }
                Button(action: {
                 
                }) {
                    Text("Photos")
                        .font(.title)
                        .fontWeight(.black)
                        .padding(.leading, 20)
                        .foregroundColor(.black)

                }
            }
            
            Divider()
            
            Text("Details")
                .font(.title)
                .bold()
                .padding(.bottom, 10)
            
            HStack {
                Image(systemName: "briefcase.fill")
                    .padding(.bottom, 10)
                Text("Works at Software R Us")
                    .padding(.bottom, 10)
                    .font(.system(size: 20))
            }
            
            HStack {
                Image(systemName: "heart.fill")
                Text("Relationship Status: Single")
                    .font(.system(size: 20))

            }
        }
        .padding()
    }
}

struct FriendProfileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendProfileDetailsView()
    }
}
