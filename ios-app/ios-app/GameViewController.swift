//
//  GameViewController.swift
//  ios-app
//
//  Created by PRADOPC on 19/10/18.
//  Copyright © 2018 PRADOPC. All rights reserved.
//

import UIKit
import FirebaseDatabase
class GameViewController: UIViewController {
    var ref: DatabaseReference!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var hitLabel: UILabel!
    @IBOutlet weak var gameSlider: UISlider!
    @IBOutlet weak var playernameTextField: UITextField!
    
    @IBOutlet weak var actualNumberLabel: UILabel!
    let game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    @IBAction func gameSlider(_ sender: Any) {
        let slider = sender as! UISlider  // forzar casting
        let sliderValue = Int(round(slider.value))
        game.play(sliderValue: sliderValue)
        actualNumberLabel.text = "Your guess was: \(sliderValue)"
        setValues()
        
        if  game.roundCount == 3 {
            slider.isEnabled = false
            actualNumberLabel.text = "Final score: \(game.score)"
            let uid = UUID().uuidString
            self.ref.child("games").child(uid)
                .setValue(["score": game.score, "player": playernameTextField.text ?? "default"])
            self.performSegue(withIdentifier: "gamesSegue", sender: self)
        }
    }
    
    @IBAction func RestartButtonPressed(_ sender: Any) {
        game.restartGame()
        setValues()
        
        actualNumberLabel.text = "Move the slider to begin";
        gameSlider.isEnabled = true
    }
    func setValues() {
        scoreLabel.text = "Score: \(game.score)"
        roundLabel.text = "Round: \(game.roundCount)"
        hitLabel.text = "Hit: \(game.numberToHit)"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
