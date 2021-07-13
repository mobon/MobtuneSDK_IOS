//
//  ViewController.swift
//  MobtuneSample
//
//  Created by DoHyoung Kim on 2021/07/13.
//

import UIKit
import WebKit
import Mobtune

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let contentController = WKUserContentController()
        let config = Mobtune.getConfiguration()
        config.userContentController = contentController
        
        let webView = WKWebView(frame: view.bounds, configuration: config)
        view.addSubview(webView)
    }


}

