//
//  ViewController.swift
//  Web Content
//
//  Created by Nelson Wu on 2016-06-07.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://www.stackoverflow.com")!
        webView.loadRequest(NSURLRequest(URL: url))
//        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
//            // Code here happens when task completes
//            
//            if let urlContent = data {
//                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
//                dispatch_async(dispatch_get_main_queue(), {
//                    self.webView.loadHTMLString(String(webContent), baseURL: nil)
//
//                })
//            }
//        }
//        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

