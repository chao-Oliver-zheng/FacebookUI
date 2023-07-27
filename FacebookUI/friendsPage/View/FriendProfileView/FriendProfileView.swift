//
//  FriendProfileView.swift
//  FacebookUI
//
//  Created by Edward Kyles on 7/23/23.
//

import SwiftUI

struct FriendProfileView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                FriendHeaderView()
                FriendProfileButtonView()
                FriendProfileDetailsView()
                FriendGridView()
                FriendProfilePageView()
            }
        }
    }
}

struct FriendProfileView_Previews: PreviewProvider {
    static var previews: some View {
        FriendProfileView()
    }
}


