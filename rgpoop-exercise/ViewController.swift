//
//  ViewController.swift
//  rgpoop-exercise
//
//  Created by Bruce Burgess on 3/21/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var leftSpartanBtn: UIButton!
    @IBOutlet weak var leftOrcBtn: UIButton!
    @IBOutlet weak var rightSpartanBtn: UIButton!
    @IBOutlet weak var rightOrcBtn: UIButton!
    
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var leftCharacter: UIImageView!
    @IBOutlet weak var rightCharacter: UIImageView!
    @IBOutlet weak var leftAttackBtn: UIButton!
    @IBOutlet weak var rightAttackBtn: UIButton!
    @IBOutlet weak var notifyLbl: UILabel!
    
    @IBOutlet weak var rightAttackLabel: UILabel!
    @IBOutlet weak var leftAttackLabel: UILabel!
    @IBOutlet weak var restartLabel: UILabel!
    @IBOutlet weak var restartBtn: UIButton!
    var game: Game!
    
    let TIMES = 3
    
    var timeCount: Int!
    
    var leftPlayer: String?
    var rightPlayer: String?
    var playerCount = 0
    
    var leftTransform = false
    var rightTransform = false
    
    var music: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftSpartanBtn.imageView?.transform = CGAffineTransformMakeScale(-1, 1)
        rightOrcBtn.imageView?.transform = CGAffineTransformMakeScale(-1, 1)
    
        Music.sharedHelper.playBackgroundMusic()
        
        //startGame()

    }
    
    
    func startGame(){
        revealGame()
        playerCount = 0
        
        timeCount = TIMES
        notifyLbl.text = "\(timeCount)"
        if leftPlayer != nil && rightPlayer != nil {
            game = Game(leftPlayer: leftPlayer!, rightPlayer: rightPlayer!)
        } else {
            print("There was an error. No players")
            return
        }
        setTimer()
        
    }
    
    func revealGame() {
        restartBtn.hidden = true
        restartLabel.hidden = true
        rightSpartanBtn.hidden = true
        rightOrcBtn.hidden = true
        leftOrcBtn.hidden = true
        leftSpartanBtn.hidden = true
        
        
        if leftPlayer ==  "Spartan" {
            leftCharacter.image = UIImage(named: "player")
            if !leftTransform {
                leftCharacter.transform = CGAffineTransformMakeScale(-1, 1)
                leftTransform = true
            }
        } else {
            leftCharacter.image = UIImage(named: "enemy")
            if leftTransform {
                print("Left Orc")
                leftCharacter.transform = CGAffineTransformMakeScale(1, 1)
                leftTransform = false
            }
        }
        
        if rightPlayer == "Orc" {
            rightCharacter.image = UIImage(named: "enemy")
            if !rightTransform {
                rightCharacter.transform = CGAffineTransformMakeScale(-1, 1)
                rightTransform = true
            }
        } else {
            rightCharacter.image = UIImage(named: "player")
            if rightTransform {
                print("Right Spartan")
                rightCharacter.transform = CGAffineTransformMakeScale(1, 1)
                rightTransform = false
            }
        }
        
        leftCharacter.hidden = false
        rightCharacter.hidden = false
        leftAttackBtn.hidden = false
        rightAttackBtn.hidden = false
        rightAttackLabel.hidden = false
        leftAttackLabel.hidden = false

    }
    
    func resetGame(){
        msgLabel.text = ""
        
        restartBtn.hidden = false
        restartLabel.hidden = false
        rightSpartanBtn.hidden = false
        rightOrcBtn.hidden = false
        leftOrcBtn.hidden = false
        leftSpartanBtn.hidden = false
        
        leftCharacter.hidden = true
        rightCharacter.hidden = true
        leftAttackBtn.hidden = true
        rightAttackBtn.hidden = true
        rightAttackLabel.hidden = true
        leftAttackLabel.hidden = true
        
        notifyLbl.text = "Choose Your Character"
    }

    @IBAction func rightAttackTapped(sender: UIButton) {
        checkForAttack()
        msgLabel.text = game.attacking("right")
        if !checkForGameOver() {
            notifyLbl.text = "\(timeCount)"
        }
        checkDead()

    }

    @IBAction func leftAttackTapped(sender: UIButton) {
        checkForAttack()
        msgLabel.text = game.attacking("left")
        if !checkForGameOver() {
            notifyLbl.text = "\(timeCount)"
        }
        checkDead()
    }
    
    @IBAction func restartButtonTapped(sender: UIButton) {
        game = nil
        //startGame()
        resetGame()
    }
    
    
    func setTimer() {
        let gameOver = checkForGameOver()
        if !gameOver {
            
            NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.setNotifyLabel), userInfo: self, repeats: false)
        }
    }
    
    func setNotifyLabel() {
        if timeCount > 1 {
            timeCount! -= 1
            notifyLbl.text = "\(timeCount)"
            setTimer()
        } else {
            notifyLbl.text = "Attack!!"
            game.canAttack = true
        }
        if checkForGameOver() {
            notifyLbl.text = msgLabel.text
            isGameOver()
        }
    }
    
    func checkForAttack(){
        if !checkForGameOver(){
            if game.canAttack {
                timeCount = TIMES
                setTimer()
            }
        }
    }
    
    func checkDead(){
        if !game.leftPlayer.isAlive {
            leftCharacter.hidden = true
        }
        
        if !game.rightPlayer.isAlive {
            rightCharacter.hidden = true
        }
    }
    
    func checkForGameOver() -> Bool{
        return game.gameOver
    }
    
    func isGameOver(){
        restartBtn.hidden = false
        restartLabel.hidden = false
    }
    
    
    //Beginning Selection Buttons
    @IBAction func leftSpartanTapped(sender: AnyObject) {
        leftOrcBtn.hidden = true
        leftPlayer = "Spartan"
        checkPlayersReady()
    }
    
    @IBAction func rightSpartanTapped(sender: AnyObject) {
        rightOrcBtn.hidden = true
        rightPlayer = "Spartan"
        checkPlayersReady()
    }
    
    @IBAction func leftOrcTapped(sender: AnyObject) {
        leftSpartanBtn.hidden = true
        leftPlayer = "Orc"
        checkPlayersReady()
    }
    
    @IBAction func rightOrcTapped(sender: AnyObject) {
        rightSpartanBtn.hidden = true
        rightPlayer = "Orc"
        checkPlayersReady()
        
    }
    
    func checkPlayersReady(){
        playerCount += 1
        if playerCount >= 2 {
            startGame()
        }
    }

    
}

