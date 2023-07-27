//
//  CreateStoryView.swift
//  FacebookUI
//
//  Created by apple on 7/17/23.
//

import SwiftUI

struct CreateStoryView: View {
    var body: some View {
        ZStack{
            Image("CreateStoryBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:100, height: 150)
                .clipped()
                .position(x: 50, y: 75)
            VStack{
                Spacer()
                Rectangle()
                    .frame(height: 60.0)
                    .foregroundColor(Color(white: 0.95))
            }
            VStack{
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .foregroundColor(Color(red: 0.01, green: 0.46, blue: 0.89))
                    .background(Color(white:0.95))
                    .frame(width:25,height:30)
                    .position(x: 50, y: 120)
                Spacer()
                Text("Create story")
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 13.5))
                    .padding(7)
                    .frame(width: 60)
            }
        }
        .frame(width:100, height: 180)
        .cornerRadius(10)
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 0.5)
        }
    }
}

struct CreateStoryView_Previews: PreviewProvider {
    static var previews: some View {
        CreateStoryView()
    }
}
