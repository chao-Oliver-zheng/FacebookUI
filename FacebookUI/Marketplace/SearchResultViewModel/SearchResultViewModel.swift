//
//  SearchResultViewModel.swift
//  FacebookUI
//
//  Created by Jack Liu on 7/17/23.
//

//let arr = ["Hello","Bye","Halo"]
//let filtered = arr.filter { $0.contains("lo") }
//print(filtered)

import Foundation

class SearchResultViewModel: ObservableObject {
	@Published var listings = marketPlaceMockDataThumbnailArr
//    filterResult takes in the searchText and the whole mockData and return a new mockData with qualified field
    func searchResults(_ searchText: String,_ data: [MarketPlaceThumbnail]) ->[MarketPlaceThumbnail]{
		 if searchText == "" {
			 return data
		 }
		 
        return data.filter { itemThumb in
			  let item = getListingFromThumbnail(itemThumb)
			  return item.description.lowercased().contains(searchText.lowercased()) || item.category.lowercased().contains(searchText.lowercased()) || item.title.lowercased().contains(searchText.lowercased())
        }
    }
	
	func categoryFiltering(_ category: String, _ data: [MarketPlaceThumbnail]) -> [MarketPlaceThumbnail] {
		if category == "" {
			return data
		}
		return data.filter { itemThumb in
			let item = getListingFromThumbnail(itemThumb)
			return item.category == category
		}
	}
	
	func filterListings(searchText: String, category: String) {
		listings = categoryFiltering(category, searchResults(searchText, marketPlaceMockDataThumbnailArr))
	}
	
	func getListingFromThumbnail(_ thumbnail: MarketPlaceThumbnail) -> MarketPlaceListing {
		for l in MarketPlaceListing.mockDataList{
			if(thumbnail.listingID == l.id){
				return l
			}
		}
		return MarketPlaceListing(id:  thumbnail.listingID, ownerID: UUID(), title: thumbnail.title, description: "", location: thumbnail.location, category: "", itemDetails: [thumbnail.displayedDetail], images: [thumbnail.image], price: thumbnail.price)
	}
	
}
