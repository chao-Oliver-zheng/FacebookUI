// MarketHeaderView.swift
// FacebookUI
//
// Created by Edward Kyles on 7/21/23.
//

import SwiftUI

struct MarketplaceHeaderView: View {
    var body: some View {
        HStack {
            
            Button(action: { }) {
                Text("Sell")
                    .bold()
                    .foregroundColor(.black)
            }
            
            Divider()
                .frame(height: 20)
                .background(Color.black)
                .padding(.leading, 5)
            
            Spacer()
            
            Button(action: {  }) {
                Text("For You")
                    .bold()
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Button(action: {  }) {
                Text("Local")
                    .bold()
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Button(action: {  }) {
                Text("Shops")
                    .bold()
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Button(action: { }) {
                HStack {
                    Text("More")
                        .bold()
                        .foregroundColor(.black)
                    Image(systemName: "chevron.down")
                        .foregroundColor(.black)
                }
            }
            
        }
        .padding(.horizontal)
    }
}



struct MarketplaceHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MarketplaceHeaderView()
    }
}
