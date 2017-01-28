//
//  TravelerService.swift
//  yapayme
//
//  Created by Rod Liberal on 1/27/17.
//  Copyright © 2017 Clenched Teeth. All rights reserved.
//

import Foundation

class TravelerService: ITraveler {
    
    func GetUserList() -> Array<Traveler> {
        var travelers = [Traveler] ()
        
        let user1: Traveler = Traveler(key: "1", name: "Mark Moeykens")
        let user2: Traveler = Traveler(key: "2", name: "Chase Blumenthal")
        let user3: Traveler = Traveler(key: "3", name: "Chris Durtschi")
        let user4: Traveler = Traveler(key: "4", name: "Clint Barnes")
        
        travelers.append(user1)
        travelers.append(user2)
        travelers.append(user3)
        travelers.append(user4)
        
        return travelers
    }
}
