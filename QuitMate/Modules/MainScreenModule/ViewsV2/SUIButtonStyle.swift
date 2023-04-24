//
//  SUIButtonStyle.swift
//  QuitMate
//
//  Created by Саша Василенко on 24.04.2023.
//

import SwiftUI

struct SUIButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(Color(Constants.purpleColor))
            .cornerRadius(10)
            .padding(.horizontal, 20)
            .shadow(color: Color(Constants.purpleColor), radius: 10)
    }
    
}
