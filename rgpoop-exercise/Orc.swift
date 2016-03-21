//
//  Orc.swift
//  rgpoop-exercise
//
//  Created by Bruce Burgess on 3/21/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import Foundation


class Orc: Character {
    
    private var _massiveAtk = 30
    
    override var attackPwr: Int {
        get {
            return _massiveAtk
        }
    }
    
}