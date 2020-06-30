import UIKit

class LoginView: UIView, CodeView {
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()

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
        self.addSubview(loginButton)
    }

    func setupContraints() {
        self.emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false

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
            self.loginButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 20)
        ])
    }

    func setupAdditionalConfiguration() {
        self.emailTextField.backgroundColor = .systemRed

        self.passwordTextField.backgroundColor = .systemBlue
        self.passwordTextField.isSecureTextEntry = true

        self.loginButton.backgroundColor = .systemGray

        self.loginButton.setTitle("Entrar", for: .normal)
    }
}
