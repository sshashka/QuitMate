//
//  GradientLayerExtensions.swift
//  QuitMate
//
//  Created by Саша Василенко on 13.02.2023.
//

import UIKit

extension UIView {
    func makeGlassEffectOnView(style: UIBlurEffect.Style) {
        let blurEffect = UIBlurEffect(style: style)
        
        let visualEffect = UIVisualEffectView(effect: blurEffect)
        visualEffect.frame = self.bounds
        visualEffect.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        visualEffect.isUserInteractionEnabled = false
        
        self.insertSubview(visualEffect, at: 0)
        self.backgroundColor = .clear
    }
    
    func setBackground() {
        let topColor = UIColor(named: "TopColor")?.cgColor
        let bottomColot = UIColor(named: "BottomColor")?.cgColor
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = [topColor, bottomColot]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func makeViewRounded() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height/2
    }
}
