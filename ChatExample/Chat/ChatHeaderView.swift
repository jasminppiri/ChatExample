//
//  ChatGroupListView.swift
//  ChatExample
//
//  Created by Jasmin Patel on 10/04/21.
//

import UIKit

class ChatHeaderView: UIView {

    //MARK: Initialize instance
    class func instanceFromNib() -> ChatHeaderView {
        return UINib(nibName: "ChatHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ChatHeaderView
    }
    
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var senderImageView: UIImageView!
    @IBOutlet weak var receiverNameLabel: UILabel!
    @IBOutlet weak var receiverImageView: UIImageView!
    
    //MARK: Variables
    var onTap: (() -> ())?
    var users: [User] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "UpChatGroupListCollectionViewCell", bundle: MessengerKit.bundle),
                     forCellWithReuseIdentifier: "UpChatGroupListCollectionViewCell")
        collectionView.register(UINib(nibName: "DownChatGroupListCollectionViewCell", bundle: MessengerKit.bundle),
                     forCellWithReuseIdentifier: "DownChatGroupListCollectionViewCell")
    }
    
}
//MARK: IBActions
extension ChatHeaderView {
    
    @IBAction func onTap(_ sender: UIButton) {
        onTap?()
    }
    
}
//MARK: UICollectionViewDataSource
extension ChatHeaderView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpChatGroupListCollectionViewCell", for: indexPath) as! ChatGroupListCollectionViewCell
            cell.configureCell(user: users[indexPath.row])
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DownChatGroupListCollectionViewCell", for: indexPath) as! ChatGroupListCollectionViewCell
        cell.configureCell(user: users[indexPath.row])
        return cell
    }
    
}
