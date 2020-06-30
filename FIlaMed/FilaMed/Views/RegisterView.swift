//
//  RegisterView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class RegisterView: UIView, CodeView {
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let registerButton = UIButton()

    public init() {
        super.init(frame: .zero)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(registerButton)
    }

    func setupContraints() {
        self.emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.registerButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.emailTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.emailTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 400)
        ])

        NSLayoutConstraint.activate([
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
            self.registerButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20)
        ])
    }

    func setupAdditionalConfiguration() {
        self.emailTextField.backgroundColor = .systemRed

        self.passwordTextField.backgroundColor = .systemBlue
        self.passwordTextField.isSecureTextEntry = true

        self.registerButton.backgroundColor = .systemGray

        self.registerButton.setTitle("Registrar", for: .normal)
    }
}
