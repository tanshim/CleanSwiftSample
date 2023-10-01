//
//  LoginSceneViewController.swift
//  CleanSwiftSample
//
//  Created by Sultan on 22.07.2023.
//

import UIKit
import SnapKit

protocol LoginSceneViewControllerInput: AnyObject {
    func showLoginSuccess(user: User)
    func showLoginFailure(message: String)
}

protocol LoginSceneViewControllerOutput: AnyObject {
    func tryToLogIn(userLogin: String, password: String)
}

final class LoginSceneViewController: UIViewController {

    var interactor: LoginSceneInteractorInput?
    var router: LoginSceneRouting?

    // MARK: - UI

    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "gradient8")
        return imageView
    }()

    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .systemIndigo
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Login"
        textField.setLeftIcon(UIImage(named: "avatar")!)
        let padding: CGFloat = 10.0
        textField.setRightPadding(padding)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.setLeftIcon(UIImage(named: "password")!)
        let padding: CGFloat = 10.0
        textField.setRightPadding(padding)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 20
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.42, green: 0.45, blue: 0.81, alpha: 1.00)
        button.clipsToBounds = true
        button.layer.cornerRadius = 18
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        return button
    }()


    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }

    // MARK: - Setup

    private func setupViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }

    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(180)
            make.centerX.equalToSuperview()
        }

        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(37)
            make.centerX.equalToSuperview()
            make.width.equalTo(240)
            make.height.equalTo(40)
        }

        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(18)
            make.centerX.equalToSuperview()
            make.width.equalTo(240)
            make.height.equalTo(40)
        }

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(48)
            make.centerX.equalToSuperview()
            make.width.equalTo(240)
            make.height.equalTo(35)
        }
    }

    //MARK: - Action

    @objc func loginButtonAction() {
        guard let login = loginTextField.text,
                let password = passwordTextField.text
        else { return }
        interactor?.tryToLogIn(userLogin: login, password: password)
    }
}

extension LoginSceneViewController: LoginSceneViewControllerInput {
    func showLoginSuccess(user: User) {
        router?.showLoginSuccess(user: user)
    }

    func showLoginFailure(message: String) {
        router?.showLoginFailure(message: message)
    }
}

extension UITextField {
    func setLeftIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 25, y: 6, width: 15, height: 15))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 30, y: 0, width: 55, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }

    func setRightPadding(_ padding: CGFloat) {
        let paddingView = UIView(frame:
                                    CGRect(x: 0, y: 0, width: padding,
                                           height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
