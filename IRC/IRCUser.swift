//
//  IRCUser.swift
//  IRC
//
//  Created by Anthony Dejbox on 31/03/2020.
//  Copyright © 2020 Roundwall Software. All rights reserved.
//

import Foundation

public struct IRCUser {
    public let username: String
    public let realName: String
    public let nick: String
    
    public init(username: String, realName: String, nick: String) {
        self.username = username
        self.realName = realName
        self.nick = nick
    }
}
