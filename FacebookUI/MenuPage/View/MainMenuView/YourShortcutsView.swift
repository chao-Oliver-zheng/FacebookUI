//
//  YourShortcutsView.swift
//  FacebookMenuPage
//
//  Created by Ajinkya Mate on 7/19/23.
//

import SwiftUI

struct YourShortcutsView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(YourShortcutsData.dummyData) { friend in
                    VStack(spacing: 5) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(friend.firstName)
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                        Text(friend.lastName)
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                    .padding(10)
                }
            }
        }
    }
}

struct YourShortcutsView_Previews: PreviewProvider {
    static var previews: some View {
        YourShortcutsView()
    }
}
