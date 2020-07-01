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
        self.stackView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
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
