//
//  AppointmentsContent.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import Foundation
import UIKit

class AppointmentContent: UIView, CodeView {

    let clinicName: UILabel = UILabel()
    let specialty: UILabel = UILabel()
    let time: UILabel = UILabel()
    let division: UIView = UIView()
    let accessAppointment: UIButton = UIButton()
    let clockSymbol: UIImageView = UIImageView()

    required public init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(self.clinicName)
        self.addSubview(self.specialty)
        self.addSubview(self.time)
        self.addSubview(self.division)
        self.addSubview(self.accessAppointment)
        self.addSubview(self.clockSymbol)
    }

    func setupContraints() {
        self.accessAppointment.translatesAutoresizingMaskIntoConstraints = false
        self.clinicName.translatesAutoresizingMaskIntoConstraints = false
        self.specialty.translatesAutoresizingMaskIntoConstraints = false
        self.time.translatesAutoresizingMaskIntoConstraints = false
        self.division.translatesAutoresizingMaskIntoConstraints = false
        self.clockSymbol.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            clinicName.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            clinicName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5)
        ])

        NSLayoutConstraint.activate([
            specialty.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            specialty.topAnchor.constraint(equalTo: clinicName.topAnchor, constant: 26)
        ])

        NSLayoutConstraint.activate([
            accessAppointment.centerYAnchor.constraint(equalTo: clinicName.centerYAnchor),
            accessAppointment.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            division.heightAnchor.constraint(equalToConstant: 0.25),
            division.topAnchor.constraint(equalTo: specialty.topAnchor, constant: 23),
            division.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            division.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    func setupAdditionalConfiguration() {
        self.layer.cornerRadius = 8
        self.backgroundColor = GlobalStyle.CardBackgroundColor

        self.division.backgroundColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)

        let arrowRight = UIImage(systemName: "chevron.right")!
        let arrowRightImage = arrowRight.withTintColor(GlobalStyle.TouchElementColor, renderingMode: .alwaysOriginal)

        self.accessAppointment.setBackgroundImage(arrowRightImage, for: .normal)

        self.clinicName.font = UIFont.boldSystemFont(ofSize: 17)
        self.specialty.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
    }
}
