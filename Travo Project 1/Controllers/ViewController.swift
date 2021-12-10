//
//  ViewController.swift
//  Travo Project 1
//
//  Created by Visakh D on 09/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Service.shared.apiPost()
    }


}

