//
//  SecondViewController.swift
//  AnimationSample
//
//  Created by Слава on 17.08.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

   
    
    @IBOutlet weak var sliderButton: UIButton!
    @IBOutlet weak var resumeButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var stackWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        swipeObserver()
    }

    
    func swipeObserver() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(gester:)))
        swipeRight.direction = .right
        sliderButton.addGestureRecognizer(swipeRight)
    }
    
    @objc func handleSwipe(gester: UISwipeGestureRecognizer) {
        switch gester.direction {
        case .right:

            
            
            UIView.animate(withDuration: 100, animations: {
                
               self.stackWidth.constant = self.view.bounds.size.width
                
            }, completion: nil)
            
        default:
            break
        }
    }
    
    
    @IBAction func resumePressed(_ sender: UIButton) {
        self.stackWidth.constant = 0
    }
    

}

