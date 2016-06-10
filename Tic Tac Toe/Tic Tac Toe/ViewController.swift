//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Nelson Wu on 2016-06-07.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    var activePlayer = 1 // 1 = circle
    var gameActive = true
    var gamestate = [0, 0, 0, 0, 0 ,0 ,0 ,0 ,0]
    let win = [[0, 1, 2], [3, 4, 5], [6, 7 ,8], [0, 3, 6], [1, 4, 7], [2, 5 ,8], [0, 4, 8], [2, 4, 6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPoint(x: gameOverLabel.center.x - 400, y: gameOverLabel.center.y)
        playAgainButton.hidden = true
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 400, y: playAgainButton.center.y)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func playAgain(sender: AnyObject) {
        gamestate = [0, 0, 0, 0, 0 ,0 ,0 ,0 ,0]
        activePlayer = 1
        gameActive = true
        gameOverLabel.hidden = true
        gameOverLabel.center = CGPoint(x: gameOverLabel.center.x - 400, y: gameOverLabel.center.y)
        playAgainButton.hidden = true
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 400, y: playAgainButton.center.y)
        //var button : UIButton
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
            
        }
    }
    @IBAction func buttonClick(sender: UIButton) {
        if gamestate[sender.tag-1] == 0 && gameActive{
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "Circle"), forState: .Normal)
                gamestate[sender.tag-1] = activePlayer
                activePlayer = 2
            } else {
                gamestate[sender.tag-1] = activePlayer
                sender.setImage(UIImage(named: "Cross"), forState: .Normal)
                activePlayer = 1
            }
            for comb in win {
                if gamestate[comb[0]] != 0 && gamestate[comb[1]] == gamestate[comb[2]] && gamestate[comb[1]] == gamestate[comb[0]]{
                    
                    if(gamestate[comb[0]] == 1){
                        gameOverLabel.text = "O wins."
                    } else if(gamestate[comb[0]] == 2) {
                        gameOverLabel.text = "X wins."
                    }
                    gameActive = false
                    gameOverLabel.hidden = false
                    UIView.animateWithDuration(0.5, animations: {
                        self.gameOverLabel.center = CGPoint(x: self.gameOverLabel.center.x + 400, y: self.gameOverLabel.center.y)
                        
                    })
                    playAgainButton.hidden = false
                    UIView.animateWithDuration(0.5, animations: {
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 400, y: self.playAgainButton.center.y)
                        
                    })
                    
                }
            }
        }
    }
    
    
}

