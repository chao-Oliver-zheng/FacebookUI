//
//  MessageBubble.swift
//  FacebookUI
//
//  Created by Oliver Zheng on 7/25/23.
//

import SwiftUI

struct MessageBubble: View {
    var message: Messages
    @State private var showTime = false
    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding(10)
                    .background( message.received ? .gray : .purple)
                    .cornerRadius(15)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        //.padding(.horizontal)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble( message: Messages(id: "1234", text: "I was writing the code", received: true, timestamp: Date()))
    }
}
