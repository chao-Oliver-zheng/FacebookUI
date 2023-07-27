//
//  PostInteractionButtonListView.swift
//  FacebookUI
//
//  Created by Cameron on 6/30/23.
//

import SwiftUI

struct PostInteractionButtonListView: View {
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                //TODO: Implement Like tap.
                print("Watch Tab: Like not implemented");
            }) {
                Image(systemName: "hand.thumbsup")
                Text("Like")
                    .font(.caption)
            }
            
            Spacer()
            
            Button(action: {
                //TODO: Implement Comment tap.
                print("Watch Tab: Comment not implemented");
            }) {
                Image(systemName: "bubble.left")
                Text("Comment")
                    .font(.caption)
            }
            
            Spacer()
            
            Button(action: {
                //TODO: Implement Share tap.
                print("Watch Tab: Share not implemented");
            }) {
                Image(systemName: "arrowshape.turn.up.right")
                Text("Share")
                    .font(.caption)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.gray)
    }
}

struct PostInteractionButtonListView_Previews: PreviewProvider {
    static var previews: some View {
        PostInteractionButtonListView()
    }
}
