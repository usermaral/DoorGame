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
    private var gameEngine = GameEngine()
    
    init(controller: GameViewController? = nil) {
        self.controller = controller
        self.view = controller?.view
    }
    
    private lazy var buttonView: UIView = {
        let view = UI.buttonView
        view.addSubview(leftDoor)
        view.addSubview(rightDoor)
        return view
    }()
    
    private lazy var leftDoor: UIButton = {
        let button = UI.leftDoor
        button.addTarget(self, action: #selector(selectDoor(sender: )), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightDoor: UIButton = {
        let button = UI.rightDoor
        button.addTarget(self, action: #selector(selectDoor(sender: )), for: .touchUpInside)
        return button
    }()
    
    func setEnvironment() {
        guard let view = view else { return }
        view.addSubview(UI.backgroundSprite)
        UI.highScoreValue.text = "\(gameEngine.record)"
        [UI.highScoreLabel, UI.highScoreValue, UI.mainLabelStack, buttonView].forEach {
            view.addSubview($0)
        }
        
        UI.highScoreLabel.frame = CGRect(x: 30, y: 80, width: 150, height: 40)
        UI.highScoreValue.frame = CGRect(x: 175, y: 80, width: 60, height: 40)
        
        UI.mainLabelStack.center.x = view.center.x
        UI.mainLabelStack.frame.origin.y = 180
        
        UI.rightDoor.frame.origin.x = buttonView.frame.width - 146
        buttonView.frame.origin.x = 43
        buttonView.center.y = view.center.y + 100
    }
    
    @objc func selectDoor(sender: UIButton) {
        let side = sender.tag == 1 ? false : true
        
        if gameEngine.gameAction(side: side) {
            UI.selectedLabel.text = UI.correctlabel.text
            UI.selectedLabel.textColor = UI.correctlabel.textColor
        } else {
            UI.selectedLabel.text = UI.incorrectlabel.text
            UI.selectedLabel.textColor = UI.incorrectlabel.textColor
        }
        
        UI.scoreValue.text = "\(gameEngine.score)"
        UI.description.text = LabelStrings.getCurrentResultText(score: gameEngine.score)
        UI.highScoreValue.text = "\(gameEngine.record)"
    }
}
