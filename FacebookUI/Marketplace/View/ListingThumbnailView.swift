//
//  ListingThumbnailView.swift
//  FacebookUI
//
//  Created by Timothy Vermeersch on 7/7/23.
//

import SwiftUI

struct ListingThumbnailView: View {
	var listing: MarketPlaceThumbnail
	 var body: some View {
		 GeometryReader { geometry in
		 VStack(alignment: .leading) {
			 
				 
				 AsyncImage(url: URL(string: listing.image)) { image in
					 image
						 .resizable()
						 .aspectRatio(contentMode: .fill)
						 .frame(width: geometry.size.width - 10, height: 180)
						 .clipped()
						 .scaledToFill()
				 } placeholder: {
					 Image(systemName: "photo")
						 .frame(width: geometry.size.width - 10, height: 180)
				 }
				 VStack(alignment: .leading){
					 Text("$\(listing.price)")
						 .font(.title2)
					 Text(listing.title)
					 Text(listing.displayedDetail)
						 .font(.footnote)
						 .foregroundColor(.gray)
				 }
				 .frame(width: geometry.size.width - 10, height: 50, alignment: .leading)
			 }
		 .padding(.leading, 5)
		 }
		 
	 }
}

struct ListingThumbnailView_Previews: PreviewProvider {
	 static var previews: some View {
		 ListingThumbnailView(listing: MarketPlaceThumbnail.mockData)
	 }
}
