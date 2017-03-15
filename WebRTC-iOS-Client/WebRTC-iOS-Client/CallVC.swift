//
//  DialingVC.swift
//  WebRTC-iOS-Client
//
//  Created by Innovation on 3/8/17.
//  Copyright © 2017 Innovation. All rights reserved.
//

import UIKit
import WebRTC

class CallVC: UIViewController, ARDAppClientDelegate {
    
    var client:ARDAppClient?
    
    @IBOutlet weak var userIdField: UILabel!
    @IBOutlet weak var connectionStatusLabel: UILabel!
    
    @IBOutlet weak var matchedRoomId: UILabel!
    
    var localVideoTrack:RTCVideoTrack?;
    var remoteVideoTrack:RTCVideoTrack?;
    
    var roomId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.client = ARDAppClient(delegate: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let room = roomId{
            self.disconnect()
            joinRoom(room)
        }else{
            userIdField.text = AppDelegate.userId
            scheduleMatchRequest(0)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.disconnect()
    }
    
    func joinRoom(_ roomId: String){
        connectionStatusLabel.text = "Connected"
        matchedRoomId.text = roomId
        
        self.client?.connectToRoom(withId: roomId, isLoopback: false, isAudioOnly: false, shouldMakeAecDump: false, shouldUseLevelControl: false)
    }
    
    func scheduleMatchRequest(_ waitTime: TimeInterval){
        connectionStatusLabel.text = "Calling"
        print("Calling again")
        DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) {
            let url = "\(Config.endPoint)/match/\(AppDelegate.gender!)/\(AppDelegate.userId!)"
            HTTPRequest.get(url, success: { (response) in
                if let matched = response?["matched"] as? NSNumber{
                    if matched == 1 {
                        let roomId = response!["roomId"] as! String
                        self.matchedRoomId.text = roomId
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


// MARK: WebRTC Implementation
extension CallVC{
    
    func disconnect(){
        connectionStatusLabel.text = "Disconnected"
        roomId = nil
        if let _ = self.client{
            self.client?.disconnect()
        }
    }
    
    func appClient(_ client: ARDAppClient!, didChange state: ARDAppClientState) {
        switch (state) {
        case .connected:
            print("Client connected.");
        case .connecting:
            print("Client connecting.");
        case .disconnected:
            print("Client disconnected.");
        }
    }
    
    func appClient(_ client: ARDAppClient!, didChange state: RTCIceConnectionState) {
        /*
        switch (state) {
        case .connected:
            print("ICE connected.");
        case .disconnected:
            print("ICE disconnected.");
        default:
            print("No op for other status")
            // No op
        }*/
    }
    
    public func appClient(_ client: ARDAppClient!, didError error: Error!) {
        AppDelegate.showAlert("Error", message: error.localizedDescription, context: self)
        self.disconnect()
    }
    
    func appClient(_ client: ARDAppClient!, didReceiveLocalVideoTrack localVideoTrack: RTCVideoTrack!) {
        self.localVideoTrack=localVideoTrack
    }
    
    func appClient(_ client: ARDAppClient!, didReceiveRemoteVideoTrack remoteVideoTrack: RTCVideoTrack!) {
        self.remoteVideoTrack=remoteVideoTrack
    }
    func appclient(_ client: ARDAppClient!, didRotateWithLocal localVideoTrack: RTCVideoTrack!, remoteVideoTrack: RTCVideoTrack!) {
    }
    func appClient(_ client: ARDAppClient!, didGetStats stats: [Any]!) {
    }
    
}
