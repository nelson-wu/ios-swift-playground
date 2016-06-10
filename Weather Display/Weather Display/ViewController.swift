//
//  ViewController.swift
//  Weather Display
//
//  Created by Nelson Wu on 2016-06-07.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func findWeather(sender: UIButton) {
        if !(cityTextField.text?.isEmpty)!{
        let url = NSURL(string: "http://www.weather-forecast.com/locations/\(cityTextField.text!)/forecasts/latest")!
        
        let task = NSURLSession .sharedSession().dataTaskWithURL(url) { (data, response, error) in
            if let urlContent = data {
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                let webArray = webContent?.componentsSeparatedByString("Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                let contentArray = webArray![1].componentsSeparatedByString("</span")
                dispatch_async(dispatch_get_main_queue(), {
                    self.resultLabel.text = contentArray[0].stringByReplacingOccurrencesOfString("&deg;", withString: " ")
                })
            }
        }
        task.resume()
        }
    }


}

