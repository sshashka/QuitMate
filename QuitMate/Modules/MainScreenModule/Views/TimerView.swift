//
//  TimerView.swift
//  QuitMate
//
//  Created by Саша Василенко on 17.02.2023.
//

import SwiftUI


struct TimerView: View {
    enum TimerViewUserDefaultsKeys: String {
        case startOfTimerDate = "startOfTimerDate"
    }
    @State var dateToShow = DateComponents()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    func showTimerDate() {
        let startDate = UserDefaults.standard.object(forKey: TimerViewUserDefaultsKeys.startOfTimerDate.rawValue) as? Date
        let currentDate = Date.now
        dateToShow = Calendar.current.dateComponents([.day, .hour, .minute, .second], from: startDate!, to: currentDate)
    }
    
    func saveCurrentDate() {
        let currnentDate = Date.now
        UserDefaults.standard.set(currnentDate, forKey: TimerViewUserDefaultsKeys.startOfTimerDate.rawValue)
    }
    
    func checkIfCurrentDatePresent() {
        if UserDefaults.standard.object(forKey: TimerViewUserDefaultsKeys.startOfTimerDate.rawValue) as? Date == nil {
            saveCurrentDate()
        }
        showTimerDate()
    }
    
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
                Text("\(dateToShow.toSting())")
                    .foregroundColor(.black)
                    .font(.system(size: 40, weight: .black, design: .rounded))
                    .padding(.top, 30)
                    .padding(30)
                    .onReceive(timer, perform: { _ in
                        dateToShow.second? += 1
                    })
                    .onAppear(perform: checkIfCurrentDatePresent)
                
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
