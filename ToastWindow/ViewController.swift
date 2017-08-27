//
//  ViewController.swift
//  ToastWindow
//
//  Created by motoki on 2017/08/27.
//  Copyright © 2017年 vipt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Toastable {
    
    var window: UIWindow!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        showToast(message: "Hello World!", duration: 2.0)
        performSegue(withIdentifier: "next", sender: nil)
    }
}

