//
//  CodeView.swift
//  FilaMed
//
//  Created by Wilton Ramos on 30/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

protocol CodeView {
    func buildViewHierarchy()
    func setupContraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupContraints()
        setupAdditionalConfiguration()
    }
}
