//
//  MoodClassifierViewController+Module.swift
//  QuitMate
//
//  Created by Саша Василенко on 21.04.2023.
//

extension MoodClassifierViewController {
    static var module: MoodClassifierViewController {
        let service = UserMoodClassifierService()
        let view = MoodClassifierViewController()
        let presenter = MoodClassifierModulePresenter(view: view, classifierService: service)
        view.presenter = presenter
        return view
    }
}
