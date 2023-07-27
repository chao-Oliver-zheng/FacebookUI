//
//  HomePageView.swift
//  FacebookUI
//
//  Created by Ngoc Nguyen on 7/20/23.
//

import SwiftUI

struct HomePageView: View {
    @State var show = true
    var body: some View {
        
        VStack{
            //Add Animation to top navigation bar
            if show{
                HomePageNavigationTop()
            } else {
            }
            ScrollView{
                HomePagePostWritting()
                Text("Short Story Place Holder")
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .background(.white)
                Text("People you may Place Holder")
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .background(.white)
                PostsView()
            }
            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
        }
//        .overlay(
//            RoundedRectangle(cornerRadius: 15)
//                .stroke(Color.red, lineWidth: 2)
//        )
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}

struct NavigationTop: View{
    var body: some View{
        Text("Top Navigation bar")
    }
}

struct HomePageNavigationTop: View{
    @State private var isButtonPressed = false
    
    var body: some View{
        HStack {
            Text("facebook")
                .font(.title).fontWeight(.heavy)
                .foregroundColor(.blue)
            Spacer()
            HStack {
                Button(){
                    
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(isButtonPressed ? Color.gray : Color(red: 0.9, green: 0.9, blue: 0.9))
                        .cornerRadius(40)
                }
                
                Button(){
                } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(isButtonPressed ? Color.gray : Color(red: 0.9, green: 0.9, blue: 0.9))
                        .cornerRadius(40)
                }

                Button(){
                } label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(isButtonPressed ? Color.gray : Color(red: 0.9, green: 0.9, blue: 0.9))
                        .cornerRadius(40)
                }
            }
            .foregroundColor(.black)

        }
        .padding(10)
    }
}

struct HomePagePostWritting: View {
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://images.pexels.com/photos/4946515/pexels-photo-4946515.jpeg")) { image in
                image.resizable()
                    .cornerRadius(40)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)

            Text("What's on your mind?")
            Spacer()
            Image(systemName: "photo.artframe")
                .resizable()
                .frame(width: 20, height: 20)
                .padding(8)
                .cornerRadius(40)
                .foregroundColor(.green)
        }
        .padding(10)
        .background(.white)
    }
}

struct PostsView: View {
    var body: some View {
        ForEach(HomePagemockPosts) { post in
            HomePostCell(post: post)
                .background()
        }
    }
}
