//
//  UIViewExtension.swift
//  GoalTracker
//
//  Created by Mamoudou Barry on 6/9/24.
//

import UIKit

extension UIView {
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange( _ notification: NSNotification) {
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltay = endingFrame.origin.y - startingFrame.origin.y
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: KeyframeAnimationOptions(rawValue: curve)) {
            self.frame.origin.y += deltay
        }

    }
}
