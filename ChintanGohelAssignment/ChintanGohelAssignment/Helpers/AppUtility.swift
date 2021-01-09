//
//  AppUtility.swift
//  ChintanGohelAssignment
//
//  Created by Chintan Gohel on 09/01/21.
//

import Foundation
import UIKit

var animateScaleY:CGFloat = 0.8
var animateScaleX:CGFloat = 0.8

var utility = GeneralAppUtility()

class GeneralAppUtility  {
    
    func createActivityIndicator() -> UIActivityIndicatorView {
        var activityIndicator = UIActivityIndicatorView()
        if #available(iOS 13.0, *) {
            activityIndicator = UIActivityIndicatorView(style: .large)
        } else {
            activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        }
        return activityIndicator
    }
    
    func applyThemeShadowScreenTitle(titleLabel: UILabel, color: UIColor, shadoRadius: CGFloat, oppacity:Float) {
        titleLabel.layer.shadowColor = color.cgColor
        titleLabel.layer.shadowRadius = shadoRadius
        titleLabel.layer.shadowOpacity = oppacity
        titleLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        titleLabel.layer.masksToBounds = false
    }
    
    func applyAnimationToButton(button:UIButton, duration: Double, delay: Double) {
        UIView.animate(withDuration: duration, delay: delay, options: [], animations: {
            button.transform = CGAffineTransform(scaleX: animateScaleY, y: animateScaleX)
        }) { (finished) in
            UIView.animate(withDuration: duration) {
                button.transform = CGAffineTransform.identity
            }
        }
    }
    
    func applyPulsateAnimation(button: UIButton) {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = .infinity
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        button.layer.add(pulse, forKey: nil)
    }

    
    func applyCornerRadius(control: UIView, radius: CGFloat)  {
        control.layer.cornerRadius = radius
        control.clipsToBounds = true
    }
    
    func convertHexToColor(hex: String) -> UIColor {
        if hex.hasPrefix("#") {
            var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
            if cString.hasPrefix("#") {
                cString.remove(at: cString.startIndex)
            }
            var rgbValue:UInt64 = 0
            Scanner(string: cString).scanHexInt64(&rgbValue)
            return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0xFF0000) >> 8) / 255.0, blue: CGFloat((rgbValue & 0xFF0000)) / 255.0, alpha: CGFloat(1.0))
        }
        return UIColor()
    }
}
