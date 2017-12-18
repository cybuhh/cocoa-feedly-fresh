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

class ViewController: NSViewController, WKUIDelegate {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://feedly.com/v3/auth/auth?client_id=feedly&redirect_uri=https%3A%2F%2Ffeedly.com%2Ffeedly.html&scope=https%3A%2F%2Fcloud.feedly.com%2Fsubscriptions&response_type=code&ck=1463666268286&ct=feedly.desktop&landingPage=welcome&pageRef=welcome&mode=logina")!
        let request = URLRequest(url: url)
        webView.load(request)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.isLoading), options: .new, context: nil)
        // webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        /*if keyPath == "loading" {
            return print("loading")
        }*/
        if keyPath == "loading", webView.isLoading == true {
            let currentUrl = webView.url!
            //if (currentUrl.query?.contains("response_type=code&client_id="))!, !(currentUrl.query?.contains("&client_id=feedly"))! {
                // let url = URL(string: "https://feedly.com/i/latest")!
                //let url = URL(string: "https://feedly.com/i/login")!
                //let request = URLRequest(url: url)
                // webView.load(request)
                print("\(currentUrl.absoluteString)")
            //}
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

