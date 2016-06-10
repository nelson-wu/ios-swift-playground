//
//  ViewController.swift
//  JSON Data
//
//  Created by Nelson Wu on 2016-06-09.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "https://freegeoip.net/json/")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            if let urlContent = data {
                do{
                    let result = try NSJSONSerialization.JSONObjectWithData(urlContent, options: .MutableContainers)
                    print(result["city"])
                } catch {
                    print("JSON serialization failed")
                }
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

