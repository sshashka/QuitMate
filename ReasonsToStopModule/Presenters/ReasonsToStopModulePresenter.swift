//
//  ReasonsToStopModulePresenter.swift
//  QuitMate
//
//  Created by Саша Василенко on 15.03.2023.
//

import Foundation

class ReasonsToStopModulePresenter {
    weak var view: ReasonsToStopViewProtocol?
    
    init(view: ReasonsToStopViewProtocol) {
        self.view = view
    }
    
    func showReasons() {
        let reasonsArray = [""]
        self.view?.showReasons(reasons: reasonsArray)
    }
}
