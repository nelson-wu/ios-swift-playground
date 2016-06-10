//
//  ViewController.swift
//  NSUserDefault Storage
//
//  Created by Nelson Wu on 2016-06-06.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let arr = [1, 2 ,3]
        NSUserDefaults.standardUserDefaults().setObject("test", forKey: "str")
        NSUserDefaults.standardUserDefaults().setObject(arr, forKey: "array")
        let returnedStr = NSUserDefaults.standardUserDefaults().objectForKey("str") as! String
        let returnedArr = NSUserDefaults.standardUserDefaults().objectForKey("array") as! Array<Int>
        print(returnedStr)
        print(returnedArr)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

