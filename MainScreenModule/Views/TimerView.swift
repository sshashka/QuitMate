//
//  TimerView.swift
//  QuitMate
//
//  Created by Саша Василенко on 17.02.2023.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.orange, lineWidth: 5)
                .background(
                    Circle()
                        .blur(radius: 10)
                        .opacity(0.0)
                )
            
            VStack {
                Text("12:34")
                    .foregroundColor(.black)
                    .font(.system(size: 22, weight: .black, design: .rounded))

                Button(action: {
                    // Button action
                }, label: {
                    Text("Button")
                })
                .foregroundColor(.white)
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
