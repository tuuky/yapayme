//
//  IUserService.swift
//  yapayme
//
//  Created by Rod Liberal on 1/27/17.
//  Copyright © 2017 Clenched Teeth. All rights reserved.
//

import Foundation

protocol ITraveler {
    
    func GetTravelerList(completionBlock: @escaping ((Array<Traveler>) -> Void) )
}
