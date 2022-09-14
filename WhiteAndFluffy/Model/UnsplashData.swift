//
//  UnsplashData.swift
//  WhiteAndFluffy
//
//  Created by Асхат Баймуканов on 07.09.2022.
//

import Foundation

struct UnsplashData: Codable {
    let results: Results
    let total: Int
    
}

struct Results: Codable {
    let id: String
    let description: String
    let urls: Urls

}

struct Urls: Codable {
    let small: String
}
