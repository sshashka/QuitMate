//
//  ReasonsToStopModuleProtocol.swift
//  QuitMate
//
//  Created by Саша Василенко on 20.03.2023.
//

import Foundation

final class ReasonsToStopModulePresenter: ReasonsToStopPresenterProtocol {
    let array = ["Nicotine addiction", "Stress", "Social situations", "Habits and routines", "Weight gain", "Boredom", "Lack of support", "Alcohol consumption", "Advertising", "Low mood", "Peer pressure", "Mental health conditions", "Lack of information", "Feeling overwhelmed", "Lack of alternatives", "The belief that smoking is enjoyable", "Access to cigarettes", "Lack of commitment", "Lack of self-efficacy", "Fear of failure"]
    weak var view: ReasonsToStopViewProtocol?
    
    init(view: ReasonsToStopViewProtocol) {
        self.view = view
        
    }
    
    func showArrayOfReasons() {
        view?.showReasons(reasons: array.sorted(by: <))
    }
    
    func didTapDoneButton(reasons: [String]) {
        // save reasons and so
    }
}
