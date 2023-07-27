//
//  PeopleYouMayKnowData.swift
//  FacebookUI
//
//  Created by Syed Raza on 7/10/23.
//

import SwiftUI
struct PeopleYouMayKnowView: View {
    var peopleData: PeopleYouMayKnowData

    var body: some View {
        VStack {

            Text("People You May Know")
                           .font(.headline)
                           .frame(maxWidth: .infinity, alignment: .leading)
                           .padding()
            
            ScrollView {
                VStack(spacing: 10) { // Use spacing to add space between each card
                    ForEach(PeopleYouMayKnowData.mockData) { person in
                        HStack(spacing: 12) {
                            Image(person.profilePicturePath)
                                .resizable()

                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(person.firstName) \(person.lastName)")
                                    .font(.headline)
                                
                                Text("\(person.numMutualFriends) Mutual Friends")
                                    .font(.subheadline)
                                
                                HStack(spacing: 8) {
                                    Button(action: {
                                        // Add Friend button action
                                    }) {
                                        Text("Add Friend")
                                            .frame(width: 130, height: 40)
                                            .background(Color.blue)
                                            .foregroundColor(.white)
                                            .cornerRadius(5)
                                    }
                                    
                                    Button(action: {
                                        // Remove button action
                                    }) {
                                        Text("Remove")
                                            .frame(width: 130, height: 40)
                                            .background(
                                                  LinearGradient(
                                                      gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.3)]),
                                                      startPoint: .leading,
                                                      endPoint: .trailing
                                                  )
                                              )
                                            .foregroundColor(.black)
                                            .cornerRadius(5)
                                    }
                                }
                            }
                            

                        }
                    }
                }
                .padding(10)
            }
        }
    }
}




struct PeopleYouMayKnowView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleYouMayKnowView(peopleData: PeopleYouMayKnowData.mockData[0])
    }
}
