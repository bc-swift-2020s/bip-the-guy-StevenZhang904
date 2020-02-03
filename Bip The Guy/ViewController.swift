//
//  ViewController.swift
//  Bip The Guy
//
//  Created by 张泽华 on 2020/2/2.
//  Copyright © 2020 张泽华. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageToPunch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
//Functions
    func animateImage(){
        let bounds = self.imageToPunch.bounds
        let shrinkValue:CGFloat = 60
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + 60, y: self.imageToPunch.bounds.origin.y + 60, width: self.imageToPunch.bounds.size.width - 60, height: self.imageToPunch.bounds.size.height - 60)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: { self.imageToPunch.bounds = bounds }, completion:nil)
    }
//Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
        
    }
    @IBAction func cameraPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        
    }
}

