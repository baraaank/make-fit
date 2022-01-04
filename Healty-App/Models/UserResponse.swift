//
//  UserResponse.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 2.01.2022.
//

import Foundation

struct UserResponse: Codable {
    let results: UserResultsResponse
}

struct UserResultsResponse: Codable {
    let user: UserCredentials
    let token: String
}

struct UserCredentials: Codable {
    let calorie: Int?
    let _id: String
}
