//
//  IndividualAppointmentStackView.swift
//  FilaMed
//
//  Created by Pedro Moura on 30/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class IndividualAppointmentStackView: UIStackView, CodeView {
    let clinicInformation = IndividualAppointmentClinicInformation()
    let timePrediction = IndividualAppointmentTimePrediction()
    let confirmButton = IndividualAppointmentConfirmButton()
    let cancelButton = IndividualAppointmentCancelButton()

    public init() {
        super.init(frame: .zero)
        self.setupView()

    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addArrangedSubview(clinicInformation)
        self.addArrangedSubview(timePrediction)
        self.addArrangedSubview(confirmButton)
        self.addArrangedSubview(cancelButton)
    }

    func setupContraints() {
        NSLayoutConstraint.activate([
            self.clinicInformation.heightAnchor.constraint(equalToConstant: 270),
            self.clinicInformation.topAnchor.constraint(equalTo: self.topAnchor),
            self.timePrediction.heightAnchor.constraint(equalToConstant: 150),
            self.confirmButton.heightAnchor.constraint(equalToConstant: 50),
            self.cancelButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupAdditionalConfiguration() {
        self.axis = .vertical
        self.distribution = .fill
        self.spacing = 25

        self.setCustomSpacing(15.0, after: confirmButton)
    }
}
