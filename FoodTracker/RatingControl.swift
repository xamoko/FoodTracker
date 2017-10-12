//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Xavier Morales on 12/10/16.
//  Copyright © 2016 Xavier Morales. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    var rating = 0 {
        didSet{
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let emptyStarImage = UIImage(named: "emptyStar.png")
        
        let failedStarImage = UIImage(named: "failedStar.png")

        
        for _ in 0..<5{
        
       // let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            
            let button = UIButton()
            
            button.setImage(emptyStarImage, for: .normal)
            button.setImage(failedStarImage, for: .selected)
            button.setImage(failedStarImage, for: [.highlighted, .selected])
            
            button.adjustsImageWhenHighlighted = false
        
        //button.backgroundColor = UIColor.red
        
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
        
        ratingButtons += [button]
            
        addSubview(button)
            
        }
    
        func intrinsicContentSize() -> CGSize{
            
            let buttonSize = Int(frame.size.height)
            
            let width = (buttonSize  * starCount) + (spacing * (starCount - 1))
            
            return CGSize(width: width, height: buttonSize)
        }
    }
    
    override func layoutSubviews() {
        
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        /*for (index, button) in ratingButtons.enumerated(){
            buttonFrame.origin.x = CGFloat(index * (44 + spacing))
            button.frame = buttonFrame
        }*/
        for (index, button) in ratingButtons.enumerated(){
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
        }
    }

    
    //MARK: Button Action
    
    func ratingButtonTapped(button: UIButton){
        //print ("Button Pressed 👍🏻")
        rating = ratingButtons.index(of: button)! + 1
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates(){
        for(index,button) in ratingButtons.enumerated(){
            button.isSelected = index < rating
        }
    }
    

}
