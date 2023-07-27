//
//  FriendHeaderView.swift
//  FacebookUI
//
//  Created by Edward Kyles on 7/23/23.
//

import SwiftUI

struct FriendHeaderView: View {
    var body: some View {
        VStack (alignment: .leading){
            ZStack {
                Image("plant_and_mirror_backdrop")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()

                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
                        Image("FriendPage_AmberFarrell")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .padding(.top, 100)
                    }
                    Spacer()
                }
                .padding(.leading)
            }
            .frame(height: 250)
            
            Text("Amber Farrell")
                .font(.title)
                .bold()
                .padding(.top, 35)
                .padding(.leading, 20)
                
            Spacer()
        }
    }
}



struct FriendHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FriendHeaderView()
    }
}
