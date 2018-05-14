//
//  ViewController.swift
//  Lec7part2
//
//  Created by hackeru on 29 Iyar 5778.
//  Copyright © 5778 student.roey.honig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        blurView.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showCustomDialog(_ sender: UIButton) {
        //TODO: add the dialog View to this ViewController
        self.view.addSubview(dialogView) // "self" is redantent
        
        // position the dialog view
        let x = view.center.x
        let y = view.center.y
        
        let width = view.frame.size.width / 2
        let hight = view.frame.size.height / 3
        
        dialogView.frame.size = CGSize(width: width, height: hight)
        dialogView.center.x = x
        dialogView.center.y = y
        
        
        
        // start point of the animation
        // we need to translate from th position
        // the end point of the animation should be the position
        
        dialogView.transform = CGAffineTransform(scaleX: 2, y: 1.5).translatedBy(x: 0, y: -500)
        self.dialogView.alpha = 0
        // animate things
        UIView.animate(withDuration: 2) {
            //code here is animation
            self.blurView.alpha = 1
            self.dialogView.alpha = 1
            self.dialogView.transform = CGAffineTransform.identity // zeros all the transforms
            
        }
        
        
        //
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dialogView.removeFromSuperview()
        // toggle the blur effect
        blurView.alpha = 0
    }
    
}

