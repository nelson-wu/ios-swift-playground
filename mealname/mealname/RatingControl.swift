//
//  RatingControl.swift
//  mealname
//
//  Created by Nelson Wu on 2016-06-02.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    // MARK: Properties
    var rating = 0 {
        didSet{
            setNeedsLayout();
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    
    // MARK: Initialization
    override func layoutSubviews() {
        // Set the button's width and height to a square the size of the frame's height
       
        let buttonHeight = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonHeight, height: buttonHeight)
        
        // Offset each button by the length of the button plus spacing
        for(index, button) in ratingButtons.enumerate(){
            buttonFrame.origin.x = CGFloat(index * (buttonHeight + spacing))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let filledStarImage = UIImage(named: "FilledStar")
        let emptyStarImage = UIImage(named: "EmptyStar")
        
        for _ in 0..<starCount {
            let button = UIButton()
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            addSubview(button)
            ratingButtons += [button]
        }
    }
    
    
    override func intrinsicContentSize() -> CGSize {
        let buttonHeight = Int(frame.size.height)
        let width = (buttonHeight * starCount) + (spacing * (starCount - 1))
        return CGSize(width: width, height: buttonHeight)
    }
    
    // MARK: Button
    func ratingButtonTapped(button: UIButton){
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates() {
        for(index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected
            button.selected = index < rating
        }
    }
}
