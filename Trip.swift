//
//  Trip.swift
//  yapayme
//
//  Created by Rod Liberal on 11/15/16.
//  Copyright © 2016 Clenched Teeth. All rights reserved.
//

import Foundation

struct Trip {
    
    let key: String
    let creator: String
    let name: String
    let currency: String
    let ref: FIRDatabaseReference?
    var isClosed: Bool
    var createdAt: Double
    var travelers: [String: Bool]?
    var outings: [String: Bool]?
    
    init(creator: String, name: String, currency: String, isClosed: Bool, createdAt: Double,
         travelers: [String: Bool], outings: [String: Bool], key: String = "") {
        self.key = key
        self.creator = creator
        self.name = name
        self.currency = currency
        self.isClosed = isClosed
        self.createdAt = createdAt
        self.travelers = travelers
        self.outings = outings
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        creator = snapshotValue["creator"] as! String
        name = snapshotValue["name"] as! String
        currency = snapshotValue["currency"] as! String
        isClosed = snapshotValue["isClosed"] as! Bool
        createdAt = snapshotValue["createdAt"] as! Double
        travelers = snapshotValue["travelers"] as? [String: Bool]
        outings = snapshotValue["outings"] as? [String: Bool]
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "creator": creator,
            "name": name,
            "currency": currency,
            "isClosed": isClosed,
            "createdAt": createdAt,
            "travelers": travelers ?? [:],
            "outings": outings ?? [:]
        ]
    }
    
    func toAnyTravelerTripObject() -> Any {
        return [
            self.key: true
        ]
    }
}

struct UserTrip {
    let key: String
    let name: String
    let ref: FIRDatabaseReference?
}
