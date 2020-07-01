//
//  TodayAppointmentsContent.swift
//  FilaMed
//
//  Created by Danilo Araújo on 30/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class TodayAppointmentContent: AppointmentContent {
    let statusLabel: UILabel = UILabel()

    override func buildViewHierarchy() {
        super.buildViewHierarchy()
        self.addSubview(self.statusLabel)
    }

    override func setupContraints() {
        super.setupContraints()

        self.heightAnchor.constraint(equalToConstant: 88).isActive = true
        self.statusLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: self.division.topAnchor, constant: 8),
            statusLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            time.centerYAnchor.constraint(equalTo: clinicName.centerYAnchor),
            time.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([
            clockSymbol.centerYAnchor.constraint(equalTo: time.centerYAnchor),
            clockSymbol.trailingAnchor.constraint(equalTo: self.time.leadingAnchor, constant: -2)
        ])
    }

    override func setupAdditionalConfiguration() {
        super.setupAdditionalConfiguration()

        self.time.font = UIFont.systemFont(ofSize: 12, weight: .bold)

        let clockSymbolConfiguration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 12, weight: .bold))
        self.clockSymbol.image = UIImage(systemName: "clock", withConfiguration: clockSymbolConfiguration)
        self.clockSymbol.tintColor = .black

        self.statusLabel.textColor = GlobalStyle.WarningColor
        self.statusLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)

    }
}
