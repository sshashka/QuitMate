//
//  API.swift
//  QuitMate
//
//  Created by Саша Василенко on 17.02.2023.
//

import Foundation

class NewsApi {
    let baseURL = "https://newsapi.org/v2/"
    let token = "&apiKey=6a275ba7b8684adaac457ff02bedd9b6"
    let standartPageSize = 10
}

struct ApiArrayResponce<Data: Codable>: Codable {
    let status: String
    let totalResults: Int?
    let articles: [Data]
}
