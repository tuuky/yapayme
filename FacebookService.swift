//
//  FacebookService.swift
//  yapayme
//
//  Created by Rod Liberal on 1/28/17.
//  Copyright © 2017 Clenched Teeth. All rights reserved.
//

import Foundation
import FBSDKCoreKit

class FacebookService: IFacebook {
    
    func GetFriendsWithAppList() -> Void {
        
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "/me/friends", parameters: ["fields": "id, name, first_name, last_name, email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    
                    
                    if let result = result as? NSDictionary {
                        if let friends = result.object(forKey: "data") as? NSDictionary {
                        
                            for friend in friends {
                                print(friend)
                            }
                        }
                    }
                }
            })
        }
        
//        let request = FBSDKGraphRequest(graphPath: "/me/friends", parameters: ["fields": "name"], httpMethod: "GET")
//        
//        
//        request?.start(completionHandler: { (FBSDKGraphRequestConnection, result, error) in
//            // TODO: handle results or error of request.
//            print("request friend list:\(result)")
//            if (error != nil)
//            {
//                print(error!)
//            }
//            else
//            {
//                if let result = result as? NSDictionary {
//                    for friend in result {
//                        print(friend)
//                    }
//                }
//                
//            }
//        })
        
        
    }
}
