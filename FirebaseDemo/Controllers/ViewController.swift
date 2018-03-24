//
//  ViewController.swift
//  FirebaseDemo
//
//  Created by Xcode User on 2018-03-20.
//  Copyright © 2018 Austin Howlett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var loginButton : UIButton!
    @IBOutlet var signupButton : UIButton!
    
    @IBAction func unwindToHome(sender: UIStoryboardSegue) { }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor(red: 125/255.5, green: 175/255.5, blue: 255/255.5, alpha: 1.0).cgColor, UIColor(red: 128/255.5, green: 25/255.5, blue: 14/255.5, alpha: 1.0).cgColor,
            UIColor(red: 128/255.5, green: 25/255.5, blue: 14/255.5, alpha: 1.0).cgColor]
        gradientLayer.locations = [0.0, 0.8, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        loginButton.backgroundColor = .clear
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
        loginButton.layer.borderWidth = 1
        loginButton.layer.borderColor = UIColor.white.cgColor
        
        signupButton.backgroundColor = .clear
        signupButton.layer.cornerRadius = signupButton.frame.height / 2
        signupButton.layer.borderWidth = 1
        signupButton.layer.borderColor = UIColor.white.cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

