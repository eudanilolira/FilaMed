//
//  OutputButton.swift
//  FilaMed
//
//  Created by Wilton Ramos on 29/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class OutputButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        self.setupStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.setTitle("Sair da fila", for: .normal)
        self.setTitleColor(.systemRed, for: .normal)
        self.titleEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        self.contentHorizontalAlignment = .left
    }
}
