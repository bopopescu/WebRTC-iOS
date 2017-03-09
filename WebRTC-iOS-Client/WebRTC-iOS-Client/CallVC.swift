//
//  DialingVC.swift
//  WebRTC-iOS-Client
//
//  Created by Innovation on 3/8/17.
//  Copyright © 2017 Innovation. All rights reserved.
//

import UIKit

class CallVC: UIViewController {
    
    @IBOutlet weak var userIdField: UILabel!
    @IBOutlet weak var connectionStatusLabel: UILabel!
    
    @IBOutlet weak var matchedRoomId: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        userIdField.text = AppDelegate.userId
        scheduleMatchRequest(0)
    }
    
    func joinRoom(_ roomId: String){
        connectionStatusLabel.text = "Connected"
        matchedRoomId.text = roomId
        
    }
    
    func scheduleMatchRequest(_ waitTime: TimeInterval){
        connectionStatusLabel.text = "Calling"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
            let url = "\(Config.endPoint)/match/\(AppDelegate.gender!)/\(AppDelegate.userId!)"
            HTTPRequest.get(url, success: { (response) in
                if let matched = response?["matched"] as? NSNumber{
                    if matched == 1 {
                        let roomId = response!["roomId"] as! String
                        self.joinRoom(roomId)
                    }else{
                        self.scheduleMatchRequest(Config.matchTimeInterval)
                    }
                }else{
                    AppDelegate.showAlert("Error", message: "Invalid message received", context: self)
                }
            }) { (err) in
                AppDelegate.showAlert("Error", message: "\(err._code):\(err._domain)", context: self)
            }
        }
    }
}
