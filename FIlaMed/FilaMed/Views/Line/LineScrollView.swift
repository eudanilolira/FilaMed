//
//  LineScrollView.swift
//  FilaMed
//
//  Created by Wilton Ramos on 29/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class LineScrollView: UIScrollView, CodeView {

    var contentView: LineStackView = LineStackView()

    public init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(contentView)
    }

    func setupContraints() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.contentView.leadingAnchor.constraint(equalTo:  self.layoutMarginsGuide.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            self.contentView.topAnchor.constraint(equalTo:      self.layoutMarginsGuide.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo:   self.bottomAnchor)
        ])
    }

    func setupAdditionalConfiguration() {
        //TODO
    }

}
