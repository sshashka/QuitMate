//
//  TextView.swift
//  QuitMate
//
//  Created by Саша Василенко on 24.04.2023.
//

import SwiftUI

struct TextView: View {
    let text: String
    let font: String
    let size: Int
    var body: some View {
        Text(text)
            .font(.custom(font, size: CGFloat(size)))
            .foregroundColor(Color(Constants.labelColor))
    }
}
