//
//  CalendarViewController.swift
//  QuitMate
//
//  Created by Саша Василенко on 21.02.2023.
//

import UIKit
import SwiftUI
import FSCalendar

class CalendarViewController: UIViewController {
    
    let calendarView: FSCalendar = {
        let view = FSCalendar()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.makeGlassEffectOnView(style: .light)
//        view.backgroundColor = .white.withAlphaComponent(0.3)
//        view.layer.masksToBounds = true
//        view.layer.borderColor = UIColor.white.cgColor
//        view.layer.borderWidth = 5
//        view.layer.cornerRadius = 25
//        view.addNeonBordersToView(color: .white, radius: 25)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(calendarView)
        view.setBackground()
        setupConstraints()
    
        calendarView.delegate = self
        calendarView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension CalendarViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.commonLayoutConstant),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.commonLayoutConstant)
        ])
        
    }
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.view.layoutIfNeeded()
    }
}

struct CalendarViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return CalendarViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct CalendarViewControllerPreview: PreviewProvider {
    static var previews: some View {
        CalendarViewControllerRepresentable()
    }
}
