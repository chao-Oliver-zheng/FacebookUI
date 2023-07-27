//
//  MarketPlaceSearchView.swift
//  FacebookUI
//
//  Created by Ngoc Nguyen on 7/21/23.
//

import SwiftUI
import Foundation

struct MarketPlaceSearchView: View {
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var selectedTab = 0
	@Binding var searchString: String
	@Binding var category: String
    @State var recentSearches: [String] = ["Book", "Movie", "TV"]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                //Tabs
                VStack {
                    HStack {
                        HStack{
                            Button{
                                selectedTab = 0
                            } label: {
                                VStack(alignment: .center){
                                    Text("Recent Search")
                                        .foregroundColor(selectedTab == 0 ? .accentColor : .gray)
                                        .font(.title3)
                                        .frame(height: 20)
                                    Spacer()
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(selectedTab == 0 ? Color.accentColor : Color.clear)
                                }
                                .frame(height: 25)
                            }
                        }
                        
                        HStack{
                            Button{
                                selectedTab = 1
                            } label: {
                                VStack(alignment: .center){
                                    Text("Saved Searches")
                                        .foregroundColor(selectedTab == 1 ? .accentColor : .gray)
                                        .font(.title3)
                                        .frame(height: 20)
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(selectedTab == 1 ? Color.accentColor : Color.clear)
                                }
                                .frame(height: 25)
                            }
                        }
                    }
                }
                .padding(.top, 10)
                .frame(height: 30)
                
                //Tabview
                if selectedTab == 0 {
                    //Recent Searches
                    if !recentSearches.isEmpty{
                        MarketplacRecentSearchListView(recentSearches: $recentSearches)
                    }
                    
                    //Suggested Category Searches
                    MarketplacSuggestCategorySearchView(marketplaceSuggestedCategories: marketplaceMockSuggestedCategories)
                    
                    //All Categories
						 MarketplaceAllCategoriesView(marketplaceCategories: marketplaceMockCategories, category: $category)
                } else if selectedTab == 1 {
                    Text("Saved Search")
                }
            }
				.searchable(text: $searchString, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Search Marketplace"))
            .onSubmit(of: .search) {
                recentSearches.append(searchString)
					self.presentationMode.wrappedValue.dismiss()
                //Navigate to SearchResultView/UI by related thing
            }
        }
    }
}

//struct MarketPlaceSearchView_Previews:
//	PreviewProvider {
//    static var previews: some View {
//        MarketPlaceSearchView()
//    }
//}

struct MarketplacRecentSearchListView: View {
    @Binding var recentSearches: [String]
    var body: some View {
        VStack{
            HStack{
                Text("Recent Searches")
                    .font(.title3)
                    .fontWeight(.bold)
                Spacer()
                Button{
                    recentSearches.removeAll()
                } label: {
                    Text("Clear all")
                        .font(.body)
                        .foregroundColor(.accentColor)
                }
            }
            ForEach(recentSearches.suffix(5), id: \.self) { item in
                VStack{
                    HStack {
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .fontWeight(.ultraLight)
                        Text(item)
                            .font(.title3)
                        Spacer()
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .fontWeight(.light)
                    }
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(Color.gray)
                }
                
            }
        }
        .padding()
        
    }
}

struct MarketplacSuggestCategorySearchView: View {
    let marketplaceSuggestedCategories : [MarketplaceSuggestedCategory]
	
    var body: some View {
        VStack(alignment: .leading){
            Text("Suggested Category Searches")
                .font(.title3)
                .fontWeight(.bold)
            Text("Based on your recent activity")
                .font(.body)
                .foregroundColor(.gray)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20){
                    ForEach(marketplaceSuggestedCategories) { sugesstedCategory in
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: sugesstedCategory.image)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 180)
                                    .clipped()
                                    .scaledToFit()
                            } placeholder: {
                                Image(systemName: "photo")
                                    .frame(width: 200, height: 200)
                            }
                            Text(sugesstedCategory.name)
                                .font(.title3)
                                .lineLimit(1)
                                .frame(height: 30)
                        }
                    }
                }
            }
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(Color.gray)
        }
        .padding()
        
    }
}

struct MarketplaceAllCategoriesView: View {
	
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let marketplaceCategories : [MarketplaceCategory]
	@Binding var category: String
    var body: some View {
        VStack(alignment: .leading){
            Text("All Categories")
                .font(.title3)
                .fontWeight(.bold)
            ForEach(marketplaceCategories){ category in
                Button{
						 self.category = category.name
						 self.presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack{
                        Image(systemName: category.image)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(10)
                            .cornerRadius(40)
                            .background(Circle().fill(Color.gray.opacity(0.2)))
                        //                            .overlay(
                        //                                RoundedRectangle(cornerRadius: 15)
                        //                                    .stroke(Color.red, lineWidth: 2)
                        //                            )
                        Text(category.name)
                            .font(.title2)
                        Spacer()
                    }
                }
                .foregroundColor(.primary)
            }
        }
        .padding()
    }
}

