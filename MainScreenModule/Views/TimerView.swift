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
                .stroke(Color.white, lineWidth: 5)
                .glow(color: .white, radius: 10)
                .background(
                    Circle()
                        .blur(radius: 10)
                        .opacity(0.0)
                )
            
            VStack(spacing: 0) {
                Spacer()
                Text("12:34")
                    .foregroundColor(.black)
                    .font(.system(size: 40, weight: .black, design: .rounded))
                    .padding(.top, 30)
                
                    .padding(30)
                
                Button(action: {
                    // Button action
                }, label: {
                    Text("Button")
                })
                .frame(width: 150, height: 60)
                .background(Color(Constants.greenButtonColor))
                .foregroundColor(.white)
                .cornerRadius(30)
                .shadow(radius: 10)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
