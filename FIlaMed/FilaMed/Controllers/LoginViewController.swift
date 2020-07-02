//
//  RegisterViewController.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    let loginView = LoginView()
    var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.loginView
        setupAdditionalConfiguration()

        let tapped = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        self.view.addGestureRecognizer(tapped)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener { (_, _) in
            if SessionManager.shared.isLogged() {
                self.showAppointments()
            }
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }

    func showAlert(message: String = "Erro inesperado", title: String = "Erro") {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }

    func setupAdditionalConfiguration() {
        self.loginView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        self.loginView.goToRegisterButton.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
    }

    func showAppointments() {
        let tabBarNavigationController = TabBarController()
        tabBarNavigationController.modalPresentationStyle = .fullScreen
        self.present(tabBarNavigationController, animated: true)
    }

    @objc
    func goToRegister() {
        let register = RegisterViewController()
        register.modalPresentationStyle = .fullScreen
        self.present(register, animated: true)
    }

    @objc
    func login() {
        guard let email = self.loginView.emailTextField.text else { return }
        guard let password = self.loginView.passwordTextField.text else { return }

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            guard let strongSelf = self else { return }
            guard let user = Auth.auth().currentUser else {
                strongSelf.showAlert(message: error!.localizedDescription, title: "Erro")
                return
            }

            if SessionManager.shared.login(user) {
                strongSelf.showAppointments()
            } else {
                strongSelf.showAlert(message: "Usuário e/ou senhas incorreto(s)", title: "Erro")
            }

            return
        }

    }
}
