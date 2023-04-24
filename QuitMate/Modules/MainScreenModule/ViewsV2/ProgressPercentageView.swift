//
//  ProgressPercentageView.swift
//  QuitMate
//
//  Created by Саша Василенко on 24.04.2023.
//

import SwiftUI

struct ProgressPercentageView: View {
    var percentage: Int
    var body: some View {
        VStack(alignment: .center) {
            Text("Progress")
                .font(.custom("Poppins-Medium", size: 18))
            Text("\(percentage)")
                .font(.custom("Poppins-Black", size: 48))
            Text("%")
                .font(.custom("Poppins-Medium", size: 18))
        }
        .padding()
    }
}

struct ProgressPercentageView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressPercentageView(percentage: 76)
    }
}


