//
//  FutureAppointmentsContent.swift
//  FilaMed
//
//  Created by Danilo Araújo on 30/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class FutureAppointmentContent: AppointmentContent {
    let dateLabel: UILabel = UILabel()
    let calendarSymbol: UIImageView = UIImageView()

    override func buildViewHierarchy() {
        super.buildViewHierarchy()
        self.addSubview(self.dateLabel)
        self.addSubview(self.calendarSymbol)
    }

    override func setupContraints() {
        super.setupContraints()

        self.heightAnchor.constraint(equalToConstant: 104).isActive = true
        self.dateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.calendarSymbol.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            clockSymbol.topAnchor.constraint(equalTo: self.dateLabel.topAnchor, constant: 20),
            clockSymbol.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            calendarSymbol.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            calendarSymbol.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: self.division.topAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: self.calendarSymbol.trailingAnchor, constant: 2)
        ])

        NSLayoutConstraint.activate([
            time.topAnchor.constraint(equalTo: dateLabel.topAnchor, constant: 20),
            time.leadingAnchor.constraint(equalTo: self.clockSymbol.trailingAnchor, constant: 2)
        ])
    }

    override func setupAdditionalConfiguration() {
        super.setupAdditionalConfiguration()

        self.dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)

        let clockSymbolFont = UIFont.systemFont(ofSize: 12, weight: .regular)
        let clockSymbolConfiguration = UIImage.SymbolConfiguration(font: clockSymbolFont)
        self.clockSymbol.image = UIImage(systemName: "clock", withConfiguration: clockSymbolConfiguration)
        self.clockSymbol.tintColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)

        let calendarSymbolFont = UIFont.systemFont(ofSize: 12, weight: .bold)
        let calendarSymbolConfiguration = UIImage.SymbolConfiguration(font: calendarSymbolFont)
        self.calendarSymbol.image = UIImage(systemName: "calendar", withConfiguration: calendarSymbolConfiguration)
        self.calendarSymbol.tintColor = .black

        self.time.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        self.time.textColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)
    }
}
