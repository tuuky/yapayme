//
//  TripServiceMock.swift
//  yapayme
//
//  Created by Rod Liberal on 1/27/17.
//  Copyright © 2017 Clenched Teeth. All rights reserved.
//

import Foundation

class TripService: ITrip {
    func GetTripList(completionBlock: @escaping ((Array<Trip>) -> Void)) {
        
        var trips = [Trip] ()
        
        let createdAt = Date().timeIntervalSince1970 * 1000
        
        let trip1: Trip = Trip(name: "Cancun Mock", currency: "USD", isClosed: false, creator: "9eQCgBqI8DTiCCx1RDFZQfpVlW93", createdAt: createdAt)
        let trip2: Trip = Trip(name: "Florida Mock", currency: "USD", isClosed: false)
        let trip3: Trip = Trip(name: "Paris Mock", currency: "EUR", isClosed: false)
        let trip4: Trip = Trip(name: "Germany Mock", currency: "EUR", isClosed: false)
        
        trips.append(trip1)
        trips.append(trip2)
        trips.append(trip3)
        trips.append(trip4)
        
        completionBlock(trips)
    }
    
    func CreateNewTrip(trip: Trip) {
                
    }
}
