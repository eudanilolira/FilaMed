//
//  IndividualAppointmentCancelButton.swift
//  FilaMed
//
//  Created by Pedro Moura on 01/07/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class IndividualAppointmentCancelButton: UIView, CodeView {
    let cancelLabel = UILabel()

    public init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(self.cancelLabel)

    }

    func setupContraints() {
        self.cancelLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
    }

    func setupAdditionalConfiguration() {
        self.cancelLabel.text = "Cancelar"

        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
    }

}
