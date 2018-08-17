//
//  ViewController.swift
//  AnimationSample
//
//  Created by Слава on 14.08.2018.
//  Copyright © 2018 Слава. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewToAnimate: UIView!
    @IBOutlet weak var backgroundToAnimate: UIImageView!
    @IBOutlet weak var logoToAnimate: UIButton!
    @IBOutlet weak var textFieldWithShake: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldWithShake.delegate = self
      
        parallax(toView: backgroundToAnimate, magnitude: 20)
        parallax(toView: logoToAnimate, magnitude: -20)
    }
    
    private func parallax(toView view: UIView, magnitude: Float) {
        
        let xMotion = UIInterpolatingMotionEffect(
            keyPath: "center.x",
            type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = -magnitude
        xMotion.maximumRelativeValue = magnitude
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -magnitude
        yMotion.maximumRelativeValue = magnitude
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [xMotion, yMotion]
        
        view.addMotionEffect(group)
    }
    
    
    @IBAction func animateBounds(_ sender: UIButton) {
        
        let bounds = sender.bounds
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10,
                       options: .allowUserInteraction,
                       animations: {
                        sender.bounds = CGRect(x: bounds.origin.x,
                                               y: bounds.origin.y,
                                               width: bounds.size.width + 100,
                                               height: bounds.size.height + 100)
        }) { (success) in
            if success {
                UIView.animate(withDuration: 0.5, animations: {
                    sender.bounds = bounds
                })
            }
        }
    }
    
}



extension ViewController : UITextFieldDelegate{
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textFieldWithShake.text != "Password" {
            textFieldWithShake.shake()
        } else {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            guard let svc = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
            self.present(svc, animated: true, completion: nil)
        }

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldWithShake.resignFirstResponder()
        return true
    }
    
   
}
