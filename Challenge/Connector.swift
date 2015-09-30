//
//  Connector.swift
//  Challenge
//
//  Created by Anton Korshikov on 30.09.15.
//  Copyright © 2015 Anton Korshikov. All rights reserved.
//

import Foundation
import Starscream

private let _SingletonASharedInstance = NetClient();
//let serverUrl = "ws://localhost:56887/";
let serverUrl = "ws://echo.websocket.org";

class NetClient: NSObject, WebSocketDelegate {
    class var sharedInstance : NetClient {
        return _SingletonASharedInstance;
    }
    
    var socket = WebSocket(url: NSURL(string: serverUrl)!);
    
    var reconnectTimer = NSTimer();

    
    override init() {
        super.init();
    }
    
    
    func connect() {
        socket.delegate = self;
        socket.connect();
    }
    
    func reconnect() {
        self.socket.connect();
    }

    
    // MARK: Websocket Delegate Methods.
    
    func websocketDidConnect(ws: WebSocket) {
        print("websocket is connected");
        
        reconnectTimer.invalidate();
    }
    
    func websocketDidDisconnect(ws: WebSocket, error: NSError?) {
        if let e = error {
            print("websocket is disconnected: \(e.localizedDescription)");
        } else {
            print("websocket disconnected");
        }
        
        reconnectTimer = NSTimer.scheduledTimerWithTimeInterval(3, target:self, selector: Selector("reconnect"), userInfo: nil, repeats: true)
    }
    
    func websocketDidReceiveMessage(ws: WebSocket, text: String) {
        print("Received text: \(text)");
    }
    
    func websocketDidReceiveData(ws: WebSocket, data: NSData) {
        print("Received data: \(data.length)");
    }
    

    
}

