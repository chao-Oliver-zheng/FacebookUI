//
//  DashView.swift
//  FacebookUI
//
//  Created by Oliver Zheng on 7/1/23.
//

import SwiftUI

struct DashView: View {
    var body: some View {
        Rectangle()
            .frame(width: 40, height: 4)
            .foregroundColor(.gray)
            .cornerRadius(30)
            .opacity(0.5)
            .padding(.top, 5)
            .padding([.horizontal, .bottom])
            
    }
}

struct DashView_Previews: PreviewProvider {
    static var previews: some View {
        DashView()
    }
}
