//
//  TripService.swift
//  yapayme
//
//  Created by Rod Liberal on 1/27/17.
//  Copyright © 2017 Clenched Teeth. All rights reserved.
//

import Foundation

class TripService: ITrip {
    
    let ref = FIRDatabase.database().reference(withPath: "trips")
    
    func GetTripList(completionBlock: @escaping ((Array<Trip>) -> Void)) {
        
        
        
        ref.queryOrdered(byChild: "name").observe(.value, with: { snapshot in
            var newItems: [Trip] = []
            
            for item in snapshot.children {
                let tripItem = Trip(snapshot: item as! FIRDataSnapshot)
                newItems.append(tripItem)
            }
            
            completionBlock(newItems)
        })
    }
    
    func CreateNewTrip(trip: Trip) {
        
        let tripItemRef = self.ref.child(trip.name.lowercased())
        
        tripItemRef.setValue(trip.toAnyObject())
        
    }
}

