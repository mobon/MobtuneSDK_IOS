//
//  OrderCancelVC.swift
//  MobtuneTEST
//
//  Created by DoHyoung Kim on 2021/12/20.
//

import Foundation
import UIKit
import Mobtune

class OrderCancelViewController: UIViewController {
    
    private var idInputfield: CustomInputField!
    private var methodBtn: UIButton!
    private var priceInputField: CustomInputField!
    private var contentSArea: UIScrollView!
    private var productViews: [ProductSubView] = []
    private var confirmBtn: UIButton!
    private var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        idInputfield = CustomInputField(frame: CGRect(x: 15,
                                                      y: 80,
                                                      width: view.frame.size.width - 30,
                                                      height: 30))
        idInputfield.delegate = self
        idInputfield.text = "94huirehjf"
        view.addSubview(idInputfield)
        
        methodBtn = UIButton(type: .roundedRect)
        methodBtn.frame = CGRect(x: 15,
                                 y: idInputfield.getPosition(space: 10).y,
                                 width: view.frame.size.width - 30,
                                 height: 30)
        methodBtn.setTitle("CREDITCARD", for: .normal)
        methodBtn.tag = 0
        methodBtn.addTarget(self, action: #selector(methodChangeAction), for: .touchUpInside)
        view.addSubview(methodBtn)
        
        priceInputField = CustomInputField(frame: CGRect(x: 15,
                                                         y: methodBtn.getPosition(space: 10).y,
                                                         width: view.frame.size.width - 30,
                                                         height: 30))
        priceInputField.delegate = self
        priceInputField.keyboardType = .numberPad
        priceInputField.text = "123456789"
        view.addSubview(priceInputField)
        
        confirmBtn = UIButton(type: .custom)
        confirmBtn.backgroundColor = .clear
        confirmBtn.setTitle("완료", for: .normal)
        confirmBtn.setTitleColor(UIColor.black, for: .normal)
        confirmBtn.frame = CGRect(x: 15,
                                  y: view.frame.size.height - 40,
                                  width: view.frame.width - 120,
                                  height: 30)
        confirmBtn.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
        confirmBtn.layer.cornerRadius = 5
        confirmBtn.layer.masksToBounds = true
        confirmBtn.layer.borderWidth = 0.5
        confirmBtn.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(confirmBtn)
        
        addBtn = UIButton(type: .custom)
        addBtn.backgroundColor = .clear
        addBtn.frame = CGRect(x: confirmBtn.getPosition(space: 10).x,
                              y: confirmBtn.frame.origin.y,
                              width: 80,
                              height: confirmBtn.frame.height)
        addBtn.setTitle("추가", for: .normal)
        addBtn.setTitleColor(.black, for: .normal)
        addBtn.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        addBtn.layer.cornerRadius = 5
        addBtn.layer.masksToBounds = true
        addBtn.layer.borderColor = UIColor.darkGray.cgColor
        addBtn.layer.borderWidth = 0.5
        view.addSubview(addBtn)
        
        contentSArea = UIScrollView(frame: CGRect(x: 0,
                                                  y: priceInputField.getPosition(space: 10).y,
                                                  width: view.frame.size.width,
                                                  height: confirmBtn.frame.origin.y - priceInputField.getPosition(space: 10).y - 10))
        contentSArea.backgroundColor = .clear
        view.addSubview(contentSArea)
        
        addAction()
    }
    
    @objc func addAction() {
        
        if let lastView = productViews.last {
            let proView = ProductSubView(frame: CGRect(x: 0,
                                                       y: lastView.getPosition(space: 0).y,
                                                       width: view.frame.size.width,
                                                       height: 10))
            contentSArea.addSubview(proView)
            productViews.append(proView)
        }else {
            let proView = ProductSubView(frame: CGRect(x: 0,
                                                       y: 20,
                                                       width: view.frame.size.width,
                                                       height: 10))
            contentSArea.addSubview(proView)
            productViews.append(proView)
        }
        
        if let lastView = productViews.last {
            contentSArea.contentSize.height = lastView.getPosition(space: 5).y
        }
        
        addBtn.setTitle("\(productViews.count) 추가", for: .normal)
    }
    
    @objc private func confirmAction() {
        let cancelData = OrderCancelData()
        cancelData.orderID = idInputfield.text!
        cancelData.toPrice = priceInputField.text!
        
        if methodBtn.tag == 0 {
            cancelData.method = .CREDICTCARD
        }else if methodBtn.tag == 1 {
            cancelData.method = .BANKTRANSFER
        }else if methodBtn.tag == 2 {
            cancelData.method = .MOBILEPAYMENT
        }else {
            cancelData.method = .ETC
        }
        
        var productList: [ProductItem] = []
        
        for view in productViews {
            productList.append(view.product)
        }
        
        cancelData.products = productList
        Mobtune.addEvent(eventType: .ORDERCANCEL, param: cancelData)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func methodChangeAction() {

        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cardAction = UIAlertAction(title: "CREDICTCARD",
                                   style: .default) { [weak self] action in
            guard let weakSelf = self else {return}
            weakSelf.methodBtn.setTitle("CREDICTCARD",
                                        for: .normal)
            weakSelf.methodBtn.tag = 0
        }
        let bankAction = UIAlertAction(title: "BANKTRANSFER",
                                       style: .default) { [weak self] action in
            guard let weakSelf = self else {return}
            
            weakSelf.methodBtn.setTitle("BANKTRANSFER",
                                        for: .normal)
            weakSelf.methodBtn.tag = 1
        }
        let mobileAction = UIAlertAction(title: "MOBILEPAYMENT",
                                         style: .default) { [weak self] action in
            guard let weakSelf = self else {return}
            
            weakSelf.methodBtn.setTitle("MOBILEPAYMENT",
                                        for: .normal)
            weakSelf.methodBtn.tag = 2
        }
        let etcAction = UIAlertAction(title: "ETC",
                                      style: .default) { [weak self] action in
            guard let weakSelf = self else {return}
            
            weakSelf.methodBtn.setTitle("ETC",
                                        for: .normal)
            weakSelf.methodBtn.tag = 3
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        sheet.addAction(cardAction)
        sheet.addAction(bankAction)
        sheet.addAction(mobileAction)
        sheet.addAction(etcAction)
        sheet.addAction(cancelAction)
        
        present(sheet, animated: true, completion: nil)
    }
}

extension OrderCancelViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
