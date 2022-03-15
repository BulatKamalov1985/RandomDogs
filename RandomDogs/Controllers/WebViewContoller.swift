//
//  WebViewContoller.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 27.01.2022.
//

import UIKit
import WebKit

class WebViewContoller: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var urlString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.addSubview(spinner)
        downLoadDataFromWebView(urlString)
        spinner.startAnimating()
        webView.navigationDelegate = self
        spinner.hidesWhenStopped = true
    }

    func downLoadDataFromWebView(_ string: String) {
        guard let myURL = URL(string: string) else { return }
        let request = URLRequest(url: myURL)
        webView.load(request)
    }
}

extension WebViewContoller: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        spinner.stopAnimating()
    }
}
