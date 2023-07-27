//
//  ListingView.swift
//  FacebookUI
//
//  Created by Timothy Vermeersch on 7/12/23.
//

import SwiftUI
import MapKit

struct ListingView: View {
	var listing: MarketPlaceListing
	@State var message = ""
	@State var focusedImage = ""
	@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
	var body: some View {
		ScrollView {
			ZStack {
				VStack(alignment: .leading) {
					HStack{
						Button {
							self.presentationMode.wrappedValue.dismiss()
						} label: {
							Image(systemName: "chevron.left")
								.foregroundColor(.black)
						}
						Spacer()
						Image(systemName: "magnifyingglass")
						Image(systemName: "ellipsis")
					}
					.padding(.horizontal)
					.font(.title)
					ImageCarouselView()
					Divider()
					Text(listing.title)
						.font(.largeTitle)
						.padding(.leading)
					Text("$\(listing.price)")
						.font(.title)
						.padding(.leading)
					SendMessageView()
					OptionsButtonsView()
					Divider()
					Text("About")
						.font(.title2)
						.padding(.leading)
					ForEach(listing.itemDetails, id: \.self){ detail in
						Text(detail)
					}
					.padding(.leading)
				}
				FocusedImageView()
				
			}
			VStack(alignment: .leading) {
				Divider()
				Text("Description")
					.font(.title2)
				Text(listing.description)
				MapView()
			}
			.padding(.leading)
		}
		
		.navigationBarBackButtonHidden(true)
	}
	
	private func ImageCarouselView() -> some View {
		return TabView {
			ForEach(listing.images.indices) {
						index in
						AsyncImage(url: URL(string: listing.images[index])) { image in
							Button {
								focusedImage = listing.images[index]
							} label: {
								image
									.resizable()
									.aspectRatio(contentMode: .fill)
									.frame(width: 400, height: 400)
									.scaledToFill()
									.tag(index)
							}
						} placeholder: {
							Image(systemName: "photo")
						}
					}
				}
				.frame(width: 400, height: 400)
				.tabViewStyle(PageTabViewStyle())
				.indexViewStyle(.page(backgroundDisplayMode: .always))
	}
	private func SendMessageView() -> some View {
		return VStack(alignment: .center) {
			VStack(alignment: .leading){
						Text("\(Image(systemName: "message")) Send seller a message")
						HStack {
							TextField("Hi, is this available? ", text: $message)
								.padding(5)
								.foregroundColor(.black)
								.background(RoundedRectangle(cornerSize: CGSize(width: 5,height: 5))
									.fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.916)))
							Button {
								print("Messaging Seller \(message)")
							} label: {
								Text("Send")
									.foregroundColor(.white)
									.font(.subheadline)
									.padding(7)
									.background(RoundedRectangle(cornerSize: CGSize(width: 5,height: 5))
										.fill(.blue))
							}
							
						}
						
						
					}
					.padding(10)
					.background(RoundedRectangle(cornerSize: CGSize(width: 5,height: 5))
						.fill(.white)
						.shadow(radius: 3))
				}
				.padding(.horizontal, 20)
				.frame(maxWidth: .infinity)
	}
	private func OptionsButtonsView() -> some View {
		return HStack {
			Spacer()
					VStack {
						Image(systemName: "bell.fill")
							.padding(8)
							.background(Circle().fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.851)))
						Text("Alert")
					}
					Spacer()
					VStack {
						Image(systemName: "message.fill")
							.padding(8)
							.background(Circle().fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.851)))
						Text("Message")
					}
					Spacer()
					VStack {
						Image(systemName: "bookmark.fill")
							.padding(8)
							.background(Circle().fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.851)))
						Text("Save")
					}
					Spacer()
					VStack {
						Image(systemName: "arrowshape.turn.up.forward.fill")
							.padding(8)
							.background(Circle().fill(Color(hue: 1.0, saturation: 0.0, brightness: 0.851)))
						Text("Share")
					}
					Spacer()
				}
	}
	private func FocusedImageView() -> some View {
		return VStack {
			AsyncImage(url: URL(string: focusedImage)) {
					 image in
					 ZStack {
						 VStack(alignment: .leading) {
							 Button {
								 focusedImage = ""
							 } label: {
								 Image(systemName: "chevron.left")
									 .foregroundColor(.white)
									 .padding(.leading)
									 .font(.title)
							 }
							 Spacer()
							 image
								 .resizable()
								 .aspectRatio(contentMode: .fill)
								 .scaledToFit()
							 Spacer()
						 }
						 .background(Rectangle()
							 .edgesIgnoringSafeArea(.all)
							 .frame(height: 10000))
					 }
					 
				 } placeholder: {
					 
				 }
			 }
	}
	private func MapView() -> some View {
		return Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: listing.location.0, longitude: listing.location.1), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))), interactionModes: [],
					  annotationItems: [listing]
				 ) { _ in
					 MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: listing.location.0, longitude: listing.location.1) ) {
						 Circle()
							 .fill(Color(hue: 0.593, saturation: 1.0, brightness: 1.0, opacity: 0.309))
							 .frame(width: 100)
							 .shadow(radius: 1)
					 }
				 }
					  .frame(width: 400, height: 300)
	}
}

struct ListingView_Previews: PreviewProvider {
	 static var previews: some View {
		 ListingView(listing: MarketPlaceListing.mockData)
	 }
}
