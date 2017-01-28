//
//  Traveler.swift
//  yapayme
//
//  Created by Rod Liberal on 11/15/16.
//  Copyright © 2016 Clenched Teeth. All rights reserved.
//

import Foundation

struct Traveler {
    
    let key: String
    let name: String
    
    init(name: String, key: String = "") {
        self.key = key
        self.name = name
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name
        ]
    }

}
