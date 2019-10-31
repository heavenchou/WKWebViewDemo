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
    
    // MARK: 自訂屬性與元件
    
    let webView = WKWebView()
    @IBOutlet weak var btGetWebPageText: NSButtonCell!
    @IBOutlet weak var btSendWebPageText: NSButton!
    @IBOutlet weak var edEdit: NSTextField!
    
    // MARK: 預設成員函式
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createWebview()
        webviewConstraint()
        loadWebview()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    // MARK: 自訂成員函式
    // 建立 WebView
    fileprivate func createWebview() {
        
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self
        
        webView.frame = .zero
        self.view.addSubview(webView)
    }
    
    // 約束 webview
    fileprivate func webviewConstraint() {
        webView.translatesAutoresizingMaskIntoConstraints=false
        
        let ctLeft = NSLayoutConstraint(item: webView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 20)
        let ctRight = NSLayoutConstraint(item: webView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: -20)
        let ctTop = NSLayoutConstraint(item: webView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 50)
        let ctBottom = NSLayoutConstraint(item: webView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -20)
        
        //self.view.addConstraint(ctLeft)
        //self.view.addConstraint(ctRight)
        //self.view.addConstraint(ctTop)
        //self.view.addConstraint(ctBottom)
        
        NSLayoutConstraint.activate([ctLeft,ctRight,ctTop,ctBottom])
    }
    // 載入網頁
    fileprivate func loadWebview() {
        webView.loadFileURL(URL(string: "file:///Users/heaven/desktop/html/index.htm")!, allowingReadAccessTo: URL(string: "file:///Users/heaven/desktop/html")!)
    }
    
    @IBAction func btSendWebPageTextClick(_ sender: Any) {
        let strLabel = edEdit.stringValue
        let strJS =
        "document.getElementById('MyLabel').innerText = '\(strLabel)'"
        webView.evaluateJavaScript(strJS)
    }
    
    @IBAction func btGetWebPageTextClick(_ sender: Any) {
        webView.evaluateJavaScript("GetSel()",
            completionHandler: {
            (result, err) in
            self.edEdit.stringValue = result as! String
        })
    }
}


