//
//  DetectingMoodModulePresenter.swift
//  QuitMate
//
//  Created by Саша Василенко on 16.04.2023.
//

import Foundation

final class MoodClassifierModulePresenter: MoodClassifierModulePresenterProtocol {
    func userDidTakePicture(image: Data) {
        validateImage(image: image)
    }
    
    weak var view: MoodClassifierViewControllerProtocol?
    let classifierService: UserMoodClassifierServiceProtocol
    
    init(view: MoodClassifierViewControllerProtocol, classifierService: UserMoodClassifierServiceProtocol) {
        self.view = view
        self.classifierService = classifierService
    }
    
    private func validateImage(image: Data) {
        classifierService.checkIfFacePresent(image: image) {[weak self] result in
            switch result {
            case .succes:
                self?.detectMood(image: image)
            case .failure:
                self?.view?.showValidationFailureAlert(message: "Validation failed. Try again!")
            }
        }
    }
    private func detectMood(image: Data) {
//        classifierService.classifyImage(image: image)
    }
}
