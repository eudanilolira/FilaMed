import UIKit

class LoginView: UIView, CodeView {
    let logoImageView = UIImageView()
    let appNameLabel = UILabel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let forgotPasswordButton = UIButton()
    let loginButton = UIButton()
    let goToRegisterButton = UIButton()

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
        self.addSubview(logoImageView)
        self.addSubview(appNameLabel)
        self.addSubview(forgotPasswordButton)
        self.addSubview(goToRegisterButton)
    }

    func setupContraints() {
        self.logoImageView.translatesAutoresizingMaskIntoConstraints = false
        self.appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        self.forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        self.goToRegisterButton.translatesAutoresizingMaskIntoConstraints = false

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
            self.emailTextField.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            self.emailTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.emailTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 16),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 48
            )
        ])

        NSLayoutConstraint.activate([
            self.forgotPasswordButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.forgotPasswordButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 4)
        ])

        NSLayoutConstraint.activate([
            self.loginButton.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor),
            self.loginButton.topAnchor.constraint(equalTo: self.forgotPasswordButton.bottomAnchor, constant: 36),
            self.loginButton.heightAnchor.constraint(equalToConstant: 48)
        ])

        NSLayoutConstraint.activate([
            self.goToRegisterButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.goToRegisterButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 4)
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

        self.emailTextField.backgroundColor = .white
        self.emailTextField.layer.cornerRadius = 8
        self.emailTextField.placeholder = "Email"

        self.passwordTextField.backgroundColor = .white
        self.passwordTextField.placeholder = "Senha"
        self.passwordTextField.isSecureTextEntry = true
        self.passwordTextField.layer.cornerRadius = 8

        self.forgotPasswordButton.setTitle("Esqueci minha senha", for: .normal)
        self.forgotPasswordButton.setTitleColor(.white, for: .normal)
        self.forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)

        let color = #colorLiteral(red: 0.1921568627, green: 0.4588235294, blue: 0.4039215686, alpha: 1)
        self.loginButton.backgroundColor = .white
        self.loginButton.layer.cornerRadius = 8
        self.loginButton.setTitle("ENTRAR", for: .normal)
        self.loginButton.setTitleColor(color, for: .normal)
        self.loginButton.layer.borderWidth = 1.25
        self.loginButton.layer.borderColor = color.cgColor
        self.loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        

        self.goToRegisterButton.setTitle("Não tenho uma conta. Fazer cadastro", for: .normal)
        self.goToRegisterButton.setTitleColor(.white, for: .normal)
        self.goToRegisterButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .regular)
    }
}
