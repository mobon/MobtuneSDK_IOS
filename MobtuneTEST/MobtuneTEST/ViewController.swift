//
//  ViewController.swift
//  MobtuneTEST
//
//  Created by DoHyoung Kim on 2021/12/20.
//

import UIKit
import Mobtune

class ViewController: UIViewController {

    private var contentSArea: UIScrollView!
    private var orderBtn: UIButton!
    private var loginBtn: UIButton!
    private var joinBtn: UIButton!
    private var joinOutBtn: UIButton!
    private var modifiedBtn: UIButton!
    private var nextBtn: UIButton!
    private var goCartBtn: UIButton!
    private var goOrderCancelBtn: UIButton!
    private var viewedProductBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        contentSArea = UIScrollView(frame: view.bounds)
        contentSArea.backgroundColor = .clear
        view.addSubview(contentSArea)
        
        orderBtn = getDefaultBtn(title: "주문")
        orderBtn.frame = CGRect(x: 15,
                                y: 50,
                                width: view.frame.size.width - 30,
                                height: 30)
        orderBtn.addTarget(self, action: #selector(orderAction), for: .touchUpInside)
        contentSArea.addSubview(orderBtn)
        
        loginBtn = getDefaultBtn(title: "로그인")
        loginBtn.frame = CGRect(x: 15,
                                y: orderBtn.getPosition(space: 10).y,
                                width: view.frame.size.width - 30,
                                height: 30)
        loginBtn.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        contentSArea.addSubview(loginBtn)
        
        joinBtn = getDefaultBtn(title: "회원가입")
        joinBtn.frame = CGRect(x: 15,
                               y: loginBtn.getPosition(space: 10).y,
                               width: view.frame.size.width - 32,
                               height: 30)
        joinBtn.addTarget(self, action: #selector(joinActoin), for: .touchUpInside)
        contentSArea.addSubview(joinBtn)
        
        joinOutBtn = getDefaultBtn(title: "회원 탈퇴")
        joinOutBtn.frame = CGRect(x: 15,
                                  y: joinBtn.getPosition(space: 10).y,
                                  width: view.frame.size.width - 30,
                                  height: 30)
        joinOutBtn.addTarget(self, action: #selector(joinOutAction), for: .touchUpInside)
        contentSArea.addSubview(joinOutBtn)
        
        modifiedBtn = getDefaultBtn(title: "회원 정보 수정")
        modifiedBtn.frame = CGRect(x: 15,
                                   y: joinOutBtn.getPosition(space: 10).y,
                                   width: view.frame.size.width - 30,
                                   height: 30)
        modifiedBtn.addTarget(self, action: #selector(modifyAction), for: .touchUpInside)
        contentSArea.addSubview(modifiedBtn)
        
        goCartBtn = getDefaultBtn(title: "장바구니")
        goCartBtn.frame = CGRect(x: 15,
                                 y: modifiedBtn.getPosition(space: 10).y,
                                 width: view.frame.size.width - 30,
                                 height: 30)
        goCartBtn.addTarget(self, action: #selector(goCartAction), for: .touchUpInside)
        contentSArea.addSubview(goCartBtn)
        
        goOrderCancelBtn = getDefaultBtn(title: "주문 취소")
        goOrderCancelBtn.frame = CGRect(x: 15,
                                        y: goCartBtn.getPosition(space: 10).y,
                                        width: view.frame.size.width - 30,
                                        height: 30)
        goOrderCancelBtn.addTarget(self, action: #selector(goOrderCancelAction), for: .touchUpInside)
        contentSArea.addSubview(goOrderCancelBtn)
        
        
        viewedProductBtn = getDefaultBtn(title: "본 상품")
        viewedProductBtn.frame = CGRect(x: 15,
                                        y: goOrderCancelBtn.getPosition(space: 10).y,
                                        width: view.frame.size.width - 30,
                                        height: 30)
        viewedProductBtn.addTarget(self, action: #selector(viewedProductAction), for: .touchUpInside)
        contentSArea.addSubview(viewedProductBtn)
        
        
        if let lastView = contentSArea.subviews.last {
            contentSArea.contentSize = CGSize(width: view.frame.width, height: lastView.getPosition(space: 20).y)
        }
    }

    private func getDefaultBtn(title: String) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 5
        btn.layer.masksToBounds = true
        btn.layer.borderColor = UIColor.darkGray.cgColor
        btn.layer.borderWidth = 1.0
        btn.setAttributedTitle(NSAttributedString(string: title,
                                                  attributes: [
                                                    .foregroundColor: UIColor.black,
                                                    .font: UIFont.systemFont(ofSize: 22, weight: .medium)
                                                  ]),
                               for: .normal)
        
        return btn
    }
    
    @objc private func loginAction() {
        let nextVC = UserIDInputViewController()
        nextVC.type = .login
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func joinActoin() {
        let nextVC = UserInfoViewController()
        nextVC.type = .join
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func joinOutAction() {
        let nextVC = UserIDInputViewController()
        nextVC.type = .delete
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func modifyAction() {
        let nextVC = UserInfoViewController()
        nextVC.type = .modify
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func goCartAction() {
        let nextVC = CartViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func goOrderCancelAction() {
        let nextVC = OrderCancelViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func nextAction() {
        let nextVC = SecondViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }

    @objc private func orderAction() {
        let nextVC = OrderViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc private func viewedProductAction() {
        let nextVC = ViewedProductViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
