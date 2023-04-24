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
//    //
//    /// Changes backgrond gradient corresponding to appearance
//    /// - Parameters:
//    ///   - gradientLayer: CAGradientLayer to be used
//    func setAppearanceColors(gradientLayer: CAGradientLayer) {
//        let darkColors = [UIColor(named: "TopColorDark"), UIColor(named: "BottomColorDark")]
//        let lightColors = [UIColor(named: "TopColorLight"), UIColor(named: "BottomColorLight")]
//        if self.traitCollection.userInterfaceStyle == .light {
//            gradientLayer.colors = lightColors.compactMap {
//                $0?.cgColor
//            }
//        } else {
//            gradientLayer.colors = darkColors.compactMap {
//                $0?.cgColor
//            }
//        }
//
//    }
//    //
//    /// Sets a backgrond gradient
//    /// - Parameters:
//    ///   - gradientLayer: CAGradientLayer to be inserted
//    func setBackground(gradientLayer: CAGradientLayer) {
//        setAppearanceColors(gradientLayer: gradientLayer)
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.frame = self.bounds
//        self.layer.insertSublayer(gradientLayer, at: 0)
//    }
    
    func setBackgroundColor() {
        self.backgroundColor = UIColor(named: Constants.backgroundColor)
    }
    
    
    func makeViewRounded() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.frame.height/2
    }
}
