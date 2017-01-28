//
//  TravelerService.swift
//  yapayme
//
//  Created by Rod Liberal on 1/27/17.
//  Copyright © 2017 Clenched Teeth. All rights reserved.
//

import Foundation

class TravelerService: ITraveler {
    
    func GetTravelerList(completionBlock: @escaping ((Array<Traveler>) -> Void)) {
        var travelers = [Traveler] ()
        
        let user1: Traveler = Traveler(name: "Mark Moeykens", key: "1")
        let user2: Traveler = Traveler(name: "Chase Blumenthal", key: "2")
        let user3: Traveler = Traveler(name: "Chris Durtschi", key: "3")
        let user4: Traveler = Traveler(name: "Clint Barnes", key: "4")
        
        travelers.append(user1)
        travelers.append(user2)
        travelers.append(user3)
        travelers.append(user4)
        
        completionBlock(travelers)
    }
}
