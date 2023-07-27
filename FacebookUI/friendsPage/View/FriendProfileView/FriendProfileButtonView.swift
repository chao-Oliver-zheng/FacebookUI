//
//  FriendProfileButtonView.swift
//  FacebookUI
//
//  Created by Edward Kyles on 7/23/23.
//

import SwiftUI

struct FriendProfileButtonView: View {
    var body: some View {
        HStack {
            Button(action: {
            }) {
                Image("friends_button")
            }

            Spacer()

            Button(action: {
            }) {
                Image("message_button")
            }
            Button(action: {
            }) {
                Image("dots_button")
            }
        }
        .padding()
    }
}

struct FriendProfileButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FriendProfileButtonView()
    }
}

