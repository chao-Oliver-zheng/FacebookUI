//
//  ReelsModel.swift
//  FacebookUI
//
//  Created by Calvin Pham on 7/14/23.
//

import Foundation

struct ReelInfo: Hashable {
    
    // Mandatory for hashable
    var reelID: UUID
    
    // Reel Image
    var reelImage: String
    
    // User profile image
    var userProfileImage: String
    
    // Num likes before and after liking
    var numLikesBefore: String
    var numLikesAfter: String
    
    // Number of comments and shares
    var numComments: String
    var numShares: String
    
    // Reel information
    var uploaderName: String
    var uploaderImage: String
    var description: String
    var songName: String

    
    // Note that there is not enough memory aparently for 4+ reels and it resets, even though we use state variables as the toggle items, so when
    // presenting, use 3 at max please
    static var mockData = [
        
        // Workout Example
        ReelInfo(reelID: UUID(), reelImage: "https://images.pexels.com/photos/3490348/pexels-photo-3490348.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                 userProfileImage: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                 numLikesBefore: "5.2k",
                 numLikesAfter: "5.2k",
                 numComments: "107",
                 numShares: "56",
                 uploaderName: "workoutclips",
                 uploaderImage: "https://images.pexels.com/photos/4164763/pexels-photo-4164763.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                 description: "Watch this person curl!                                   Like Comment Share Follow! Follow @workoutclips for more great workout content!",
                 songName: "Eye of the Tiger"),
        
        // Backflip Example
        ReelInfo(reelID: UUID(),
                 reelImage: "https://images.pexels.com/photos/9249770/pexels-photo-9249770.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                 userProfileImage: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                 numLikesBefore: "839",
                 numLikesAfter: "840",
                 numComments: "42",
                 numShares: "12",
                 uploaderName: "Extreme Sports Inc.",
                 uploaderImage: "https://images.pexels.com/photos/1430931/pexels-photo-1430931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                 description: "Doing the craziest backflips.                @Extreme_Sports_Inc. #parkour #parkourlife #parkour4life #parkourtraining #parkourfreerun #parkourgirl #Parkournyc #ParkourIndonesia #parkourtv #parkourislife #parkourandfreerunning #parkourgym #parkourpark #parkourforlife #parkourday #parkourlifestyle #parkourstore #parkouregypt #parkouring #parkourfail #parkourchile #parkourkids #parkourculture #parkourfamily #parkouruk #parkourdxb #parkourmexico #parkourgenerations #parkourindia #parkouracademy",
                 songName: "Original"),
        
        // Panda example
        ReelInfo(reelID: UUID(),
                 reelImage: "https://images.pexels.com/photos/3608263/pexels-photo-3608263.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                 userProfileImage: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                 numLikesBefore: "73k",
                 numLikesAfter: "73k",
                 numComments: "22.5k",
                 numShares: "6.7k",
                 uploaderName: "CutestAnimals",
                 uploaderImage: "https://images.pexels.com/photos/568022/pexels-photo-568022.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                 description: "Look at this super cute panda chewing on some leaves. #panda #cute #animals #food #nature #cute #animals #animalsoffacebook #animalsco #animalsmood #animalslover #animalshelter #animalsaddict #animalstyle #animalsanctuary #animalsarefriends #animalsoffb #animalslovers #animalsarefriendsnotfood #animalslove",
                 songName: "Relaxing Music with Nature Sounds - Waterfall HD"),
        
        // Artist example
//        ReelInfo(reelID: UUID(),
//                 reelImage: "https://images.pexels.com/photos/587958/pexels-photo-587958.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                 userProfileImage: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                 numLikesBefore: "103k",
//                 numLikesAfter: "103k",
//                 numComments: "44k",
//                 numShares: "18k",
//                 uploaderName: "ArtsyJenzy",
//                 uploaderImage: "https://images.pexels.com/photos/933255/pexels-photo-933255.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                 description: "1 minute painting challenge.                Follow me @ArtsyJenzy for more art clips!",
//                 songName: "Mozart: Overture - 'Lucio Silla'",
//                 following: false),
        
        
        // Cooking tutorial
//        ReelInfo(reelID: UUID(),
//                 reelImage: "https://images.pexels.com/photos/8357677/pexels-photo-8357677.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                 userProfileImage: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                 numLikesBefore: "756",
//                 numLikesAfter: "757",
//                 numComments: "23",
//                 numShares: "3",
//                 uploaderName: "That1Chef",
//                 uploaderImage: "https://images.pexels.com/photos/3814446/pexels-photo-3814446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                 description: "Cooking up something great. Follow me as I show you this weeks recipe!",
//                 songName: "Hells Kitchen Theme Song",
//                 following: false),
//
        
        // Scooba Diving
//        ReelInfo(reelID: UUID(),
//                 reelImage: "https://images.pexels.com/photos/2765871/pexels-photo-2765871.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                 userProfileImage: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                 numLikesBefore: "937",
//                 numLikesAfter: "938",
//                 numComments: "31",
//                 numShares: "3",
//                 uploaderName: "XploringTheDeep",
//                 uploaderImage: "https://images.pexels.com/photos/1430931/pexels-photo-1430931.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
//                 description: "Watch as we descend into the most dangerous waters in the pacific.",
//                 songName: "Original",
//                 following: false)
//
    ]
}

