//
//  ViewedProductVC.swift
//  MobtuneTEST
//
//  Created by enlipleIOS1 on 2022/08/04.
//

import Foundation
import UIKit
import Mobtune


class ViewedProductViewController: UIViewController {
    
    private var contentSArea: UIScrollView!
    private var confirmBtn: UIButton!
    
    private var idInputField: CustomInputField!
    private var nameInputField: CustomInputField!
    private var priceInputField: CustomInputField!
    private var dcPriceInputField: CustomInputField!
    private var productUrlInputField: CustomInputField!
    private var imageUrlInputField: CustomInputField!
    private var soldOutInputField: CustomInputField!
    private var referrerInputField: CustomInputField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        contentSArea = UIScrollView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: view.frame.width,
                                                  height: view.frame.height - 50))
        contentSArea.backgroundColor = .clear
        view.addSubview(contentSArea)
        
        confirmBtn = UIButton(type: .custom)
        confirmBtn.backgroundColor = .clear
        confirmBtn.setTitle("완료", for: .normal)
        confirmBtn.setTitleColor(UIColor.black, for: .normal)
        confirmBtn.frame = CGRect(x: 15,
                                  y: contentSArea.getPosition(space: 10).y,
                                  width: view.frame.width - 30,
                                  height: 30)
        confirmBtn.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
        confirmBtn.layer.cornerRadius = 5
        confirmBtn.layer.masksToBounds = true
        confirmBtn.layer.borderWidth = 0.5
        confirmBtn.layer.borderColor = UIColor.darkGray.cgColor
        view.addSubview(confirmBtn)
        
        addProductViews()
    }
    
    @objc func addProductViews() {
        
        idInputField = CustomInputField(frame: CGRect(x: 15,
                                                      y: 15,
                                                      width: self.view.frame.width - 30,
                                                      height: 30))
        idInputField.delegate = self
        idInputField.text = "565yhtbgfdd5g"
        contentSArea.addSubview(idInputField)
        
        nameInputField = CustomInputField(frame: CGRect(x: 15,
                                                        y: idInputField.getPosition(space: 10).y,
                                                        width: self.view.frame.width - 30,
                                                        height: 30))
        nameInputField.delegate = self
        nameInputField.text = "원피스"
        contentSArea.addSubview(nameInputField)
        
        
        priceInputField = CustomInputField(frame: CGRect(x: 15,
                                                         y: nameInputField.getPosition(space: 10).y,
                                                         width: self.view.frame.width - 30,
                                                         height: 30))
        priceInputField.keyboardType = .numberPad
        priceInputField.text = "29300"
        contentSArea.addSubview(priceInputField)
        
        
        dcPriceInputField = CustomInputField(frame: CGRect(x: 15,
                                                         y: priceInputField.getPosition(space: 10).y,
                                                         width: self.view.frame.width - 30,
                                                         height: 30))
        dcPriceInputField.keyboardType = .numberPad
        dcPriceInputField.text = "19300"
        contentSArea.addSubview(dcPriceInputField)
        
        
        productUrlInputField = CustomInputField(frame: CGRect(x: 15,
                                                         y: dcPriceInputField.getPosition(space: 10).y,
                                                         width: self.view.frame.width - 30,
                                                         height: 30))
        productUrlInputField.text = "https://www.testshop.co.kr/pid=1234"
        contentSArea.addSubview(productUrlInputField)
        
        
        imageUrlInputField = CustomInputField(frame: CGRect(x: 15,
                                                         y: productUrlInputField.getPosition(space: 10).y,
                                                         width: self.view.frame.width - 30,
                                                         height: 30))
        imageUrlInputField.text = "https://www.textshop.co.kr/img/12341234.png"
        contentSArea.addSubview(imageUrlInputField)
        
        
        soldOutInputField = CustomInputField(frame: CGRect(x: 15,
                                                         y: imageUrlInputField.getPosition(space: 10).y,
                                                         width: self.view.frame.width - 30,
                                                         height: 30))
        soldOutInputField.text = "N"
        contentSArea.addSubview(soldOutInputField)
        
        
        referrerInputField = CustomInputField(frame: CGRect(x: 15,
                                                         y: soldOutInputField.getPosition(space: 10).y,
                                                         width: self.view.frame.width - 30,
                                                         height: 30))
        referrerInputField.text = "utm_source=s1&utm_campaign=c1"
        contentSArea.addSubview(referrerInputField)
        
        contentSArea.contentSize.height = referrerInputField.getPosition(space: 5).y
    }
    
    @objc func confirmAction() {
        
        let product = ProductViewItem()
        product.productCode = idInputField.text ?? ""
        product.productName = nameInputField.text ?? ""
        product.price = priceInputField.text ?? ""
        product.dcPrice = dcPriceInputField.text ?? ""
        product.productUrl = productUrlInputField.text ?? ""
        product.imageUrl = imageUrlInputField.text ?? ""
        product.soldOut = soldOutInputField.text ?? ""
        product.referrer = referrerInputField.text ?? ""
        
        Mobtune.addEvent(eventType: .PRODUCTVIEWED, param: product)
        
        navigationController?.popViewController(animated: true)
    }
}

extension ViewedProductViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
}
