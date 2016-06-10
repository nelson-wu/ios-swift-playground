//
//  ViewController.swift
//  Web Image
//
//  Created by Nelson Wu on 2016-06-09.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = NSURL(string: "http://oxfordclothbuttondown.com/wp-content/uploads/2012/09/George-Costanza-OCBD1.jpg")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) in
            if error != nil {
                print(error)
            } else {
                var documentDirectory:String?
                var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
                if paths.count > 0 {
                    documentDirectory = paths[0] as? String
                    let savePath = documentDirectory! + "/costanza.jpg"
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    dispatch_async(dispatch_get_main_queue(), {
                        self.imageView.image = UIImage(named: savePath)
                    })
                }
/*
                dispatch_async(dispatch_get_main_queue(), {
                    if let costanza = UIImage(data: data!){
                        self.imageView.image = costanza
                        
                    }
                })
*/
                
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

