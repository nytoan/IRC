//
//  IRCChannel.swift
//  IRC
//
//  Created by Anthony Dejbox on 31/03/2020.
//  Copyright © 2020 Roundwall Software. All rights reserved.
//

import Foundation

public class IRCChannel {
    public var delegate: IRCChannelDelegate? = nil {
        didSet {
            guard let delegate = delegate else {
                return
            }
            
            buffer.forEach { (line) in
                delegate.didRecieveMessage(self, message: line)
            }
            buffer = []
        }
    }
    public let name: String
    public let server: IRCServer
    private var buffer = [String]()
    
    public init(name: String, server: IRCServer) {
        self.name = name
        self.server = server
    }
    
    
    func receive(_ text: String) {
        if let delegate = self.delegate {
            delegate.didRecieveMessage(self, message: text)
        } else {
            buffer.append(text)
        }
    }
    
    public func send(_ text: String) {
        server.send("PRIVMSG #\(name) :\(text)")
    }
}
