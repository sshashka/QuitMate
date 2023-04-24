//
//  MoodModel.swift
//  QuitMate
//
//  Created by Саша Василенко on 01.03.2023.
//

import Foundation

struct MoodModel: Identifiable {
    let id: UUID
    let date: Date
    let userScore: Int
}
