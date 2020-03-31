//
//  IRCServerTests.swift
//  IRCTests
//
//  Created by Samuel Ryan Goodwin on 8/2/17.
//  Copyright © 2017 Roundwall Software. All rights reserved.
//

import XCTest
@testable import IRC

class IRCServerTests: XCTestCase {
    func testSendingAChannelMessage() {
        class MockServer: IRCServer {
            var sentMessage: String?
            
            override func send(_ message: String) {
                sentMessage = message
            }
        }
        
        let user = IRCUser(username: "sgoodwin", realName: "Samuel Goodwin", nick: "mukman")
        let server = MockServer.connect("127.0.0.1", port: 6667, user: user)
        
        let channel = server.join("clearlyafakechannel")
        channel.send("hey sup")
        
        XCTAssertEqual(server.sentMessage, "PRIVMSG #clearlyafakechannel :hey sup")
    }
}
