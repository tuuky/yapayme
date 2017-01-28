//
//  TripsTableViewController.swift
//  yapayme
//
//  Created by Rod Liberal on 11/15/16.
//  Copyright © 2016 Clenched Teeth. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKShareKit

class TripsTableViewController: UITableViewController, FBSDKAppInviteDialogDelegate {

    
    // MARK: Properties
    var _items: [Trip] = []
    let _tripService = TripService()
    
    @IBAction func InviteFBFriends(_ sender: UIBarButtonItem) {
        let content = FBSDKAppInviteContent()
        content.appLinkURL = NSURL(string: "https://fb.me/1367204319999018") as URL!
        FBSDKAppInviteDialog.show(from: self, with: content, delegate: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        _tripService.GetTripList { (trips) in
            self._items = trips
            self.tableView.reloadData()
        }
    }
    
    func appInviteDialog(_ appInviteDialog: FBSDKAppInviteDialog!, didCompleteWithResults results: [AnyHashable : Any]!) {
        
    }
    
    func appInviteDialog(_ appInviteDialog: FBSDKAppInviteDialog!, didFailWithError error: Error!) {
        print(error)
        
    }
    
    
    @IBAction func LogoutFacebook(_ sender: UIBarButtonItem) {
        
        try! FIRAuth.auth()?.signOut()
        FBSDKAccessToken.setCurrent(nil)
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginView")
        self.present(viewController, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return _items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath)
        let trip = _items[indexPath.row]
        
        cell.textLabel?.text = trip.name

        return cell
    }
    
    @IBAction func addButtonDidTouch(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Trip",
                                      message: "Add a trip",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) { action in
                                        // 1
                                        alert.textFields?.first?.autocapitalizationType = UITextAutocapitalizationType.allCharacters
                                        
                                        guard let textField = alert.textFields?.first,
                                            let text = textField.text
                                            else { return }
                                        
                                        
                                        // 2
                                        
                                        let tripItem = Trip(name: text, currency: "USD", isClosed: false)
//                                      
                                        self._tripService.CreateNewTrip(trip: tripItem)
                                        
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        alert.addTextField()
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }

}
