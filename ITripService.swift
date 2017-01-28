//
//  ITripService.swift
//  yapayme
//
//  Created by Rod Liberal on 1/27/17.
//  Copyright © 2017 Clenched Teeth. All rights reserved.
//

import Foundation

protocol ITrip {
    
    func GetTripList(completionBlock: @escaping ((Array<Trip>) -> Void) )
    func CreateNewTrip(trip: Trip) -> Void
    
}
