//
//  UserIdInputVC.swift
//  MobtuneTEST
//
//  Created by DoHyoung Kim on 2021/12/20.
//

import Foundation
import UIKit
import Mobtune

enum UserInfoType {
    case login, delete, modify, join
}

class UserIDInputViewController: UIViewController {
    
    public var type: UserInfoType!
    private var inputField: UITextField!
    private var confirmBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        inputField = UITextField(frame: CGRect(x: 15,
                                               y: 200,
                                               width: view.frame.width - 30,
                                               height: 25))
        inputField.backgroundColor = .clear
        inputField.delegate = self
        inputField.text = "enliple"
        inputField.typingAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 15, weight: .regular)
        ]
        inputField.layer.cornerRadius = 5
        inputField.layer.masksToBounds = true
        inputField.layer.borderWidth = 0.5
        inputField.layer.borderColor = UIColor.black.cgColor
        view.addSubview(inputField)
        
        confirmBtn = UIButton(type: .custom)
        confirmBtn.backgroundColor = .clear
        confirmBtn.setTitle("완료", for: .normal)
        confirmBtn.setTitleColor(UIColor.black, for: .normal)
        confirmBtn.frame = CGRect(x: 15,
                                  y: view.frame.size.height - 40,
                                  width: view.frame.width - 30,
                                  height: 30)
        confirmBtn.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
        confirmBtn.layer.cornerRadius = 5
        confirmBtn.layer.masksToBounds = true
        confirmBtn.layer.borderWidth = 0.5
        confirmBtn.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(confirmBtn)
    }
    
    @objc private func confirmAction() {
        
        view.endEditing(true)
        
        guard let inputText = inputField.text else {return}
        
        let data = UserAccountData(userID: inputText)
        
        if type == .login {
            Mobtune.addEvent(eventType: .SIGNIN, param: data)
        }else if type == .delete {
            Mobtune.addEvent(eventType: .ACCOUNTDELETED, param: data)
        }
        
        navigationController?.popViewController(animated: true)
    }
}

extension UserIDInputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        confirmAction()
        
        return true
    }
}
