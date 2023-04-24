//
//  MoodChartView.swift
//  QuitMate
//
//  Created by Саша Василенко on 01.03.2023.
//

import SwiftUI
import Charts

struct MoodChartView: View {
    @State var chartData: [MoodModel] = []
    var body: some View {
        Chart(chartData) { day in
            LineMark(x: .value("Day", day.date), y: .value("Score", day.userScore))
                .foregroundStyle(Color(Constants.labelColor))
                .interpolationMethod(.cardinal)
            AreaMark(x: .value("Day", day.date), y: .value("Score", day.userScore))
                .foregroundStyle(Gradient(colors: [Color(Constants.labelColor), Color(uiColor: .systemBackground)]))
                .interpolationMethod(.cardinal)
                
        }
        .onAppear(perform: generateDate)
            .frame(height: 150)
            .chartYAxis(.automatic)
            .chartXAxis(.automatic)
    }
    
    func randomDate() -> Date {
        let now = Date()
        let pastDate = Calendar.current.date(byAdding: .day, value: -30, to: now)!
        let timeInterval = now.timeIntervalSince(pastDate)
        let randomInterval = TimeInterval(arc4random_uniform(UInt32(timeInterval)))
        return pastDate.addingTimeInterval(randomInterval)
    }
    
    func generateDate() {
        var data: [MoodModel] = []
        for i in 0..<10 {
            let randomDate = randomDate()
            let moodModel = MoodModel(id: UUID(), date: randomDate, userScore: Int.random(in: 10...100))
            data.append(moodModel)
        }
        chartData = data.sorted(by: {
            $0.date > $1.date
        })
    }
}

struct MoodChartView_Previews: PreviewProvider {
    static var previews: some View {
        MoodChartView()
    }
}
