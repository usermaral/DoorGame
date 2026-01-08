//
//  GameEngine.swift
//  DoorGame
//
//  Created by Maral on 16.11.2025.
//

import Foundation

final class GameEngine {
    
    private var userDefaults = UserDefaults.standard
    var score: Int = 0
    var record: Int
    
    init() {
        self.record = userDefaults.integer(forKey: StorageKeys.record.rawValue)
    }
    
    private func getRandomValue() -> Bool {
        Bool.random()
    }
    
    private func roundWin() {
        score += 1
        if record < score {
            userDefaults.setValue(score, forKey: StorageKeys.record.rawValue)
            self.record = score
        }
    }
    
    private func roundFail() {
        score = 0
    }
    
    func gameAction(side: Bool) -> Bool {
        let random = getRandomValue()
        side == random ? roundWin() : roundFail()
        
        return side == random
    }
}

enum StorageKeys: String {
    case record
}
