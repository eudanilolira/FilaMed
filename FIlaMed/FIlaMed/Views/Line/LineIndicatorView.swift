//
//  LineIndicatorView.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineIndicatorView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
    }
    
    func setupConstraints(_ upperView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superview!.centerXAnchor).isActive = true
        self.topAnchor.constraint(equalTo: upperView.bottomAnchor, constant: 32).isActive = true
        self.widthAnchor.constraint(equalToConstant: 345).isActive = true
        self.heightAnchor.constraint(equalToConstant: 230).isActive = true
    }
}
