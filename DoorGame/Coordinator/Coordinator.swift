//
//  Coordinator.swift
//  DoorGame
//
//  Created by Maral on 16.11.2025.
//

import UIKit

final class Coordinator {
    private weak var controller: GameViewController?
    private var view: UIView?
    
    private var UI = GameUI()
    
    init(controller: GameViewController? = nil) {
        self.controller = controller
        self.view = controller?.view
    }
    
    private lazy var leftDoor: UIButton = {
        let button = UI.leftDoor
        return button
    }()
    
    private lazy var rightDoor: UIButton = {
        let button = UI.rightDoor
        return button
    }()
    
    func setEnvironment() {
        guard let view = view else { return }
        view.addSubview(UI.backgroundSprite)
        
        [UI.highScoreLabel, UI.highScoreValue, UI.mainLabelStack, UI.buttonView].forEach {
            view.addSubview($0)
        }
        
        UI.highScoreLabel.frame = CGRect(x: 30, y: 80, width: 150, height: 40)
        UI.highScoreValue.frame = CGRect(x: 175, y: 80, width: 60, height: 40)
        
        UI.mainLabelStack.center.x = view.center.x
        UI.mainLabelStack.frame.origin.y = 180
        
        UI.rightDoor.frame.origin.x = UI.buttonView.frame.width - 146
        UI.buttonView.frame.origin.x = 43
        UI.buttonView.center.y = view.center.y + 100
    }
}
