//
//  Extensions.swift
//  FilaMed
//
//  Created by Wilton Ramos on 01/07/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

 extension UIButton {

     func pulsate() {

         let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.05
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0

         layer.add(pulse, forKey: "pulse")
    }
}
