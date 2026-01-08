//
//  GameUI.swift
//  DoorGame
//
//  Created by Maral on 16.11.2025.
//

import UIKit

final class GameUI {
    private var bounds: CGRect?
    
    init() {
        self.bounds = UIScreen.main.bounds
    }
    
    lazy var backgroundSprite: UIImageView = {
        $0.image = .background
        $0.frame = bounds ?? .zero
        return $0
    }(UIImageView())
    
    lazy var leftDoor: UIButton = {
        $0.frame.size = CGSize(width: 120, height: 180)
        $0.tag = 0
        $0.setBackgroundImage(.secondDoor, for: .normal)
        $0.setBackgroundImage(.secondOpenedDoor, for: .highlighted)
        return $0
    }(UIButton())
    
    lazy var rightDoor: UIButton = {
        $0.frame.size = CGSize(width: 120, height: 180)
        $0.tag = 1
        $0.setBackgroundImage(.firstDoor, for: .normal)
        $0.setBackgroundImage(.firstOpenedDoor, for: .highlighted)
        return $0
    }(UIButton())
    
    lazy var buttonView: UIView = {
        $0.frame.size = CGSize(width: (bounds?.width ?? .zero) - 60, height: 315)
        $0.addSubview(leftDoor)
        $0.addSubview(rightDoor)
        return $0
    }(UIView())
    
    // MARK: - Labels
    
    lazy var selectedLabel = createTextLabel(labelText: .selected, fontSize: 40)
    lazy var highScoreLabel = createTextLabel(labelText: .highScore, fontSize: 25, color: .black)
    lazy var highScoreValue = createTextLabel(labelText: .zero, fontSize: 25, color: .black)
    lazy var correctlabel = createTextLabel(labelText: .correct, fontSize: 20, color: .correct)
    lazy var incorrectlabel = createTextLabel(labelText: .incorrect, fontSize: 20, color: .incorrect)
    lazy var scoreLabel = createTextLabel(labelText: .score, fontSize: 30)
    lazy var scoreValue = createTextLabel(labelText: .zero, fontSize: 30)
    lazy var description = getDescriptionLabel(score: 5)
    
    private func getDescriptionLabel(score: Int) -> UILabel {
        return {
            let descriptionText = createTextLabel(labelText: .zero, fontSize: 20)
            descriptionText.text = LabelStrings.getCurrentResultText(score: score)
            return descriptionText
        }()
    }
    
    // MARK: - Stack
    
    private lazy var scoreResultStack: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.addArrangedSubview(UIView())
        $0.addArrangedSubview(scoreLabel)
        $0.addArrangedSubview(scoreValue)
        $0.addArrangedSubview(UIView())
        return $0
    }(UIStackView())
    
    private lazy var scoreStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .center
        $0.addArrangedSubview(selectedLabel)
        $0.addArrangedSubview(scoreResultStack)
        return $0
    }(UIStackView())
    
    lazy var mainLabelStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 40
        $0.alignment = .center
        $0.frame.size = CGSize(width: bounds?.width ?? .zero, height: 140)
        $0.addArrangedSubview(scoreStack)
        $0.addArrangedSubview(description)
        return $0
    }(UIStackView())
    
    private func createTextLabel(labelText: LabelStrings, fontSize: CGFloat, color: UIColor = .white) -> UILabel {
        return {
            $0.setLabelFont(fontSize)
            $0.text = labelText.rawValue
            $0.textColor = color
            return $0
        }(UILabel())
    }
}

enum LabelStrings: String {
    case empty = ""
    case zero = "0"
    case selected = "Choose the door"
    case highScore = "High score: "
    case correct = "Correct!"
    case incorrect = "Incorrect!"
    case score = "Score: "
    
    static func getCurrentResultText(score: Int) -> String {
        switch score {
        case 0:
            return ""
        case 5:
            return "Not bad! Your instincts are working."
        case 10:
            return "You’re reading the game."
        case 15:
            return "Level: Clairvoyance."
        case 20:
            return "You have become pure intuition."
        default:
            return ""
        }
    }
}
