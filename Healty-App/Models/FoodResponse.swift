//
//  FoodResponse.swift
//  Healty-App
//
//  Created by BaranK Kutlu on 2.01.2022.
//

import Foundation

struct FoodResponse: Codable {
    let results: FoodResultResponse
}

struct FoodResultResponse: Codable {
    let data: [FoodData]
}

struct FoodData: Codable {
    let title: String
    let foods: [Food]
}

struct Food: Codable {
    let name: String
    let gr: Int
    let cal: Int
    let portion: Int
    let portion_name: String
}
