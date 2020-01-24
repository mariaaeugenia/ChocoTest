//
//  ViewController.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 19/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        signInButton.applyGradientLayer(with: 10)
        handleButtonStatus()
    
    }
    
    func handleButtonStatus() {
        signInButton.isUserInteractionEnabled = viewModel.buttonEnabled()
        signInButton.alpha = viewModel.buttonEnabled() ? 1.0 : 0.4
    }
    
    @IBAction func signInButtonAction(_ sender: Any) {
        view.endEditing(true)
        viewModel.performLogin()
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            viewModel.email = emailTextField.text ?? ""
        case passwordTextField:
            viewModel.password = passwordTextField.text ?? ""
        default:
            break
        }
        handleButtonStatus()
    }
}

extension LoginViewController: LoginDisplayLogic {
    func setLoading(isLoading: Bool) {
        if isLoading {
            LoadingView.shared.showLoading()
        } else {
            LoadingView.shared.hideLoading()
        }
    }
    
    func presentError(message: String) {
        self.presentAlert(title: "Error", message: message, completion:{_ in })
    }
    
    func goToHome() {
        performSegue(withIdentifier: "goToHome", sender: nil)
    }
    
}
