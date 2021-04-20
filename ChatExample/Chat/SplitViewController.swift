//
//  SplitViewController.swift
//  ChatExample
//
//  Created by Jasmin Patel on 21/04/21.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    override func viewDidLoad() {
        self.delegate = self
        let master = UINavigationController()
        let detail = UINavigationController()
        master.viewControllers = [self.storyboard?.instantiateViewController(withIdentifier: "ChatListViewController") as! ChatListViewController]
        let chatViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        chatViewController.chatList = ChatList.data[0]
        detail.viewControllers = [chatViewController]
        self.viewControllers = [self.storyboard?.instantiateViewController(withIdentifier: "ChatListViewController") as! ChatListViewController, detail]
        NotificationCenter.default.addObserver(self, selector: #selector(refreshDetail(_:)), name: Notification.Name("RefreshDetail"), object: nil)
    }
    
    @objc func refreshDetail(_ notification: Notification) {
        guard let index = notification.userInfo?["index"] as? Int else {
            return
        }
        if let chatViewController = (self.viewControllers.last as? UINavigationController)?.viewControllers.first(where: { return $0 is ChatViewController }) as? ChatViewController {
            chatViewController.chatList = ChatList.data[index]
            chatViewController.refresh()
        }
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        return true
    }
}
