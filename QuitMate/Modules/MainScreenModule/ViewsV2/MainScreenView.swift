//
//  MainScreenView.swift
//  QuitMate
//
//  Created by Саша Василенко on 24.04.2023.
//

import SwiftUI

struct MainScreenView: View {
    var body: some View {
        VStack {
            VStack {
                ProgressView()
                    .padding([.all], 20)
                TextView(text: "0y 3m 28d", font: "Poppins-SemiBold", size: 18)
                TextView(text: "Quitting Duration", font: "Poppins-Regular", size: 14)
                Spacer()
                QuittingInformationView()
                    .background(Color.white)
                    .cornerRadius(35)

            }
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
