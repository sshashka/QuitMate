//
//  TimerView.swift
//  QuitMate
//
//  Created by Саша Василенко on 17.02.2023.
//

import SwiftUI

enum TimerViewUserDefaultsKeys: String {
    case startOfTimerDate = "startOfTimerDate"
}


struct TimerView: View {
    @State var size: CGSize = .zero
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(Constants.labelColor), lineWidth: 3)
                .glow(color: Color(Constants.labelColor), radius: 10)
                .background(
                    GeometryReader { proxy in
                        Circle()
                            .foregroundColor(.white)
                            .opacity(0.15)
                            .blur(radius: 10)
                            .onAppear {
                                size = proxy.size
                            }
                    }
                )
            
                .overlay(
                    LabelAndButtonView(desiredHeigt: size)
                        .background(Color.clear)
                        .padding(20)
                    
                )
        }
    }
    
    
    struct TimerView_Previews: PreviewProvider {
        static var previews: some View {
            TimerView()
        }
    }
    
    
    struct LabelAndButtonView: View {
        var desiredHeigt: CGSize
        @State var dateToShow = DateComponents()
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        func showTimerDate() {
            let startDate = UserDefaults.standard.object(forKey: TimerViewUserDefaultsKeys.startOfTimerDate.rawValue) as? Date
            guard startDate == startDate else {
                saveCurrentDate()
                return
            }
            let currentDate = Date.now
            dateToShow = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: startDate!, to: currentDate)
        }
        
        func saveCurrentDate() {
            let currnentDate = Date.now
            UserDefaults.standard.set(currnentDate, forKey: TimerViewUserDefaultsKeys.startOfTimerDate.rawValue)
            showTimerDate()
        }
        var body: some View {
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                Text("\(dateToShow.toSting())")
                    .foregroundColor(Color(Constants.labelColor))
                    .font(.custom("Poppins-Bold", size: 30))
                    .padding(.top, 10)
                    .onReceive(timer, perform: { _ in
                        dateToShow.second? += 1
                    })
                    .onAppear(perform: showTimerDate)
                    .frame(height: desiredHeigt.height / 2)
                Button(action: {
//                    delegate?.didTapOnResetButton()
                }, label: {
                    Text("Restart timer")
                        .font(.custom("Poppins-Medium", size: 16))
                        .foregroundColor(Color(Constants.labelColor))
                })
                .frame(width: 150, height: desiredHeigt.height / 7)
                .background(Color(Constants.backgroundColor))
                .cornerRadius(30)
                .shadow(radius: 10)
                Spacer(minLength: 10)
            }
        }
    }
}
