//
//  SIgnUpPw.swift
//  Instagram Clone Coding
//
//  Created by 김지민 on 2022/04/06.
//

import UIKit

class SignUpPw: UIViewController {
    
    var name: String?
    
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pwSecureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargetTextField()
    }
    
    @IBAction func gotoWelcomeClicked(_ sender: Any) {
        guard let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "Welcome")as?Welcome else {return}
        welcomeVC.modalTransitionStyle = .crossDissolve
        welcomeVC.modalPresentationStyle = .fullScreen
        welcomeVC.name = name
        self.present(welcomeVC,animated: true,completion: nil)
    }
    
    @IBAction func toggleSecurityMode(_ sender: Any) {
        passwordInput.isSecureTextEntry.toggle()
        let imageName = passwordInput.isSecureTextEntry ? "password hidden eye icon" : "password shown eye icon"
        pwSecureButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func addTargetTextField() {
        self.passwordInput.addTarget(self, action: #selector(self.textFieldDidChange(_:)),for:.editingChanged)
    }
    
    @objc func textFieldDidChange(_ sender:Any?) -> Void {
        nextButton.isEnabled = passwordInput.hasText
    }
}
