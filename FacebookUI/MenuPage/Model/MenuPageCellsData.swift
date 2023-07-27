//
//  MenuPageCellsData.swift
//  FacebookUI
//
//  Created by Joshua Ho on 6/29/23.
//

import Foundation

struct MenuCell: Identifiable {
    var id = UUID()
    
    let image: String
    let title: String
//    let destination: String //not implemented for now until other pages created
    
    static let shortcutsData = [
        MenuCell(image: "bookmark.fill", title: "Saved"),
        MenuCell(image: "clock.arrow.circlepath", title: "Memories"),
        MenuCell(image: "calendar.badge.exclamationmark", title: "Events"),
        MenuCell(image: "gamecontroller.fill", title: "Gaming"),
        MenuCell(image: "rectangle.fill.badge.person.crop", title: "Feeds"),
        MenuCell(image: "person.3.fill", title: "Friends"),
        MenuCell(image: "bag.fill", title: "Marketplace"),
        MenuCell(image: "play.tv.fill", title: "Videos on Watch"),
        MenuCell(image: "flag.fill", title: "Pages"),
        MenuCell(image: "video.bubble.left", title: "Reels"),
        MenuCell(image: "newspaper", title: "News"),
        MenuCell(image: "heart.fill", title: "Dating"),
        MenuCell(image: "handbag.fill", title: "Shop"),
        MenuCell(image: "person.2.circle.fill", title: "Groups"),
        MenuCell(image: "face.smiling.inverse", title: "Avatars"),
        MenuCell(image: "exclamationmark.bubble.circle.fill", title: "Crisis response"),
        MenuCell(image: "trophy.fill", title: "Fantasy Games"),
        MenuCell(image: "message", title: "Messenger Kids"),
        MenuCell(image: "star.circle.fill", title: "Voting Information Center")
    ]
    
    static let helpAndSupportData = [
        MenuCell(image: "lifepreserver", title: "Help Center"),
        MenuCell(image: "tray.fill", title: "Support Inbox"),
        MenuCell(image: "exclamationmark.triangle.fill", title: "Report a problem"),
        MenuCell(image: "lock.shield.fill", title: "Safety"),
        MenuCell(image: "book.closed.fill", title: "Terms & Policies")
    ]
    
    static let settingsAndPrivacyData = [
        MenuCell(image: "person.circle.fill", title: "Settings"),
        MenuCell(image: "iphone", title: "Device requests"),
        MenuCell(image: "rectangle.3.group.bubble.left.fill", title: "Recent ad activity"),
        MenuCell(image: "creditcard.fill", title: "Orders and payments")
    ]
}
