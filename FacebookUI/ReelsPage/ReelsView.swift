//
//  ReelsView.swift
//  FacebookUI
//
//  Created by Calvin Pham on 7/14/23.
//


import SwiftUI

// For the sliding text, I used a github package called "Marquee", taken from: https://github.com/SwiftUIKit/Marquee
import Marquee

// To get it to vertically slide up and down I used this code from here
// https://blog.prototypr.io/how-to-vertical-paging-in-swiftui-f0e4afa739ba

// Note for this project, to be able to swipe up and down on views, I used code from here:
// https://blog.prototypr.io/how-to-vertical-paging-in-swiftui-f0e4afa739ba
// And so as a result, it slightly alterred the positioning of all the UI elements leftward, so I had to
// specifically position the elements using many frames, padding, etc. more than one would normally do so

// Also note that to click on the bottom right sidebar, click on the left part of the icons, because of the vertical swiping
// functionality

struct ReelsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var reelsModel = ReelInfo.self
    
    var body: some View {
            
        // In order to be able to vertically swipe, we wrap the ForEach loop in all this code
        // Refer to the above comments for an explanation and link
        GeometryReader { proxy in
            TabView {
                
                ForEach(reelsModel.mockData, id: \.self) { reelData in
                    InvidividualReel(reelData: reelData)
                }
                .rotationEffect(.degrees(-90)) // Rotate content
                .frame(
                    width: proxy.size.width,
                    height: proxy.size.height
                )
            }
            .frame(
                width: proxy.size.height, // Height & width swap
                height: proxy.size.width
            )
            .rotationEffect(.degrees(90), anchor: .topLeading) // Rotate TabView
            .offset(x: proxy.size.width) // Offset back into screens bounds
            .tabViewStyle(
                PageTabViewStyle(indexDisplayMode: .never)
            )
        }.ignoresSafeArea(.all)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarItems(leading: backButton,
                            trailing: utilityHeader(myReel: reelsModel.mockData[0]))
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
    
    // Back button implementation
    var backButton: some View {
        HStack {
            // "<" Icon (Goes back to grid view menu)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left").foregroundColor(.white).bold()
            }
        }
    }
}
    
    
// The above's struct ForEach loop creates instances of this struct and this is where the main organization of the
// UI takes place
struct InvidividualReel: View {
    
    var reelData: ReelInfo
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .bottom) {
                posterInfo(myReel: reelData)
                videoInfo(myReel: reelData)
            }
            .padding(.leading, 80)
            HStack {
                commentFooter
            }
        }
        .frame(width: .infinity, height: .infinity)
        .background(AsyncImage(url: URL(string: reelData.reelImage)))
    }
}

// This is the top header which includes the magnifying glass, camera, and user icon circle picture
struct utilityHeader: View {
    
    // This struct takes in ReelInfo
    var myReel: ReelInfo
    
