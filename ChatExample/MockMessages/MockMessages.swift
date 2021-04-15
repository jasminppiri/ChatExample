//
//  ChatList.swift
//  ChatExample
//
//  Created by Jasmin Patel on 16/04/21.
//

import Foundation
import UIKit

struct User: MSGUser {
    
    var displayName: String
    var avatar: UIImage?
    var avatarUrl: URL?
    var isSender: Bool
    var isAdmin: Bool = false
    
    static let steve = User(displayName: "Steve Smith", avatar: #imageLiteral(resourceName: "timi"), avatarUrl: nil, isSender: true)
    static let maciej = User(displayName: "Maciej Kowalski", avatar: #imageLiteral(resourceName: "1"), avatarUrl: nil, isSender: false)
    static let odeusz = User(displayName: "Odeusz Piotrowski", avatar: #imageLiteral(resourceName: "7"), avatarUrl: nil, isSender: false, isAdmin: true)
    static let bozenka = User(displayName: "Bozenka Johnson", avatar: #imageLiteral(resourceName: "5"), avatarUrl: nil, isSender: false)
    static let martina = User(displayName: "Martina Brown", avatar: #imageLiteral(resourceName: "3"), avatarUrl: nil, isSender: false)
    static let krysia = User(displayName: "Krysia Garcia", avatar: #imageLiteral(resourceName: "8"), avatarUrl: nil, isSender: false)
    static let jaroslaw = User(displayName: "Jaroslaw Kowalski", avatar: #imageLiteral(resourceName: "4"), avatarUrl: nil, isSender: false)
    static let william = User(displayName: "William Miller", avatar: #imageLiteral(resourceName: "6"), avatarUrl: nil, isSender: false)

}

struct ChatList {
    
    var users: [User]
    var isGroup: Bool
    var groupName: String
    var messages: [[MSGMessage]]
    
    static let groupMockMessages = [
        [
            MSGMessage(id: 1, body: .emoji("🐙💦🔫"), user: User.maciej, sentAt: Date()),
        ],
        [
            MSGMessage(id: 2, body: .text("Yeah sure, gimme 5"), user: User.bozenka, sentAt: Date()),
            MSGMessage(id: 3, body: .text("Okay ready when you are"), user: User.bozenka, sentAt: Date())
        ],
        [
            MSGMessage(id: 4, body: .text("Awesome 😁"), user: User.krysia, sentAt: Date()),
        ],
        [
            MSGMessage(id: 5, body: .text("Ugh, gotta sit through these two…"), user: User.steve, sentAt: Date()),
            MSGMessage(id: 6, body: .image(#imageLiteral(resourceName: "Splatoon")), user: User.steve, sentAt: Date()),
        ],
        [
            MSGMessage(id: 8, body: .emoji("🙄😭"), user: User.odeusz, sentAt: Date()),
            MSGMessage(id: 9, body: .imageFromUrl(URL(string: "https://placeimg.com/640/480/any")!), user: User.odeusz, sentAt: Date()
            )
        ],
        [
            MSGMessage(id: 7, body: .text("Every. Single. Time."), user: User.william, sentAt: Date()),
        ]
    ]
    
    static let mockMessages = [
        [
            MSGMessage(id: 1, body: .emoji("🐙💦🔫"), user: User.maciej, sentAt: Date()),
        ],
        [
            MSGMessage(id: 2, body: .text("Yeah sure, gimme 5"), user: User.steve, sentAt: Date()),
            MSGMessage(id: 3, body: .text("Okay ready when you are"), user: User.steve, sentAt: Date())
        ],
        [
            MSGMessage(id: 4, body: .text("Awesome 😁"), user: User.maciej, sentAt: Date()),
        ],
        [
            MSGMessage(id: 5, body: .text("Ugh, gotta sit through these two…"), user: User.steve, sentAt: Date()),
            MSGMessage(id: 6, body: .image(#imageLiteral(resourceName: "Splatoon")), user: User.steve, sentAt: Date()),
        ],
        [
            MSGMessage(id: 8, body: .emoji("🙄😭"), user: User.steve, sentAt: Date()),
            MSGMessage(id: 9, body: .imageFromUrl(URL(string: "https://placeimg.com/640/480/any")!), user: User.steve, sentAt: Date()
            )
        ],
        [
            MSGMessage(id: 7, body: .text("Every. Single. Time."), user: User.maciej, sentAt: Date()),
        ]
    ]
    
    static let data: [ChatList] = [
        ChatList(users: [User.maciej],
                 isGroup: false,
                 groupName: "",
                 messages: mockMessages),
        ChatList(users: [User.bozenka],
                 isGroup: false,
                 groupName: "",
                 messages: mockMessages),
        ChatList(users: [User.martina, User.maciej, User.bozenka, User.odeusz, User.jaroslaw, User.krysia, User.william],
                 isGroup: true,
                 groupName: "WFH buddies",
                 messages: groupMockMessages),
        ChatList(users: [User.odeusz],
                 isGroup: false,
                 groupName: "",
                 messages: mockMessages),
        ChatList(users: [User.jaroslaw],
                 isGroup: false,
                 groupName: "",
                 messages: mockMessages),
        ChatList(users: [User.krysia],
                 isGroup: false,
                 groupName: "",
                 messages: mockMessages),
        ChatList(users: [User.william],
                 isGroup: false,
                 groupName: "",
                 messages: mockMessages)
    ]
    
}
