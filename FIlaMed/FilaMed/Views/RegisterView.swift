//
//  RegisterView.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

class RegisterView: UIView, CodeView {
    let logoImageView = UIImageView()
    let appNameLabel = UILabel()
    let nameTextField = UITextField()
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
        self.addSubview(nameTextField)
        self.addSubview(emailTextField)
        self.addSubview(passwordTextField)
        self.addSubview(registerButton)
        self.addSubview(appNameLabel)
        self.addSubview(logoImageView)
    }

    func setupContraints() {
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameTextField.translatesAutoresizingMaskIntoConstraints = false
        self.emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.registerButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 124),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 100),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            self.appNameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 0),
            self.appNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            self.nameTextField.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.nameTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            self.nameTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.nameTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.nameTextField.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            self.emailTextField.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            self.emailTextField.topAnchor.constraint(equalTo: self.nameTextField.bottomAnchor, constant: 16),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 48
            )
        ])

        NSLayoutConstraint.activate([
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 16),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 48
            )
        ])

        NSLayoutConstraint.activate([
            self.registerButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            self.registerButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 42),
            self.registerButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    func setupAdditionalConfiguration() {
        let logoImage = UIImage(named: "logo.png")
        self.logoImageView.image = logoImage

        self.appNameLabel.text = "FilaMed"
        self.appNameLabel.textColor = .white
        self.appNameLabel.font = UIFont.systemFont(ofSize: 36, weight: .medium)

        let bgImage = UIImage(named: "loginBackground.png")
        self.backgroundColor = UIColor.init(patternImage: bgImage!)

        self.nameTextField.backgroundColor = .white
        self.nameTextField.layer.cornerRadius = 8
        self.nameTextField.placeholder = "Nome Completo"

        self.emailTextField.backgroundColor = .white
        self.emailTextField.layer.cornerRadius = 8
        self.emailTextField.placeholder = "Email"

        self.passwordTextField.backgroundColor = .white
        self.passwordTextField.placeholder = "Senha"
        self.passwordTextField.isSecureTextEntry = true
        self.passwordTextField.layer.cornerRadius = 8

        let color = #colorLiteral(red: 0.1921568627, green: 0.4588235294, blue: 0.4039215686, alpha: 1)
        self.registerButton.backgroundColor = .white
        self.registerButton.layer.cornerRadius = 8
        self.registerButton.setTitle("REGISTRAR", for: .normal)
        self.registerButton.setTitleColor(color, for: .normal)
        self.registerButton.layer.borderWidth = 1.25
        self.registerButton.layer.borderColor = color.cgColor
        self.registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    }
}
