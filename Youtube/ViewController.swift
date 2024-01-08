//
//  ViewController.swift
//  Youtube
//
//  Created by Trọng Nghĩa Nguyễn on 07/01/2024.
//

import UIKit

class ViewController: UIViewController {

    
    var model = Model()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideo()

    }

}

