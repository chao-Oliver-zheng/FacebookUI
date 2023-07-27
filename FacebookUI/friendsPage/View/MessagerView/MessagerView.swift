//
//  MessagerView.swift
//  FacebookUI
//
//  Created by Oliver Zheng on 7/26/23.
//


import SwiftUI

struct MessagerView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var selectedIdx = 0
    @State private var searchText = ""
    @State private var isShowingAnotherView = false
    var body: some View {
        NavigationView{
            VStack{
                HeaderView()
                    .opacity(0.8)
                
                
                ScrollView{
                    VStack{
                        switch selectedIdx {
                        case 0:
                            
                            VStack(alignment: .leading){
                                HStack{
                                    ForEach(viewModel.mockData) {  friend in
                                        if(friend.online){
                                            ZStack(alignment: Alignment.bottomTrailing) {
                                                Image(friend.profilePicturePath)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 50, height: 50)
                                                    .cornerRadius(50)
                                                Circle()
                                                    .frame(width: 10, height: 10)
                                                    .foregroundColor(.green)
                                                    .frame(alignment: .bottom)
                                            }
                                            
                                        }
                                    }
                                    .padding()
                                    
                                }
                                
                                VStack(alignment: .leading){
                                    ForEach(viewModel.mockData.indices,  id:\.self) { idx in
                                        Button(action: {
                                            print("click to chat")
                                            isShowingAnotherView = true
                                        }){
                                            NavigationLink(destination: ChatView(idx: idx)){
                                                HStack{
                                                    if let curMessage = viewModel.mockData[idx].message {
                                                        Image(viewModel.mockData[idx].profilePicturePath)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 55, height: 55)
                                                            .cornerRadius(50)
                                                        VStack(alignment: .leading){
                                                            Text(viewModel.mockData[idx].firstName + " " + viewModel.mockData[idx].lastName)
                                                                .foregroundColor(.white)
                                                                .bold()
                                                            HStack{
                                                                if(!curMessage[curMessage.count - 1].received){
                                                                    Text("You: ")
                                                                }
                                                                Text(curMessage[curMessage.count - 1].text)
                                                                    .lineLimit(1)
                                                                    .frame(maxWidth: 150, alignment: .leading)
                                                                    .opacity(0.8)
                                                                Text("\((curMessage[curMessage.count - 1].timestamp).formatted(.dateTime.month().day().year()))")
                                                                    .opacity(0.8)
                                                            }
                                                            
                                                        }
                                                        .padding()
                                                    }else { }
                                                    
                                                }
                                                .padding(.horizontal)
                                            }
                                        }
                                    }
                                }
                            }
                        case 1:
                            Text("Calls")
                        case 2:
                            Text("People")
                        case 3:
                            Text("Stories")
                        default:
                            Text("opps Something went wrong")
                        }
                        
                    }
                    .foregroundColor(.white)
                    .background(.black)
                    .frame(maxWidth: .infinity)
                }
                
                FooterView(selectedIdx: $selectedIdx)
            }
            .background(.black)
        }
    }
    
}

struct HeaderView: View {
    var body: some View {
        HStack{
            Button(action:{print("pressed")}){
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .frame(width: 24, height: 16)
                    .foregroundColor(.blue)
            }
            .padding(8)
            Spacer()
            Text("Chats")
                .font(.system(size: 25).bold())
                .foregroundColor(.white)
            Spacer()
            Button(action:{print("pressed")}){
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.blue)
                    .bold()
            }
            .padding(8)
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct FooterView: View {
    var buttons: [String] = ["Chats", "Calls", "People", "Stories"]
    var Imgs: [String]  = ["message.fill", "video.fill", "person.2.fill", "rectangle.portrait.on.rectangle.portrait.angled.fill"]
    @Binding var selectedIdx: Int
    var body: some View {
        HStack{
            ForEach(buttons.indices, id: \.self) { index in
                Button( action: {
                    selectedIdx = index
                }){
                    VStack{
                        Image(systemName: Imgs[index])
                            .font(.system(size: 20))
                            .frame(width: 50, height: 10)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(selectedIdx == index ? .blue : .gray)
                            .padding(.top)
                        Text(buttons[index])
                            .font(.system(size: 12))
                            .bold()
                            .frame(height: 20)
                            .padding(.horizontal, 8)
                            .foregroundColor(selectedIdx == index ? .blue : .gray)
                    }
                    .padding(.horizontal)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .edgesIgnoringSafeArea(.bottom)
        .background(.black)
    }
}
struct MessagerView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ViewModel()
        MessagerView(viewModel: viewModel)
    }
}
