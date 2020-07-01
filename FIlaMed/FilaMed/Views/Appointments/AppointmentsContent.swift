//
//  AppointmentsContent.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import Foundation
import UIKit

class AppointmentContent: UIView, HaveConstraints {
    let clinicName: UILabel = UILabel()
    let specialty: UILabel = UILabel()
    let time: UILabel = UILabel()
    let division: UIView = UIView()
    let accessAppointment: UIButton = UIButton()
    let clockSymbol: UIImageView = UIImageView()

    public init() {
        super.init(frame: .zero)

        self.layer.cornerRadius = 8
        self.backgroundColor = GlobalStyle.CardBackgroundColor

        self.addSubview(self.clinicName)
        self.addSubview(self.specialty)
        self.addSubview(self.time)
        self.addSubview(self.division)
        self.addSubview(self.accessAppointment)
        self.addSubview(self.clockSymbol)

        self.setupStyles()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.accessAppointment.translatesAutoresizingMaskIntoConstraints = false
        self.clinicName.translatesAutoresizingMaskIntoConstraints = false
        self.specialty.translatesAutoresizingMaskIntoConstraints = false
        self.time.translatesAutoresizingMaskIntoConstraints = false
        self.division.translatesAutoresizingMaskIntoConstraints = false
        self.clockSymbol.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview!.topAnchor, constant: 16),
            self.leadingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview!.layoutMarginsGuide.trailingAnchor)
        ])

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

    func setupStyles() {
        self.division.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)

        let ultraLightFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        let ultraLightConfiguration = UIImage.SymbolConfiguration(font: ultraLightFont)
        let ultraLightSymbolImage = UIImage(systemName: "chevron.right", withConfiguration: ultraLightConfiguration)

        self.accessAppointment.setBackgroundImage(ultraLightSymbolImage, for: .normal)
        self.accessAppointment.setTitleColor(.blue, for: .normal)

        self.clinicName.font = UIFont.boldSystemFont(ofSize: 17)
        self.specialty.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
    }
}

class TodayAppointmentContent: AppointmentContent {
    let statusLabel: UILabel = UILabel()

    override public init() {
        super.init()
        self.addSubview(self.statusLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupConstraints() {
        super.setupConstraints()

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

    override func setupStyles() {
        super.setupStyles()

        self.time.font = UIFont.systemFont(ofSize: 12, weight: .bold)

        let clockSymbolConfiguration = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 12, weight: .bold))
        self.clockSymbol.image = UIImage(systemName: "clock", withConfiguration: clockSymbolConfiguration)
        self.clockSymbol.tintColor = .black

        self.statusLabel.textColor = GlobalStyle.WarningColor
        self.statusLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)

    }
}

class FutureAppointmentContent: AppointmentContent {
    let dateLabel: UILabel = UILabel()
    let calendarSymbol: UIImageView = UIImageView()

    override public init() {
        super.init()
        self.addSubview(self.dateLabel)
        self.addSubview(self.calendarSymbol)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setupConstraints() {
        super.setupConstraints()

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

    override func setupStyles() {
        super.setupStyles()

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