    var body: some View {
        HStack {
            Spacer()
            Group {
                
                // Search icon for searching for reels
                Button(action: {
                    //TODO: Implement reels search function.
                    print("Implement search function.")
                }) {
                    Image(systemName: "magnifyingglass").bold().foregroundColor(.white)
                }
                
                // Photo icon (Create a reel page)
                Button(action: {
                    //TODO: Implement reels camera upload function.
                    print("Implement reels upload function.")
                }) {
                    Image(systemName: "camera.fill").bold().foregroundColor(.white)
                }
                
                // Profile picture (Sends back to user profile page)
                Button(action: {
                    //TODO: Implement user profile button.
                    print("Reels View. Implement going back to user profile.")
                }) {
                    AsyncImage(
                        url: URL(string: myReel.userProfileImage),
                        content: { image in
                            image.resizable()
                                .frame(width: 27, height: 35)
                                .clipShape(Circle())
                                .scaledToFill()
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    .padding(.leading, 2)
                }

            }
        }
    }
}
    

// Contains the poster profile image, name, follow, video description, and music icon and name of poster and music
struct posterInfo: View {
    
    // This struct takes in ReelInfo
    var myReel: ReelInfo
    
    // The toggles for the follow button and for reel descripition expansion and compression
    @State private var followToggle = false
    @State private var descriptionToggle = false
    
    var body: some View {
        VStack {
            HStack {
                
                // Reel Poster Profile Image
                Button(action: {
                    //TODO: Implement uploader page redirection.
                    print("Reels View. Implement uploaders page.")
                }) {
                    AsyncImage(
                        url: URL(string: myReel.uploaderImage),
                        content: { image in
                            image.resizable()
                                .frame(maxWidth: 42, maxHeight: 50)
                                .clipShape(Circle())
                                .scaledToFill()
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                    
                    Text(myReel.uploaderName).foregroundColor(.white).bold()
                    Image(systemName: "globe.americas.fill").foregroundColor(.white)
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                }
                
                // The Follow/Followed toggle
                Button(action : {
                    print("Follow")
                    self.followToggle.toggle()
                }) {
                    if (self.followToggle) {
                        Text("Followed").foregroundColor(.white)
                                .font(.system(size: 15))
                                .bold()
                                .padding(.horizontal, 7)
                                .padding(.vertical, 2)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.white, lineWidth: 1)
                                )
                    } else {
                        Text("Follow").foregroundColor(.white)
                                .font(.system(size: 15))
                                .bold()
                                .padding(.horizontal, 7)
                                .padding(.vertical, 2)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.white, lineWidth: 1)
                                )
                    }
                }

            }
            .frame(width: 300, height: 30, alignment: .leading)
            .padding(.leading, 25)

            Button(action : {
                print("Description expansion/compression")
                self.descriptionToggle.toggle()
            }) {
                if (self.descriptionToggle) {
                        Text("\(myReel.description)")
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            .padding(13)
                            .padding(.trailing, 20)
                            .frame(maxWidth: 400, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .background(Color.gray.opacity(0.5))
                            .cornerRadius(15)
                    
                } else {
                        Text("\(myReel.description)")
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                        .frame(maxWidth: 300, maxHeight: 20, alignment: .leading)
                }

            }
            .padding(.leading, 14)

            
            // For the moving music name
            Button(action : {
                print("Follow")
            }) {
                HStack {
                    Text("   ♫")
                        .foregroundColor(.white)
                        .bold()
                    
                    Marquee {
                        Text("\(myReel.uploaderName) • \(myReel.songName)")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .frame(width: 115)
                    .marqueeDuration(4)
                    
                }
                .frame(width: 170, height: 35, alignment: .leading)
                .background(Color.gray.opacity(0.5))
                .cornerRadius(40)
                
            }
            .frame(width: 260, alignment: .leading)
            .padding(.trailing, 12)
            }
        .frame(width: 300)
    }
}


struct videoInfo: View {
    
    // This struct takes in ReelIfno
    var myReel: ReelInfo
    
    @State var liked = false
    
    // Contains the likes, comments, shares, and ellipses of the video. (The right sidebar)
    var body: some View {
        HStack {
            Spacer()
            VStack(spacing: 25) {

                Button(action: {
                    print("Liked/Disliked Reel.")
                    self.liked.toggle()
                }) {
                    if (self.liked) {
                        VStack(spacing: 7) {
                            Image(systemName: "hand.thumbsup.fill")
                                .font(.system(size: 22))
                                .frame(width: 40, height: 40)
                                .background(Color.blue)
                                .clipShape(Circle())
                            
                            Text("\(myReel.numLikesAfter)")
                                .font(.system(size: 14))
                        }
                        
                    } else {
                        VStack(spacing: 7) {
                            Image(systemName: "hand.thumbsup.fill")
                                .font(.system(size: 22))
                                .frame(width: 40, height: 40)
                            Text("\(myReel.numLikesBefore)")
                                .font(.system(size: 14))
                        }
                    }
                }
                
                
                // Comments
                Button(action: {
                    //TODO: Implement comments page
                    print("Implement the comments page.")
                }) {
                    VStack(spacing: 7) {
                        VStack(spacing: 7) {
                            Image(systemName: "bubble.right.fill").foregroundColor(.white)
                                .font(.system(size: 22))
                            Text("\(myReel.numComments)")
                                .font(.system(size: 14))
                        }
                    }
                }
                
                // Shares
                Button(action: {
                    //TODO: Implement sharing page.
                    print("Reels View. Implement sharing page.")
                }) {
                    VStack(spacing: 7) {
                        Image(systemName: "arrowshape.turn.up.right.fill").foregroundColor(.white)
                            .font(.system(size: 22))
                        Text("\(myReel.numShares)")
                            .font(.system(size: 14))
                    }
                }
      
                // Ellipses
                Button(action: {
                    //TODO: Implement more options.
                    print("Implement more options.")
                }) {
                    VStack(spacing: 7) {
                        Image(systemName: "ellipsis").foregroundColor(.white)
                    }
                }
            }
            .foregroundColor(.white)
            .bold()
            .padding(.horizontal, 20)
            .padding(.top, 20)
            .padding(.trailing, 6)
        }
        .frame(maxWidth: 150, maxHeight: 300)
    }
}
    
    // Contains the add comment footer
    var commentFooter: some View {
        Button(action: {
            //TODO: Implement comments page.
            print("Reels View. Implement going back.")
        }) {
            HStack(alignment: .center) {
                
                Text("Add a comment...")
                    .padding()
                    .padding(.leading, 85)
                    .foregroundColor(.gray)
            }
            .frame(width: 500, alignment: .leading)
            .padding(.bottom, 20)
            .background(.black)
        }
    }
    
struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ReelsView()
        }
    }
}