//
//  ViewController.swift
//  rgpoop-exercise
//
//  Created by Bruce Burgess on 3/21/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var leftCharacter: UIImageView!
    @IBOutlet weak var rightCharacter: UIImageView!
    @IBOutlet weak var leftAttackBtn: UIButton!
    @IBOutlet weak var rightAttackBtn: UIButton!    
    @IBOutlet weak var notifyLbl: UILabel!
    
    @IBOutlet weak var restartLabel: UILabel!
    @IBOutlet weak var restartBtn: UIButton!
    var game: Game!
    
    let TIMES = 3
    
    var timeCount: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        startGame()

    }
    
    func startGame(){
        restartBtn.hidden = true
        restartLabel.hidden = true
        
        /*
        rightCharacter.image = UIImage(named: "enemy")
        rightCharacter.transform = CGAffineTransformMakeScale(-1, 1)*/
        
        leftCharacter.hidden = false
        rightCharacter.hidden = false
        
        timeCount = TIMES
        notifyLbl.text = "\(timeCount)"
        game = Game()
        setTimer()
        
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
        startGame()
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
}

