//
//  QuittingInformationView.swift
//  QuitMate
//
//  Created by Саша Василенко on 24.04.2023.
//

import SwiftUI

struct QuittingInformationView: View {
    var body: some View {
        VStack {
            HStack {
                StatsView()
                StatsView()
            }
            HStack {
                StatsView()
                StatsView()
            }
            Spacer(minLength: 10)
            Button {
                
            } label: {
                TextView(text: "Reset Progress", font: "Poppins-SemiBold", size: 14)
            }
            .buttonStyle(SUIButtonStyle())
            Spacer()
        }
        .padding([.horizontal])
    }
}

struct QuittingInformationView_Previews: PreviewProvider {
    static var previews: some View {
        QuittingInformationView()
    }
}
