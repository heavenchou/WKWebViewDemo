//
//  ViewController.swift
//  WKWebViewDemo
//
//  Created by Heaven Chou on 2019/10/28.
//  Copyright © 2019 CBETA. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKUIDelegate, WKNavigationDelegate {
    
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self
        
        webView.frame = CGRect(x:0,y:0,width:400,height: 270)
        view.addSubview(webView)
                
        let myURL=URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

