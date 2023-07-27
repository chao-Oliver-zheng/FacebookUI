//
//  MarketPlaceView.swift
//  FacebookUI
//
//  Created by Ngoc Nguyen on 7/20/23.
//

import SwiftUI

struct MarketPlaceView: View {
	@State var searchString = ""
	@State var category = ""
    var body: some View {
        
        NavigationStack{
            Text("Filter Tab")
            ScrollView(.vertical, showsIndicators: false){
                HStack {
						 if(getTitle() != "Today's Picks") {
						 Button {
							 searchString = ""
							 category = ""
						 } label: {
							 
								 Text("X")
							 }
						 }
                    Text(getTitle())
                        .font(.title3)
                        .fontWeight(.bold)
                    Spacer()
                    HStack{
                        Image(systemName: "mappin.and.ellipse")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("San Jose, California \u{2022} 16 mi")
                            .font(.caption)
                    }
                    .foregroundColor(.blue)
                }
                .padding(10)
                
					MarketPlaceItemGrid(search: $searchString, category: $category)
            }
            .navigationTitle("Marketplace")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup {
                    NavigationLink {
							  MarketPlaceSearchView(searchString: $searchString, category: $category)
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.primary)
                            .bold()
                    }
                }
            }
        }
    }
	
	func getTitle() -> String {
		if searchString == "" && category == "" {
			return "Today's Picks"
		} else if(searchString != "") {
			if(category == ""){
				return "'\(searchString)'"
			} else {
				return "'\(searchString)' in \(category)"
			}
		} else{
			return category
		}
	}
}

struct MarketPlaceItemGrid: View {
	@StateObject var viewModel = SearchResultViewModel()
	@Binding var search: String
	@Binding var category: String {
		willSet {
			print("Updating Listings")
			viewModel.filterListings(searchText: search, category: category)
		}
	}
    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
        LazyVGrid(columns: columns) {
			  if(viewModel.listings.count == 0) {
				  Text("No Results Found")
			  }
			  ForEach(viewModel.listings, id: \.listingID) { item in
                NavigationLink{
						 ListingView(listing:viewModel.getListingFromThumbnail(item))
                } label: {
                    ListingThumbnailView(listing: item)
                        .frame(width: 200, height: 240)
                        .padding(.bottom, 20)
                        .foregroundColor(.primary)
                }
						
            }
		  }
		  .padding(.horizontal, 5)
		  .onAppear {
			  viewModel.filterListings(searchText: search, category: category)
		  }
		  .onChange(of: category) { _ in
			  print("Updating Listings")
			  viewModel.filterListings(searchText: search, category: category)
		  }
		  .onChange(of: search) { _ in
			  print("Updating Listings")
			  viewModel.filterListings(searchText: search, category: category)
		  }
    }
}

struct MarketPlaceView_Previews: PreviewProvider {
    static var previews: some View {
        MarketPlaceView()
    }
}


