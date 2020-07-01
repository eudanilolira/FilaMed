//
//  IndividualAppointmentConfirmButton.swift
//  FilaMed
//
//  Created by Pedro Moura on 01/07/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class IndividualAppointmentConfirmButton: UIView, CodeView {
    let confirmButton = UILabel()

    public init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(self.confirmButton)

    }

    func setupContraints() {
        self.confirmButton.translatesAutoresizingMaskIntoConstraints = false

        self.confirmButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 10).isActive = true
        self.confirmButton.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor).isActive = true

    }

    func setupAdditionalConfiguration() {
        self.confirmButton.text = "Entrar na fila"
        self.confirmButton.textColor = #colorLiteral(red: 0.3431656361, green: 0.7703325748, blue: 0.6791225672, alpha: 1)
        self.confirmButton.font = UIFont.systemFont(ofSize: 18, weight: .regular)

        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10

        let tapped = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tapped)
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        print("Entrando..")
    }

}
