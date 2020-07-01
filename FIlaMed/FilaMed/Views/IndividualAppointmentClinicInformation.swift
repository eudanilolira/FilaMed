//
//  IndividualAppointmentClinicInformation.swift
//  FilaMed
//
//  Created by Pedro Moura on 01/07/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class IndividualAppointmentClinicInformation: UIView, CodeView {
    let clinicName = UILabel()
    let specialty = UILabel()
    let address = UILabel()
    let maps = UIImageView()

    public init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(clinicName)
        self.addSubview(specialty)
        self.addSubview(address)
    }

    func setupContraints() {
        self.clinicName.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor).isActive = true
    }

    func setupAdditionalConfiguration() {
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10

        self.clinicName.text = "Clinica Sorriso"
        self.specialty.text = "Dentista"
        self.address.text = "Rua Guarujá, 729"
    }

}
