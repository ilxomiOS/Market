//
//  SigninViewController.swift
//  Online Market 4
//
//  Created by Ilxom on 17/08/22.
//

import UIKit

class SigninViewController: UIViewController {
    
    let emailLabel = makeLabel(text: "Email")
    let passwordLabel = makeLabel(text: "Password")
    
    let emailTextField = makeTextField()
    let passwordTextField = makeTextField()
    
    let signinButton = makeButton(title: "Sign in", titleColor: .white, background: .green, cornerRadius: 6)
    
    let user = User.getUserData()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signinButton)
        
        signinButton.addTarget(self, action: #selector(signinButtonPressed), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 220),
            view.trailingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 32),
            
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor, constant: 32),
            
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: 32),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: 32),
            
            signinButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            signinButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35),
            view.trailingAnchor.constraint(equalTo: signinButton.trailingAnchor, constant: 32),
            signinButton.heightAnchor.constraint(equalToConstant: 42)
            
        ])
    }
    
    @objc func signinButtonPressed() {
        guard
            emailTextField.text == user.email,
            passwordTextField.text == user.password
        else {
            showAlert(title: "Error", message: "Invalid Login or Password")
            return
        }
        
        let sneakerViewController = SneakersListViewController()
        let navVC = UINavigationController(rootViewController: sneakerViewController)
        navVC.modalPresentationStyle = .overFullScreen
        present(navVC, animated: true)
        
    }

}

extension SigninViewController {
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}
