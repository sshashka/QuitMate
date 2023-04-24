//
//  StatsView.swift
//  QuitMate
//
//  Created by Саша Василенко on 24.04.2023.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image("settings")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                TextView(text: "$52.43", font: "Poppins-SemiBold", size: 18)
                TextView(text: "Sosi hui", font: "Poppins-Light", size: 14)
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
