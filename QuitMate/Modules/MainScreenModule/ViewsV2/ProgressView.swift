//
//  ProgressView.swift
//  QuitMate
//
//  Created by Саша Василенко on 24.04.2023.
//

import SwiftUI

struct ProgressView: View {
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.76)
                .stroke(Color(Constants.purpleColor), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(Angle(degrees: -90))
                .glow(color: Color(Constants.purpleColor), radius: 10)
                .overlay {
                    ProgressPercentageView(percentage: 76)
                }
            .padding()
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}


