//
//  IndividualAppointmentTimePrediction.swift
//  FilaMed
//
//  Created by Pedro Moura on 01/07/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class IndividualAppointmentTimePrediction: UIView, CodeView {
    let timeScheduledLabel = UILabel()
    let timeScheduled = UILabel()
    let division = UIView()
    let timePredictionLabel = UILabel()
    let timePrediction = UILabel()
    let minutesLabel = UILabel()

    public init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(self.timeScheduledLabel)
        self.addSubview(self.timeScheduled)
        self.addSubview(self.division)
        self.addSubview(self.timePredictionLabel)
        self.addSubview(self.timePrediction)
        self.addSubview(self.minutesLabel)
    }

    func setupContraints() {
        self.timeScheduledLabel.translatesAutoresizingMaskIntoConstraints = false
        self.timeScheduled.translatesAutoresizingMaskIntoConstraints = false
        self.division.translatesAutoresizingMaskIntoConstraints = false
        self.timePredictionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.timePrediction.translatesAutoresizingMaskIntoConstraints = false
        self.minutesLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.timeScheduledLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.timeScheduledLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),

            self.timeScheduled.topAnchor.constraint(equalTo: self.timeScheduledLabel.bottomAnchor, constant: 10),
            self.timeScheduled.leadingAnchor.constraint(equalTo: self.timeScheduledLabel.leadingAnchor, constant: 5),

            self.division.heightAnchor.constraint(equalToConstant: 0.25),
            self.division.topAnchor.constraint(equalTo: self.timeScheduled.bottomAnchor, constant: 15),
            self.division.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.division.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            self.timePredictionLabel.topAnchor.constraint(equalTo: self.division.bottomAnchor, constant: 15),
            self.timePredictionLabel.leadingAnchor.constraint(equalTo: self.timeScheduledLabel.leadingAnchor),

            self.timePrediction.topAnchor.constraint(equalTo: self.timePredictionLabel.bottomAnchor, constant: 10),
            self.timePrediction.leadingAnchor.constraint(equalTo: self.timeScheduledLabel.leadingAnchor, constant: 5),

            self.minutesLabel.leadingAnchor.constraint(equalTo: self.timePrediction.leadingAnchor, constant: 24),
            self.minutesLabel.topAnchor.constraint(equalTo: self.timePrediction.topAnchor, constant: 5)
        ])
    }

    func setupAdditionalConfiguration() {
        self.timeScheduledLabel.text = "Horário Agendado"
        self.timeScheduled.text = "10:00"
        self.timePredictionLabel.text = "Tempo previsto para saida"
        self.timePrediction.text = "15"
        self.minutesLabel.text = "minutos"

        self.timeScheduledLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        self.timeScheduled.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        self.timePredictionLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        self.timePrediction.font = UIFont.systemFont(ofSize: 20, weight: .medium)

        self.division.backgroundColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1)

        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
    }

}
