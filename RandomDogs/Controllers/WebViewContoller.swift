//
//  WebViewContoller.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 27.01.2022.
//

import UIKit
import WebKit

class WebViewContoller: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    var urlString: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = URL(string: urlString)!
        let request = URLRequest(url: myURL)
        webView.load(request)
    
    }
    
}
