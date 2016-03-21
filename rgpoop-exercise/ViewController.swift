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
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        startGame()

    }
    
    func startGame(){
    
        game = Game()
        
    }

    @IBAction func rightAttackTapped(sender: UIButton) {
        msgLabel.text = game.attacking("right")
    }

    @IBAction func leftAttackTapped(sender: UIButton) {
        msgLabel.text = game.attacking("left")
    }
}

