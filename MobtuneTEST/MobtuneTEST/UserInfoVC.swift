//
//  UserInfoVC.swift
//  MobtuneTEST
//
//  Created by DoHyoung Kim on 2021/12/20.
//

import Foundation
import UIKit
import Mobtune

class UserInfoViewController: UIViewController {
    
    public var type: UserInfoType!
    private var idInputField: CustomInputField!
    private var nameInputField: CustomInputField!
    private var nickInputField: CustomInputField!
    private var mailBtn: UIButton!
    private var femailBtn: UIButton!
    private var noneBtn: UIButton!
    private var birthInputField: CustomInputField!
    private var phoneInputField: CustomInputField!
    private var emailInputField: CustomInputField!
    private var addressInputField: CustomInputField!
    private var marryYBtn: UIButton!
    private var marryNBtn: UIButton!
    
    private var isRolling: Bool = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardChange(notif:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardChange(notif:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let defaultAttr : [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 13, weight: .regular)
        ]
        
        let selectAttr : [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.red,
            .font: UIFont.systemFont(ofSize: 13, weight: .regular)
        ]
        
        let frameWidth = view.frame.width - 30
        
        idInputField = CustomInputField(frame: CGRect(x: 15,
                                                 y: 100,
                                                 width: frameWidth,
                                                 height: 30))
        idInputField.delegate = self
        idInputField.text = "enliple"
        view.addSubview(idInputField)
        
        nameInputField = CustomInputField(frame: CGRect(x: 15,
                                                        y: idInputField.getPosition(space: 10).y,
                                                        width: frameWidth,
                                                        height: 30))
        nameInputField.delegate = self
        nameInputField.text = "인라이플 테스트"
        view.addSubview(nameInputField)
        
        nickInputField = CustomInputField(frame: CGRect(x: 15,
                                                        y: nameInputField.getPosition(space: 10).y,
                                                        width: frameWidth,
                                                        height: 30))
        nickInputField.delegate = self
        nickInputField.text = "인라이플"
        view.addSubview(nickInputField)
        
        let btnWidth = (view.frame.size.width - 50) / 3
        
        mailBtn = UIButton(type: .custom)
        mailBtn.frame = CGRect(x: 15,
                               y: nickInputField.getPosition(space: 10).y,
                               width: btnWidth,
                               height: 20)
        mailBtn.setAttributedTitle(NSAttributedString(string: "남성",
                                                      attributes: defaultAttr),
                                   for: .normal)
        mailBtn.setAttributedTitle(NSAttributedString(string: "남성",
                                                      attributes: selectAttr),
                                   for: .selected)
        mailBtn.addTarget(self, action: #selector(genderAction(selectBtn:)), for: .touchUpInside)
        mailBtn.layer.cornerRadius = 5
        mailBtn.layer.masksToBounds = true
        mailBtn.layer.borderWidth = 0.5
        mailBtn.layer.borderColor = UIColor.darkGray.cgColor
        mailBtn.isSelected = true
        view.addSubview(mailBtn)
        
        femailBtn = UIButton(type: .custom)
        femailBtn.frame = CGRect(x: mailBtn.getPosition(space: 10).x,
                                 y: mailBtn.frame.origin.y,
                                 width: btnWidth,
                                 height: 20)
        femailBtn.setAttributedTitle(NSAttributedString(string: "여성",
                                                        attributes: defaultAttr),
                                     for: .normal)
        femailBtn.setAttributedTitle(NSAttributedString(string: "여성",
                                                        attributes: selectAttr),
                                     for: .selected)
        femailBtn.addTarget(self, action: #selector(genderAction(selectBtn:)), for: .touchUpInside)
        femailBtn.layer.cornerRadius = 5
        femailBtn.layer.masksToBounds = true
        femailBtn.layer.borderWidth = 0.5
        femailBtn.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(femailBtn)
        
        noneBtn = UIButton(type: .custom)
        noneBtn.frame = CGRect(x: femailBtn.getPosition(space: 10).x,
                               y: mailBtn.frame.origin.y,
                               width: btnWidth,
                               height: 20)
        noneBtn.setAttributedTitle(NSAttributedString(string: "선택 안함",
                                                      attributes: defaultAttr),
                                   for: .normal)
        noneBtn.setAttributedTitle(NSAttributedString(string: "선택 안함",
                                                      attributes: selectAttr),
                                   for: .selected)
        noneBtn.addTarget(self, action: #selector(genderAction(selectBtn:)), for: .touchUpInside)
        noneBtn.layer.cornerRadius = 5
        noneBtn.layer.masksToBounds = true
        noneBtn.layer.borderWidth = 0.5
        noneBtn.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(noneBtn)
        
        birthInputField = CustomInputField(frame: CGRect(x: 15,
                                                         y: mailBtn.getPosition(space: 10).y,
                                                         width: frameWidth,
                                                         height: 30))
        birthInputField.delegate = self
        birthInputField.keyboardType = .numberPad
        birthInputField.text = "19800101"
        view.addSubview(birthInputField)
        
        phoneInputField = CustomInputField(frame: CGRect(x: 15,
                                                         y: birthInputField.getPosition(space: 10).y,
                                                         width: frameWidth,
                                                         height: 30))
        phoneInputField.delegate = self
        phoneInputField.keyboardType = .numberPad
        phoneInputField.text = "01012345678"
        view.addSubview(phoneInputField)
        
        emailInputField = CustomInputField(frame: CGRect(x: 15,
                                                         y: phoneInputField.getPosition(space: 10).y,
                                                         width: frameWidth,
                                                         height: 30))
        emailInputField.delegate = self
        emailInputField.keyboardType = .emailAddress
        emailInputField.text = "enliple@enliple.com"
        view.addSubview(emailInputField)
        
        addressInputField = CustomInputField(frame: CGRect(x: 15,
                                                           y: emailInputField.getPosition(space: 10).y,
                                                           width: frameWidth,
                                                           height: 30))
        addressInputField.delegate = self
        addressInputField.text = "서울 구로구 디지털로 272 한신아이티타워 501호"
        view.addSubview(addressInputField)
        
        marryYBtn = UIButton(type: .custom)
        marryYBtn.backgroundColor = .clear
        marryYBtn.isSelected = true
        marryYBtn.frame = CGRect(x: 15,
                                 y: addressInputField.getPosition(space: 10).y,
                                 width: 100,
                                 height: 20)
        marryYBtn.setAttributedTitle(NSAttributedString(string: "기혼",
                                                        attributes: defaultAttr),
                                     for: .normal)
        marryYBtn.setAttributedTitle(NSAttributedString(string: "기혼",
                                                        attributes: selectAttr),
                                     for: .selected)
        marryYBtn.addTarget(self, action: #selector(marryAction(selectBtn:)), for: .touchUpInside)
        marryYBtn.layer.cornerRadius = 5
        marryYBtn.layer.masksToBounds = true
        marryYBtn.layer.borderWidth = 0.5
        marryYBtn.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(marryYBtn)
        
        marryNBtn = UIButton(type: .custom)
        marryNBtn.backgroundColor = .clear
        marryNBtn.frame = CGRect(x: marryYBtn.getPosition(space: 10).x,
                                 y: addressInputField.getPosition(space: 10).y,
                                 width: 100,
                                 height: 20)
        marryNBtn.setAttributedTitle(NSAttributedString(string: "미혼",
                                                        attributes: defaultAttr),
                                     for: .normal)
        marryNBtn.setAttributedTitle(NSAttributedString(string: "미혼",
                                                        attributes: selectAttr),
                                     for: .selected)
        marryNBtn.addTarget(self, action: #selector(marryAction(selectBtn:)), for: .touchUpInside)
        marryNBtn.layer.cornerRadius = 5
        marryNBtn.layer.masksToBounds = true
        marryNBtn.layer.borderWidth = 0.5
        marryNBtn.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(marryNBtn)
        
        let confirmBtn = UIButton(type: .custom)
        confirmBtn.backgroundColor = .clear
        confirmBtn.setTitle("완료", for: .normal)
        confirmBtn.setTitleColor(UIColor.black, for: .normal)
        confirmBtn.frame = CGRect(x: 15,
                                  y: marryNBtn.getPosition(space: 10).y,
                                  width: frameWidth,
                                  height: 30)
        confirmBtn.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
        confirmBtn.layer.cornerRadius = 5
        confirmBtn.layer.masksToBounds = true
        confirmBtn.layer.borderWidth = 0.5
        confirmBtn.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(confirmBtn)
    }
    
    @objc private func marryAction(selectBtn: UIButton) {
        if selectBtn == marryYBtn {
            marryYBtn.isSelected = true
            marryNBtn.isSelected = false
        }else{
            marryYBtn.isSelected = false
            marryNBtn.isSelected = true
        }
    }
    
    @objc private func genderAction(selectBtn: UIButton) {
        if selectBtn == mailBtn {
            mailBtn.isSelected = true
            femailBtn.isSelected = false
            noneBtn.isSelected = false
        }else if selectBtn == femailBtn {
            mailBtn.isSelected = false
            femailBtn.isSelected = true
            noneBtn.isSelected = false
        }else{
            mailBtn.isSelected = false
            femailBtn.isSelected = false
            noneBtn.isSelected = true
        }
    }
    
    @objc private func confirmAction() {
        view.endEditing(true)
        
        var genderStr = "Y"
        var marryStr = "Y"
        
        if mailBtn.isSelected {
            genderStr = "M"
        }else if femailBtn.isSelected {
            genderStr = "W"
        }else{
            genderStr = "N"
        }
        
        if marryYBtn.isSelected {
            marryStr = "Y"
        }else{
            marryStr = "N"
        }
        
        let info = UserInfoData(userID: idInputField.text!,
                                userName: nameInputField.text!,
                                nickName: nickInputField.text!,
                                gender: genderStr,
                                birth: birthInputField.text!,
                                phoneNo: phoneInputField.text!,
                                email: emailInputField.text!,
                                address: addressInputField.text!,
                                marry: marryStr)
        
        if type == .join{
            Mobtune.addEvent(eventType: .SIGNUP, param: info)
        }else if type == .modify {
            Mobtune.addEvent(eventType: .ACCOUNTMODIFIED, param: info)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func keyboardChange(notif: Notification) {
        if let keyFrame: NSValue = notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let rectangle = keyFrame.cgRectValue
            let height = rectangle.height
            
            if idInputField.isEditing || nameInputField.isEditing || nickInputField.isEditing {
                return
            }
            
            if notif.name == UIResponder.keyboardWillShowNotification {
                if view.frame.origin.y == 0 {
                    view.frame.origin.y -= height
                }
            }else{
                view.frame.origin.y = 0
            }
        }
    }
}

extension UserInfoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
