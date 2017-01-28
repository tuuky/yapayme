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
        let ref = FIRDatabase.database().reference(withPath: "travelers")
        
        
        ref.queryOrdered(byChild: "name").observe(.value, with: { snapshot in
            var newItems: [Traveler] = []
            
            for item in snapshot.children {
                let tripItem = Traveler(snapshot: item as! FIRDataSnapshot)
                newItems.append(tripItem)
            }
            
            completionBlock(newItems)
        })
    }
}
