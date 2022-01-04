//
//  GetUserResponse.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 4.01.2022.
//

import Foundation


struct GetUserResponse: Codable {
    let results: GetUserResultsResponse
}

struct GetUserResultsResponse: Codable {
    let user: UserInfo
}

struct UserInfo: Codable {
    let calorie: Int
    let _id: String
    let email: String
    let name: String
    let surName: String
}
