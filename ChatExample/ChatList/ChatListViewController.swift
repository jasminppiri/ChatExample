//
//  ChatListViewController.swift
//  ChatExample
//
//  Created by Jasmin Patel on 09/04/21.
//

import UIKit

class ChatListViewController: UIViewController {
    //MARK: IBOutlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userImageView: DesignableImageView!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = User.steve.displayName
        userImageView.image = User.steve.avatar
        navigationController?.navigationBar.isHidden = true
    }

}
//MARK: UITableViewDataSource
extension ChatListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChatList.data.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListFavouriteTableViewCell", for: indexPath) as! ChatListFavouriteTableViewCell
            return cell
        }
        let chatList = ChatList.data[indexPath.row - 1]
        if chatList.isGroup {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupChatListTableViewCell", for: indexPath) as! ChatListTableViewCell
            cell.configureCell(data: chatList)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListTableViewCell", for: indexPath) as! ChatListTableViewCell
        cell.configureCell(data: chatList)
        return cell
    }
    
}
//MARK: UITableViewDelegate
extension ChatListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row > 0 else {
            return
        }
        guard UIDevice.current.userInterfaceIdiom != .pad else {
            NotificationCenter.default.post(name: Notification.Name("RefreshDetail"), object: nil, userInfo: ["index" : (indexPath.row - 1)])
            return
        }
        let chatViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        chatViewController.chatList = ChatList.data[indexPath.row - 1]
        self.navigationController?.pushViewController(chatViewController, animated: true)
    }
    
}
