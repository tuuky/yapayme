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
    let name: String
//    let travelerList: Dictionary<Traveler, Any>
//    let expenseList: Array<Any>
//    let beginDate: Date?
//    let endDate: Date?
    let currency: String
    let ref: FIRDatabaseReference?
    var isClosed: Bool
    
    init(name: String, currency: String, isClosed: Bool, key: String = "") {
        self.key = key
        self.name = name
//        self.travelerList = travelerList
//        self.expenseList = expenseList
//        self.beginDate = beginDate
//        self.endDate = endDate
        self.currency = currency
        self.isClosed = isClosed
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
//        travelerList = snapshotValue["travelerList"].value as! [Array: AnyObject]
//        expenseList = snapshotValue["expenseList"].value as! [Array: AnyObject]
//        beginDate = snapshotValue["beginDate"] as? Date
//        endDate = snapshotValue["endDate"] as? Date
        currency = snapshotValue["currency"] as! String
        isClosed = snapshotValue["isClosed"] as! Bool
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return [
            "name": name,
            "currency": currency,
            "isClosed": isClosed
        ]
    }
    
}
