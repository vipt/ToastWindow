//
//  Toastable.swift
//  ToastWindow
//
//  Created by motoki on 2017/08/27.
//  Copyright © 2017年 vipt. All rights reserved.
//

import Foundation
import UIKit

protocol Toastable {
    func showToast(message: String)
    func showToast(message: String, duration: TimeInterval)
}

extension Toastable {
    
    func showToast(message: String) {
        self.showToast(message: message, duration: 1.0)
    }

    func showToast(message: String, duration: TimeInterval) {
        var toastWindowKey = 0
        let window = ToastWindow(frame: UIScreen.main.bounds)
        objc_setAssociatedObject(self, &toastWindowKey, window, .OBJC_ASSOCIATION_RETAIN)
        let toast = makeToast(message: message)
        toast.alpha = 0
        window.addSubview(toast)
        window.makeKeyAndVisible()
        
        UIView.transition(with: window, duration: duration/2, options: [.curveEaseOut], animations: {
            toast.alpha = 1
        }, completion: { finished in
            UIView.transition(with: window, duration: duration/2, options: [.curveEaseIn], animations: {
                toast.alpha = 0
            }, completion: { finished in
                objc_setAssociatedObject(self, &toastWindowKey, nil, .OBJC_ASSOCIATION_RETAIN)
            })
        })
    }
    
    func makeToast(message: String) -> UILabel {
        let toast = UILabel(frame: CGRect(x: 0 , y: 0, width: 300, height: 44))
        toast.textAlignment = .center
        toast.backgroundColor = .black
        toast.textColor = .white
        toast.layer.cornerRadius = 22
        toast.layer.masksToBounds = true
        toast.center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height - toast.bounds.height)
        toast.text = message
        return toast
    }
}
