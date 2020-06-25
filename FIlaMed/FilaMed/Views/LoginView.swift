//
//  LoginView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
    public init() {
        super.init(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        
        let label = UILabel()
        label.text = "Teste"
        label.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        
        self.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
