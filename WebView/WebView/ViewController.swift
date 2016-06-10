//
//  ViewController.swift
//  WebView
//
//  Created by Nelson Wu on 2016-06-09.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var url = NSURL(string: "https://google.com")!
        var request = NSURLRequest(URL: url)
        webView.loadRequest(request)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

