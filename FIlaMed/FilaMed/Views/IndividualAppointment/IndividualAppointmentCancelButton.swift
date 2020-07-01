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
        self.cancelLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.cancelLabel.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 10),
            self.cancelLabel.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor)
        ])
    }

    func setupAdditionalConfiguration() {
        self.cancelLabel.text = "Cancelar"
        self.cancelLabel.textColor = #colorLiteral(red: 1, green: 0.3138251901, blue: 0, alpha: 1)
        self.cancelLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)

        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10

        let tapped = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tapped)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("Cancelar")
    }

}
