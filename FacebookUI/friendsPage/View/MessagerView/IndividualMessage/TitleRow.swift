//
//  TitleRow.swift
//  FacebookUI
//
//  Created by Oliver Zheng on 7/24/23.
//

import SwiftUI

struct TitleRow: View {
    @ObservedObject var viewModel: ViewModel
    var idx: Int
    var body: some View {
        HStack(spacing: 20){
            Image(viewModel.mockData[idx].profilePicturePath)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .cornerRadius(50)
            VStack(alignment: .leading){
                Text(viewModel.mockData[idx].firstName + " " + viewModel.mockData[idx].lastName)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "phone.fill")
                .foregroundColor(.purple)
                .frame(height: 50)
            Image(systemName: "video.fill")
                .foregroundColor(.purple)
                .frame(height: 50)
            
        }
        .padding()
        
    }
}

