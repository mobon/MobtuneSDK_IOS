//
//  CartSubView.swift
//  MobtuneTEST
//
//  Created by DoHyoung Kim on 2021/12/20.
//

import Foundation
import UIKit
import Mobtune

class ProductSubView: UIView {
    
    public var product: ProductItem {
        let item = ProductItem()
        item.productId = idInputField.text!
        item.productName = nameInputField.text!
        item.quantity = countInputField.text!
        item.productOption = optionInputField.text!
        item.price = priceInputField.text!
        
        return item
    }
    
    private var idInputField: CustomInputField!
    private var nameInputField: CustomInputField!
    private var countInputField: CustomInputField!
    private var optionInputField: CustomInputField!
    private var priceInputField: CustomInputField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        idInputField = CustomInputField(frame: CGRect(x: 15,
                                                      y: 15,
                                                      width: frame.width - 30,
                                                      height: 30))
        idInputField.delegate = self
        idInputField.text = "565yhtbgfdd5g"
        addSubview(idInputField)
        
        nameInputField = CustomInputField(frame: CGRect(x: 15,
                                                        y: idInputField.getPosition(space: 10).y,
                                                        width: frame.width - 30,
                                                        height: 30))
        nameInputField.delegate = self
        nameInputField.text = "원피스"
        addSubview(nameInputField)
        
        countInputField = CustomInputField(frame: CGRect(x: 15,
                                                         y: nameInputField.getPosition(space: 10).y,
                                                         width: frame.width - 30,
                                                         height: 30))
        countInputField.delegate = self
        countInputField.keyboardType = .numberPad
        countInputField.text = "2"
        addSubview(countInputField)
        
        optionInputField = CustomInputField(frame: CGRect(x: 15,
                                                          y: countInputField.getPosition(space: 10).y,
                                                          width: frame.width - 30,
                                                          height: 30))
        optionInputField.delegate = self
        optionInputField.text = "30% 할인"
        addSubview(optionInputField)
        
        priceInputField = CustomInputField(frame: CGRect(x: 15,
                                                         y: optionInputField.getPosition(space: 10).y,
                                                         width: frame.width - 30,
                                                         height: 30))
        priceInputField.keyboardType = .numberPad
        priceInputField.text = "19300"
        addSubview(priceInputField)
        
        let line = UIView(frame: CGRect(x: 0,
                                        y: priceInputField.getPosition(space: 10).y,
                                        width: frame.width,
                                        height: 1))
        line.backgroundColor = .darkGray
        addSubview(line)
        
        self.frame.size.height = line.getPosition(space: 5).y
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductSubView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
