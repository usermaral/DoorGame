//
//  ViewController.swift
//  DoorGame
//
//  Created by Maral on 15.11.2025.
//

import UIKit

class GameViewController: UIViewController {
    
    lazy var coordinator = {
        return Coordinator(controller: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        coordinator.setEnvironment()
    }
}

