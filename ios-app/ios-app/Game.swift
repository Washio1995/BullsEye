//
//  Game.swift
//  ios-app
//
//  Created by PRADOPC on 19/10/18.
//  Copyright © 2018 PRADOPC. All rights reserved.
//

import Foundation

class Game {
    var score: Int = 0
    var roundCount: Int = 0
    var numberToHit: Int = 0
    
    func restartGame() {
        score = 0
        roundCount = 0
        numberToHit = Int(arc4random_uniform(101))
    }
    func play(sliderValue: Int) {
        // Rules:
        // difference between slider value & number to hit:
        // 0 : 100 points
        // 3 : 50 points
        // 5 : 25 points
        let difference = abs(sliderValue - numberToHit)
        switch difference {
        case 0:
            score += 100
        case 1...3:
            score += 50
        case 4...5:
            score += 25
        default:
            break
        }
        roundCount += 1
        numberToHit = Int(arc4random_uniform(101))
        print(numberToHit)
    }
}
