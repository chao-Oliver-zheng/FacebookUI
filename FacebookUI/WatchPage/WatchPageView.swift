//
//  WatchPageView.swift
//  FacebookUI
//
//  Created by Cameron Robinson on 7/2/23.
//

import SwiftUI

struct WatchPageView: View {
    var body: some View {
        
        ScrollView {
            // TODO: Add WatchPageHeading.
            ForEach(StoryCellDataModel.mockDataList()) { storyCell in
                StoryCellView(data: storyCell)
                    .frame(maxWidth: .infinity)
                Rectangle()
                    .frame(height: 7)
                    .foregroundColor(Color(UIColor.systemGray4))
            }
        }
    }
}

struct WatchPageView_Previews: PreviewProvider {
    static var previews: some View {
        WatchPageView()
    }
}
