//
//  GradientLayerExtensions.swift
//  QuitMate
//
//  Created by Саша Василенко on 13.02.2023.
//

import UIKit

extension UIView {
    func makeGlassEffectOnView() {
        let blurEffect = UIBlurEffect(style: .extraLight)
        
        let visualEffect = UIVisualEffectView(effect: blurEffect)
        visualEffect.frame = self.bounds
//        visualEffect.translatesAutoresizingMaskIntoConstraints = false
        visualEffect.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        visualEffect.isUserInteractionEnabled = false
        self.insertSubview(visualEffect, at: 0)
        self.backgroundColor = .clear
    }
}
