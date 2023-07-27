//
//  MiniStoryView.swift
//  FacebookUI
//
//  Created by apple on 7/22/23.
//

import SwiftUI

struct MiniStoryView: View {
    //Name of the icon in the Assets Folder
    let iconString : String
    let storyString : String
    let text : String
    init(_ icon : String = "AmongUsIcon", _ story : String = "AmongUsStory", _ t : String = "Amongst Us"){
        self.iconString = icon
        self.storyString = story
        self.text = t
    }
    var body: some View {
        let newBlue = Color(red: 0.01, green: 0.46, blue: 0.89)
        ZStack{
            Image(storyString)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:100, height: 180)
                .clipped()
            VStack(alignment: .leading){
                Spacer()
                Text("\(text)")
                    .fontWeight(.semibold)
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .padding(6)
            }
            ZStack{
                Image(iconString)
                    .resizable()
                    .aspectRatio(contentMode:.fill)
                    .foregroundColor(Color(red: 0.01, green: 0.46, blue: 0.89))
                    .background(Color(white:0.95))
                    .frame(width:25,height:25)
                .clipShape(Circle())
                Circle()
                    .stroke(newBlue, lineWidth: 2)
                    .frame(width: 31)
            }
                .position(x: 23, y: 23)
        }
        .frame(width:100, height: 180)
        .cornerRadius(10)
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 0.5)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MiniStoryView()
    }
}
