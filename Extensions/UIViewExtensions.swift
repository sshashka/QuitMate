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
    
    func addNeonBordersToView(color: UIColor, radius: Double = 10) {
        let glowLayer = CALayer()
        glowLayer.frame = bounds
        glowLayer.cornerRadius = layer.cornerRadius
        glowLayer.backgroundColor = color.cgColor
        glowLayer.opacity = 0.8
        
        // Add the glow layer to the view's layer
        layer.insertSublayer(glowLayer, at: 0)
        
        // Create the animation for the glow layer
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 0.8
        animation.toValue = 0.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        animation.duration = 1.0
        
        // Add the animation to the glow layer
        glowLayer.add(animation, forKey: "neonGlowAnimation")
    }
}
