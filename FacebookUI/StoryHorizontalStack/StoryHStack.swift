//
//  StoryHStack.swift
//  FacebookUI
//
//  Created by apple on 7/15/23.
//

import SwiftUI

struct StoryHStack: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                CreateStoryView()
                MiniStoryView()
                MiniStoryView("DragIcon", "DragStory", "Performing Art Center")
                MiniStoryView("GoldenGateIcon", "GoldenGateStory", "San Fran Sights")
            }
        }
        .padding()
    }
}

struct StoryHStack_Previews: PreviewProvider {
    static var previews: some View {
        StoryHStack()
    }
}
