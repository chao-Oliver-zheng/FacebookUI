//
//  StoryCellDataModel.swift
//  FacebookUI
//
//  Created by Cameron on 6/30/23.
//

import Foundation

struct StoryCellDataModel: Identifiable {
    
    let id = UUID()
    let posterProfile: PosterProfile;
    let description: String;
    
    private let postedDate: Date;
    public var postedDateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d";
        
        let formattedDate = dateFormatter.string(from: self.postedDate);
        return formattedDate;
    }
    
    let contentImagePath: String;
    
    // TODO: Add convertIntToTruncedString to reactions count?
    let reactions: PostReactions;
    
    let numberComments: Int;
    var numberOfCommentsString: String {
        return self.convertIntToTruncedString(value: self.numberComments)
    }
    
    let numberShares: Int;
    var numberOfSharesString: String {
        return self.convertIntToTruncedString(value: self.numberShares)
    }
    
    let numberViews: Int;
    var numberOfViewsString: String {
        return self.convertIntToTruncedString(value: self.numberViews)
    }
    
    /// Convert integer value to string value, truncated and abreviated. This could be an integer extension.
    /// But leaving here fore now.
    private func convertIntToTruncedString(value: Int) -> String {
        
        /// 1,000,000 to 1M
        if(1_000_000 % value == 1_000_000) {
            //TODO: Round before division.
            let truncatedValue: Float = roundf(Float(value) / Float(1_000_000));
            if(truncatedValue.truncatingRemainder(dividingBy: 1) == 0) {
                return "\(String(format: "%.0f", truncatedValue))M"
            }
            else {
                return "\(String(format: "%.1f", truncatedValue))M"
            }
        }
        
        /// 800,000 to 800K
        if(100_000 % value == 100_000) {
            // TODO: Round to the nearest 1000
            return "\(value / 1000)k"
        }
        
        /// 15,000 to 15K or 1,500 to 1.5K
        if(1_000 % value == 1_000) {
            //TODO: Round before division.
            let truncatedValue: Float = roundf(Float(value) / Float(1_000));
            if(truncatedValue.truncatingRemainder(dividingBy: 1) == 0) {
                return "\(String(format: "%.0f", truncatedValue))K"
            }
            else {
                return "\(String(format: "%.1f", truncatedValue))K"
            }
        }
        
        /// 300
        return "\(value)"
    }
    
    static let mockData: StoryCellDataModel = StoryCellDataModel(posterProfile: .mockData,
                                                                 description: "Star Signs As Cupcakes",
                                                                 postedDate: Date(),
                                                                 contentImagePath: "storyCellMock1",
                                                                 reactions: .mockData,
                                                                 numberComments: 147,
                                                                 numberShares: 598,
                                                                 numberViews: 8_224_521)

    static func mockDataList() -> [StoryCellDataModel] {
        
        let count = min(postDescriptions.count, contentImagePaths.count, profiles.count);
        var mockData: [StoryCellDataModel] = [];
        for index in 0..<count {
            let randomReactions = Int.random(in: 5...1_000);
            let randomNumComments = Int.random(in: 300...5_000);
            let randomNumShares = Int.random(in: 300...5_000);
            let randomNumViews = Int.random(in: 10_000...1_000_000);
            
            mockData.append(StoryCellDataModel(posterProfile: profiles[index],
                                               description: postDescriptions[index],
                                               postedDate: randomDate(),
                                               contentImagePath: contentImagePaths[index],
                                               reactions: PostReactions(reactionImagePaths: [],
                                                                        numberOfReactions: randomReactions),
                                               numberComments: randomNumComments,
                                               numberShares: randomNumShares,
                                               numberViews: randomNumViews))
        }
        
        return mockData;
    }
}

//TODO: This struct will probably become redundant with other models created across the project. Will refactor at a later point.
struct PosterProfile {
    let profileImage: String;
    let name: String;
    
    static let mockData: PosterProfile = PosterProfile(profileImage: "storyCellUserDefault",
                                                       name: "Twisted")
}

struct PostReactions {
    let reactionImagePaths: [String];
    let numberOfReactions: Int;
    
    static let mockData: PostReactions = PostReactions(reactionImagePaths: [],
                                                       numberOfReactions: 3_420)
}

/// Returns a random date object between Jan 1, 2023 and Jul 1, 2023
private func randomDate() -> Date {
    
    let secondsInADay: Int = 86400
    let jan_1_2023: Int = 1672560000;
    let randomDays: Int = Int.random(in: 0...181);
    let randomTimecode = jan_1_2023 + (randomDays * secondsInADay);
    
    return Date(timeIntervalSince1970: Double(randomTimecode));
}

private let postDescriptions: [String] = [
    "Star Signs As Cupcakes",
    "I was completely stuned to see our new rescue",
    "Husky Pranked by Wolf Mask!",
    "Frozen Solid Rug ! Can It Be Restored?",
    "Her appearance makes her look totally different from the final reaction.",
    "Creative Pastry Crusts",
    "Easy and beautiful 4th of July centerpiece",
    "Satisfying Painting Techniques",
    "Wax pouring videos that are worth procrastinating for",
    "DIY Fun with Dad: Crafting a simple throwing axe game",
    "We're Making Super Sour Watermelon Hard Candies"
]

private let contentImagePaths: [String] = [
    "watchTabStoryMock1",
    "watchTabStoryMock2",
    "watchTabStoryMock3",
    "watchTabStoryMock4",
    "watchTabStoryMock5",
    "watchTabStoryMock6",
    "watchTabStoryMock7",
    "watchTabStoryMock8",
    "watchTabStoryMock9",
    "watchTabStoryMock10",
    "watchTabStoryMock11"
]

private let profiles: [PosterProfile] = [
    PosterProfile.mockData,
    PosterProfile(profileImage: "storyCellUserDefault", name: "The Asher House"),
    PosterProfile(profileImage: "storyCellUserDefault", name: "My Mountain Husky"),
    PosterProfile(profileImage: "storyCellUserDefault", name: "Mountain Rug Cleaning Pros"),
    PosterProfile(profileImage: "storyCellUserDefault", name: "Federico Cecchin"),
    PosterProfile.mockData,
    PosterProfile(profileImage: "storyCellUserDefault", name: "Cirqnamics"),
    PosterProfile(profileImage: "storyCellUserDefault", name: "UNILAD"),
    PosterProfile(profileImage: "storyCellUserDefault", name: "Crafty"),
    PosterProfile(profileImage: "storyCellUserDefault", name: "5-Minute Crafts Men"),
    PosterProfile(profileImage: "storyCellUserDefault", name: "Hercules Candy Co")
]
