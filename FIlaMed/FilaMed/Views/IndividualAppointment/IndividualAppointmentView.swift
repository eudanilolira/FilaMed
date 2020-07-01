//
//  IndividualAppointmentView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class IndividualAppointmentView: UIView, CodeView {
    var stackView = IndividualAppointmentStackView()

    func buildViewHierarchy() {
        self.addSubview(stackView)
    }

    func setupContraints() {
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 30),
            self.stackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor)
        ])

    }

    func setupAdditionalConfiguration() {
        self.backgroundColor = GlobalStyle.BackgroundColor
    }

    public init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
