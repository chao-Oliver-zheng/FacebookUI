//
//  YourShortcutsModel.swift
//  FacebookMenuPage
//
//  Created by Ajinkya Mate on 7/19/23.
//

import Foundation

struct YourShortcutsData: Identifiable {
    var id = UUID()
    let firstName: String
    let lastName: String
    
    static let dummyData = [
        YourShortcutsData(firstName: "John", lastName: "Doe"),
        YourShortcutsData(firstName: "David", lastName: "Barry"),
        YourShortcutsData(firstName: "Ken", lastName: "Yusuf"),
        YourShortcutsData(firstName: "Jake", lastName: "Molina"),
        YourShortcutsData(firstName: "Raj", lastName: "Dhaliwal"),
        YourShortcutsData(firstName: "Jose", lastName: "Menendez"),
        YourShortcutsData(firstName: "Carl", lastName: "Johnson"),
        YourShortcutsData(firstName: "Barack", lastName: "Obama"),
        YourShortcutsData(firstName: "Antony", lastName: "Nguyen"),
        YourShortcutsData(firstName: "Heather", lastName: "Williams"),
        YourShortcutsData(firstName: "Anushka", lastName: "Arora")
    ]
}
