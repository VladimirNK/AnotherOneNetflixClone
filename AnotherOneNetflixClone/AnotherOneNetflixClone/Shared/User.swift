//
//  User.swift
//  SwiftUIInPractice
//
//  Created by Vladimir Kozlov on 18.04.2024.
//

import Foundation
 
struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Int
    let weight: Double
    
    var work: String {
        "Worker at some job"
    }
    var education: String {
        "Graduate Degree"
    }
    
    var aboutMe: String {
         "This is a sentence About Me that will look good in my profile"
    }
    
    var imagaes: [String] {
        [
            "https://picsum.photos/500/500", "https://picsum.photos/600/600", "https://picsum.photos/700/700"
        ]
    }
    
    static var mock: User {
        User(
            id: 444,
            firstName: "Volodymyr",
            lastName: "Kozlov",
            age: 37,
            email: "test@test.com",
            phone: "",
            username: "",
            password: "" ,
            image: Constants.randomImage ,
            height: 173,
            weight: 60
        )
    }
}
