//
//  ChatListFavouriteTableViewCell.swift
//  ChatExample
//
//  Created by Jasmin Patel on 16/04/21.
//

import Foundation
import UIKit

class ChatListFavouriteTableViewCell: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
        
}
//MARK: UICollectionViewDataSource
extension ChatListFavouriteTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ChatList.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListFavouriteCollectionViewCell", for: indexPath) as! ChatListFavouriteCollectionViewCell
        cell.configureCell(data: ChatList.data[indexPath.row])
        return cell
    }
    
}
