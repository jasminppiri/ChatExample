//
//  ViewController.swift
//  ChatExample
//
//  Created by Jasmin Patel on 09/04/21.
//

import UIKit

class ChatViewController: MSGMessengerViewController {
    //MARK: Variables
    var id = 100
    var chatList: ChatList?
    var messages: [[MSGMessage]] = []
    
    //MARK: Messenger Style
    override var style: MSGMessengerStyle {
        return MessengerKit.Styles.chatExample
    }
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        messages = chatList?.messages ?? []
        super.viewDidLoad()
        dataSource = self
        delegate = self
        navigationController?.navigationBar.isHidden = true
    }
    
    func refresh() {
        messages = chatList?.messages ?? []
        collectionView.reloadData()
        if let view = self.view as? MSGMessengerView,
           let chatHeaderView = view.headerContainer.subviews.first(where: { return $0 is ChatHeaderView}) as? ChatHeaderView {
            chatHeaderView.collectionView.isHidden = !(chatList?.isGroup ?? false)
            chatHeaderView.headerView.isHidden = chatList?.isGroup ?? false
            chatHeaderView.senderNameLabel.text = User.steve.displayName
            chatHeaderView.receiverNameLabel.text = chatList?.users.first?.displayName
            chatHeaderView.senderImageView.image = User.steve.avatar
            chatHeaderView.receiverImageView.image = chatList?.users.first?.avatar
            chatHeaderView.users = chatList?.users ?? []
            chatHeaderView.onTap = {
                guard self.chatList?.isGroup ?? false else {
                    return
                }
                let groupDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "GroupDetailViewController") as! GroupDetailViewController
                groupDetailViewController.users = self.chatList?.users ?? []
                self.navigationController?.pushViewController(groupDetailViewController, animated: true)
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        guard let view = self.view as? MSGMessengerView else {
            return
        }
        let chatHeaderView = ChatHeaderView.instanceFromNib()
        chatHeaderView.collectionView.isHidden = !(chatList?.isGroup ?? false)
        chatHeaderView.headerView.isHidden = chatList?.isGroup ?? false
        chatHeaderView.senderNameLabel.text = User.steve.displayName
        chatHeaderView.receiverNameLabel.text = chatList?.users.first?.displayName
        chatHeaderView.senderImageView.image = User.steve.avatar
        chatHeaderView.receiverImageView.image = chatList?.users.first?.avatar
        chatHeaderView.users = chatList?.users ?? []
        chatHeaderView.onTap = {
            guard self.chatList?.isGroup ?? false else {
                return
            }
            let groupDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "GroupDetailViewController") as! GroupDetailViewController
            groupDetailViewController.users = self.chatList?.users ?? []
            self.navigationController?.pushViewController(groupDetailViewController, animated: true)
        }
        view.add(chatHeaderView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.scrollToBottom(animated: false)
    }    

}
//MARK: Send button click
extension ChatViewController {
    
    override func inputViewPrimaryActionTriggered(inputView: MSGInputView) {
        id += 1
        let body: MSGMessageBody = (inputView.message.containsOnlyEmoji && inputView.message.count < 5) ? .emoji(inputView.message) : .text(inputView.message)
        let message = MSGMessage(id: id, body: body, user: User.steve, sentAt: Date())
        insert(message)
    }
    
}
//MARK: Insert Message
extension ChatViewController {
    
    override func insert(_ message: MSGMessage) {
        collectionView.performBatchUpdates({
            if let lastSection = self.messages.last, let lastMessage = lastSection.last, lastMessage.user.displayName == message.user.displayName {
                self.messages[self.messages.count - 1].append(message)
                
                let sectionIndex = self.messages.count - 1
                let itemIndex = self.messages[sectionIndex].count - 1
                self.collectionView.insertItems(at: [IndexPath(item: itemIndex, section: sectionIndex)])
                
            } else {
                self.messages.append([message])
                let sectionIndex = self.messages.count - 1
                self.collectionView.insertSections([sectionIndex])
            }
        }, completion: { (_) in
            self.collectionView.scrollToBottom(animated: true)
            self.collectionView.layoutTypingLabelIfNeeded()
        })
        
    }
    
    override func insert(_ messages: [MSGMessage], callback: (() -> Void)? = nil) {
        collectionView.performBatchUpdates({
            for message in messages {
                if let lastSection = self.messages.last, let lastMessage = lastSection.last, lastMessage.user.displayName == message.user.displayName {
                    self.messages[self.messages.count - 1].append(message)
                    
                    let sectionIndex = self.messages.count - 1
                    let itemIndex = self.messages[sectionIndex].count - 1
                    self.collectionView.insertItems(at: [IndexPath(item: itemIndex, section: sectionIndex)])
                    
                } else {
                    self.messages.append([message])
                    let sectionIndex = self.messages.count - 1
                    self.collectionView.insertSections([sectionIndex])
                }
            }
        }, completion: { (_) in
            self.collectionView.scrollToBottom(animated: false)
            self.collectionView.layoutTypingLabelIfNeeded()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                callback?()
            }
        })
    }
    
}
//MARK: MSGDataSource
extension ChatViewController: MSGDataSource {
    
    func numberOfSections() -> Int {
        return messages.count
    }
    
    func numberOfMessages(in section: Int) -> Int {
        return messages[section].count
    }
    
    func message(for indexPath: IndexPath) -> MSGMessage {
        return messages[indexPath.section][indexPath.item]
    }
    
    func footerTitle(for section: Int) -> String? {
        return nil
    }
    
    func headerTitle(for section: Int) -> String? {
        return "1 Feb 12:00"
    }

}

//MARK: MSGDelegate
extension ChatViewController: MSGDelegate {
    
    func linkTapped(url: URL) {
        print("Link tapped:", url)
    }
    
    func avatarTapped(for user: MSGUser) {
        print("Avatar tapped:", user)
    }
    
    func tapReceived(for message: MSGMessage) {
        print("Tapped: ", message)
    }
    
    func longPressReceieved(for message: MSGMessage) {
        print("Long press:", message)
    }
    
    func shouldDisplaySafari(for url: URL) -> Bool {
        return true
    }
    
    func shouldOpen(url: URL) -> Bool {
        return true
    }
    
}

extension ChatViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
