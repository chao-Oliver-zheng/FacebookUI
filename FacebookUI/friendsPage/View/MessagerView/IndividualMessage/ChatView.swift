//
//  ChatView.swift
//  FacebookUI
//
//  Created by Oliver Zheng on 7/25/23.
//

import SwiftUI

struct ChatView: View {
    
    @State var text = ""
    @ObservedObject var viewModel = ViewModel()
    var idx: Int
    var body: some View {
        VStack {
            VStack{
                TitleRow(viewModel: viewModel, idx: idx)
                ScrollView{
                    ForEach(viewModel.mockData[idx].message ?? []){ message in
                        MessageBubble(message: message)
                    }
                    
                    
                    
                }
            }
            
            MessageField(text: $text)
        }
        .background(.black)
    }
}


