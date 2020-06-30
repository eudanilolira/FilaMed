//
//  AppointmentsView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//
import UIKit

class AppointmentsView: UIView, CodeView {
    let appointmentsTable: AppointmentsTable = AppointmentsTable()

    func buildViewHierarchy() {
        self.addSubview(self.appointmentsTable)
    }

    func setupContraints() {
        self.appointmentsTable.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.appointmentsTable.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.appointmentsTable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.appointmentsTable.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.appointmentsTable.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }

    func setupAdditionalConfiguration() {
    }

    public init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
