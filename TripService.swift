//
//  TripService.swift
//  yapayme
//
//  Created by Rod Liberal on 1/27/17.
//  Copyright © 2017 Clenched Teeth. All rights reserved.
//

import Foundation

class TripService: ITrip {
    
    let ref = FIRDatabase.database().reference()
    
    func GetTripList(completionBlock: @escaping ((Array<Trip>) -> Void)) {
        
        let travelersRef = ref.child("travelers")
        let travelerTripsRef = travelersRef.child((FIRAuth.auth()?.currentUser?.uid)!).child("trips")
        let tripsRef = ref.child("trips")
        
//        travelersRef.observe(.value, with: { snapshot in
//            for item in snapshot.children {
//                print("traveler:\(item)")
//            }
//        })
        
        var trips: [Trip] = []
        
        travelerTripsRef.observe(.value, with: { snapshot in
            for item in snapshot.children {
                let itemSnap = item as! FIRDataSnapshot
                let tripRef = tripsRef.child(itemSnap.key)
                

                //tripsRef.queryOrdered(byChild: <#T##String#>)
                //let tripDetailRef = tripRef.child(itemSnap.key).child("name")

                
//                tripDetailRef.observe(.value, with: { (snap) in
//                    
//                    if (snap.value != nil)
//                    {
//                        print(snap.value as! String)
//                    }
//                })
                
            }
        })
        
        
        
//        ref.queryOrdered(byChild: "name").observe(.value, with: { snapshot in
//            var newItems: [Trip] = []
//            
//            for item in snapshot.children {
//                let tripItem = Trip(snapshot: item as! FIRDataSnapshot)
//                newItems.append(tripItem)
//            }
//            
//            completionBlock(newItems)
//        })
    }
    
    func CreateNewTrip(trip: Trip) {
        FIRDatabase.setLoggingEnabled(true)
        
        //create trips record
        let tripsRef = self.ref.child("trips")
        let tripItemRef = tripsRef.childByAutoId()
        print(trip)
        
        tripItemRef.setValue(trip.toAnyObject())
        
        //create traveler record
        let travelersRef = self.ref.child("travelers")
        let travelerTripsRef = travelersRef.child((FIRAuth.auth()?.currentUser?.uid)!).child("trips")
        travelerTripsRef.setValue([tripItemRef.key: true])
    }
}

