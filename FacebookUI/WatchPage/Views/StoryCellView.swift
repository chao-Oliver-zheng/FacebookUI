//
//  StoryCellView.swift
//  FacebookUI
//
//  Created by Cameron on 6/30/23.
//

import SwiftUI

struct StoryCellView: View {
    
    let data: StoryCellDataModel;
    init(data: StoryCellDataModel) {
        self.data = data
    }
    init() {
        self.data = .mockData;
    }
    
    var body: some View {
        VStack {
            PostedByHeader
            
            StoryDescription
            
            StoryMockVideoContent
            
            PostInteractionListView(data: self.data)
            
            Divider()
                .padding(.horizontal)
            
            PostInteractionButtonListView()
        }
    }
    
    var PostedByHeader: some View {
        HStack(alignment: .center) {
            
            PostAccountDetails
            
            Spacer()
            
            Button(action: {
                //TODO: Implement Ellipsis tap.
                print("Watch Tab: Ellipsis not implemented.")
            }) {
                Image(systemName: "ellipsis")
                    .padding(.horizontal)
                    .foregroundColor(.black)
            }
            
            Button(action: {
                //TODO: Implement Xmark tap.
                print("Watch Tab: Xmark not implemented.")
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
            }
        }
        .padding(.vertical, 7)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    }
    
    var PostAccountDetails: some View {
        HStack {
            Image(data.posterProfile.profileImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text("\(data.posterProfile.name) \u{2022}")
                        .font(.caption.bold())
                    
                    Button(action: {
                        //TODO: Implement Follow tap.
                        print("Watch Tab: Follow not implemented.")
                    }) {
                        Text("Follow")
                            .font(.caption.bold())
                    }
                }
                
                HStack(alignment: .center) {
                    Text("\(data.postedDateString) \u{2022}")
                        .font(.caption2)
                    Image(systemName: "globe.americas.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12)
                }
            }
        }
    }
    
    var StoryDescription: some View {
        Text(data.description)
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
    
    var StoryMockVideoContent: some View {
        Image(data.contentImagePath)
            .resizable()
            .frame(maxWidth: .infinity)
            .aspectRatio(contentMode: .fit)
    }
}

struct StoryCellView_Previews: PreviewProvider {
    static var previews: some View {
        StoryCellView()
    }
}
