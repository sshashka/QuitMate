//
//  MainScreenNewsModule.swift
//  QuitMate
//
//  Created by Саша Василенко on 17.02.2023.
//

import Foundation

typealias MainScreenNews = [MainScreenNewsModuleModel]

struct MainScreenNewsModuleModel: Codable {
    let source: Source
    let author: String
    let title, description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

struct Source: Codable {
    let id: String?
    let name: String
}

extension MainScreenNewsModuleModel {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        source = try container.decodeIfPresent(Source.self, forKey: .source) ?? Source(id: "No data", name: "No data")
        author = try container.decodeIfPresent(String.self, forKey: .author) ?? "Unknown"
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? "No data"
        description = try container.decodeIfPresent(String.self, forKey: .description) ?? "No description"
        url = try container.decodeIfPresent(String.self, forKey: .url) ?? "No data"
        urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage) ?? "No data"
        publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt) ?? "No data"
        content = try container.decodeIfPresent(String.self, forKey: .content) ?? "No data"
    }
}
