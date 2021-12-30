//
//  CartVC.swift
//  MobtuneTEST
//
//  Created by DoHyoung Kim on 2021/12/20.
//

import Foundation
import UIKit
import Mobtune

class CartViewController: UIViewController {
    
    private var contentSArea: UIScrollView!
    private var confirmBtn: UIButton!
    private var addBtn: UIButton!
    private var cartIDInputField: CustomInputField!
    private var productViews: [ProductSubView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        cartIDInputField = CustomInputField(frame: CGRect(x: 15,
                                                          y: 80,
                                                          width: view.frame.size.width - 30,
                                                          height: 30))
        cartIDInputField.delegate = self
        cartIDInputField.text = "6yh598iturbghfjdrj0"
        view.addSubview(cartIDInputField)
        
        contentSArea = UIScrollView(frame: CGRect(x: 0,
                                                  y: cartIDInputField.getPosition(space: 10).y,
                                                  width: view.frame.width,
                                                  height: view.frame.height - 50 - cartIDInputField.getPosition(space: 10).y))
        contentSArea.backgroundColor = .clear
        view.addSubview(contentSArea)
        
        confirmBtn = UIButton(type: .custom)
        confirmBtn.backgroundColor = .clear
        confirmBtn.setTitle("완료", for: .normal)
        confirmBtn.setTitleColor(UIColor.black, for: .normal)
        confirmBtn.frame = CGRect(x: 15,
                                  y: contentSArea.getPosition(space: 10).y,
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
    
    @objc func confirmAction() {
        let data = CartData()
        data.cartID = cartIDInputField.text!
        var productList: [ProductItem] = []
        for view in productViews {
            productList.append(view.product)
        }
        data.products = productList
        
        Mobtune.addEvent(eventType: .SHOPPINGCART, param: data)
        
        navigationController?.popViewController(animated: true)
    }
}

extension CartViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
