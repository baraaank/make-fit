//
//  ReturnResponse.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 2.01.2022.
//

import Foundation

struct ReturnResponse: Codable {
    let results: SuccessResponse
}

struct SuccessResponse: Codable {
    let isUserCreated: Bool?
    let isCalorieCalculated: Bool?
}
