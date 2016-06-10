//
//  ViewController.swift
//  Audio
//
//  Created by Nelson Wu on 2016-06-08.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player = AVAudioPlayer()
    
    @IBOutlet weak var scrubSlider: UISlider!
    @IBOutlet weak var slider: UISlider!
    @IBAction func play(sender: AnyObject) {
        player.play()
    }
    
    @IBAction func pause(sender: AnyObject) {
        player.pause()
    }
    @IBAction func slide(sender: AnyObject) {
        player.volume = slider.value
    }
    @IBAction func scrub(sender: AnyObject) {
        player.currentTime = Double(scrubSlider.value)
    }
    func update(){
        scrubSlider.value = Float(player.currentTime)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let audioPath = NSBundle.mainBundle().pathForResource("03", ofType: "mp3")!
        do{
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
            scrubSlider.maximumValue = Float(player.duration)
            print(scrubSlider.maximumValue)
            //player.play()
        } catch{
            
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

