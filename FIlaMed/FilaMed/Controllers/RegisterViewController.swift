//
//  RegisterViewController.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    let registerView = RegisterView()
    var handle: AuthStateDidChangeListenerHandle?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.registerView
        setupAdditionalConfiguration()
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

    func showAppointments() {
        let tabBarNavigationController = TabBarController()
        tabBarNavigationController.modalPresentationStyle = .fullScreen
        self.present(tabBarNavigationController, animated: true)
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
        self.registerView.registerButton.addTarget(self, action: #selector(validateCredentials), for: .touchUpInside)
    }

    @objc
    func validateCredentials() {
        guard let name = registerView.nameTextField.text else { return }
        guard let email = registerView.emailTextField.text else { return }
        guard let password = registerView.passwordTextField.text else { return }

        self.createUser(name: name, email: email, password: password)
    }

    func createUser(name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            guard let _ = authResult?.user, error == nil else {
                if let receivedError = error {
                    self.showAlert(message: receivedError.localizedDescription, title: "Ocorreu um erro")
                }
                return
            }

            if let user = authResult?.user {
                let optionalUser: User? = UserManager.shared.create(
                    name: name,
                    email: user.email!
                )

                if let createdUser = optionalUser {
                    SeedDataBase.shared.createAppointments(user: createdUser)

                    Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, _ in
                        guard let strongSelf = self else { return }
                        guard let user = Auth.auth().currentUser else { return }

                        SessionManager.shared.login(user)
                        strongSelf.showAppointments()
                    }
                }
            }
        }
    }
}
