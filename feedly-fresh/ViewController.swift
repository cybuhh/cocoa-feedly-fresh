//
//  ViewController.swift
//  feedly-fresh
//
//  Created by matcybur on 18/12/2017.
//  Copyright © 2017 matcybur. All rights reserved.
//

import Cocoa
import WebKit

// https://github.com/CODYQX4/Feedly-Login-Without-Popups/blob/master/Feedly%20Login%20Without%20Popups.user.js
// http://samwize.com/2016/06/08/complete-guide-to-implementing-wkwebview/
// https://www.hackingwithswift.com/example-code/wkwebview/how-to-monitor-wkwebview-page-load-progress-using-key-value-observing
// https://feedly.com/v3/auth/auth?client_id=feedly&redirect_uri=https%3A%2F%2Ffeedly.com%2Ffeedly.html&scope=https%3A%2F%2Fcloud.feedly.com%2Fsubscriptions&response_type=code&ck=1513612448871&ct=feedly.desktop&landingPage=welcome&cv=30.0.1410&pageRef=welcome&mode=login
class ViewController: NSViewController, WKUIDelegate {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://feedly.com/v3/auth/link?client_id=feedly&redirect_uri=https%3A%2F%2Ffeedly.com%2Ffeedly.html&state=addLogin&ck=1463670102706&ct=feedly.desktop&feedlyToken=A6mwpxzB70HkJC3r31agLcoPTgvGVSU2LZTwinS425yVWSloGtK2jUloUoMu1IwynVb4HGaf25yMNKEo5qXS31KJnm7uo6DJGJOdHJ6g3pBBBz7SOfG8Wy19kYrPTuxLbxYKjRsTX0R31swWXQ55-G6r5zr8GS3EYZQfuEJLrzA_I4Im0X9qgD1mWj4xWOwngK74ykLR_XfFbb3SoeF8uuAxcrBSdLIeCJHKCQ5EKcpUSQ:feedly")!
        let request = URLRequest(url: url)
        webView.load(request)
        webView.navigationDelegate = self
        //webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        webView.configuration.preferences.setValue(true, forKey: "developerExtrasEnabled")
        // webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        /*if keyPath == "loading" {
            return print("loading")
        }*/
        if keyPath == "loading", webView.isLoading == false {
            
            let currentUrl = webView.url!
            // if (currentUrl.query?.contains("response_type=code&client_id="))!, !(currentUrl.query?.contains("&client_id=feedly"))! {
            if (currentUrl.absoluteString.contains("https://feedly.com/feedly.htm")) {
                // let url = URL(string: "https://feedly.com/i/latest")!
                //let url = URL(string: "https://feedly.com/i/login")!
                //let request = URLRequest(url: url)
                // webView.load(request)
                //print("\(currentUrl.absoluteString)")
            }
            
            // self.webView.evaluateJavaScript(<#T##javaScriptString: String##String#>, completionHandler: <#T##((Any?, Error?) -> Void)?##((Any?, Error?) -> Void)?##(Any?, Error?) -> Void#>)
            print("\(currentUrl.absoluteString)")
        }
        // print("\(keyPath) \(webView.estimatedProgress) \(webView.isLoading) \(change) \(webView.url)")
    }
    
    /*
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webview = WKWebView(frame: .zero, configuration: webConfiguration)
        webview.uiDelegate = self
        view = webview
    }*/
    
    

}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let currentUrl = webView.url!
        if (currentUrl.absoluteString.contains("https://feedly.com/feedly.htm")) {
            
        }
    }
}
