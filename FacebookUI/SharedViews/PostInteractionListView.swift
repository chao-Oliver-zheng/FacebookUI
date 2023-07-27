//
//  PostInteractionListView.swift
//  FacebookUI
//
//  Created by Cameron on 6/30/23.
//

import SwiftUI

struct PostInteractionListView: View {
    
    //TODO: This should be refactored when more models are built. Using StoryCellData for now.
    let data: StoryCellDataModel;
    init() {
        self.data = .mockData
    }
    init(data: StoryCellDataModel) {
        self.data = data;
    }
    
    var body: some View {
        HStack {
            if data.reactions.numberOfReactions > 0 {
                
                if data.reactions.reactionImagePaths.count == 0 {
                    Image(systemName: "hand.thumbsup.circle.fill")
                }
                else {
                    //TODO: setup list of reaction types.
                }
                
                Text("\(data.reactions.numberOfReactions)")
            }
            
            Spacer()
            
            Group {
                //TODO: Use getter to have data model, format number into ideal strings. IE: 6924 comments becomes 6.9K comments.
                Text("\(data.numberOfCommentsString) comments")
                Text("\(data.numberOfSharesString) shares")
                Text("\(data.numberOfViewsString) views")
            }
        }
        .font(.caption)
        .foregroundColor(.gray)
        .padding(.horizontal)
        .padding(.vertical, 7)
    }
}

struct PostInteractionList_Previews: PreviewProvider {
    static var previews: some View {
        PostInteractionListView()
    }
}
