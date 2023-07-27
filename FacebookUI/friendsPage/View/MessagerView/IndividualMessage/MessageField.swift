//
//  MessageField.swift
//  FacebookUI
//
//  Created by Oliver Zheng on 7/26/23.
//


import SwiftUI

struct MessageField: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack{
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray)
                    .opacity(0.5)
                    .frame(height: 40)
                    .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
                
                HStack {
                    TextField("Type a message...", text: $text, onEditingChanged: { editing in
                        withAnimation {
                            print(editing)
                            isEditing = editing
                        }
                    })
                    .foregroundColor(.black)
                    .padding(.horizontal, 8)
                    
                    Button(action: {
                        // Add the action you want to perform when the button is tapped here
                        print("Button tapped!")
                    }){
                        Image(systemName: "smiley.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                            .padding(.trailing, 12)
                    }
                    
                }
            }
            
            if !text.isEmpty || isEditing {
                Button(action: {
                    // Add the action you want to perform when the button is tapped here
                    print("Button send tapped!")
                }){
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                        .padding(.trailing, 12)
                }
            }else {
                Button(action: {
                    // Add the action you want to perform when the button is tapped here
                    print("Button mic tapped!")
                }){
                    Image(systemName: "mic.fill")
                        .foregroundColor(.blue)
                        .padding(.trailing, 12)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

