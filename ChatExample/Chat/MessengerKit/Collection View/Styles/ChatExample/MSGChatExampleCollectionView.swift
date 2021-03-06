//
//  MSGChatExampleCollectionView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGChatExampleCollectionView: MSGCollectionView {
    
    override open func registerCells() {
        super.registerCells()
        
        collectionViewLayout = MSGChatExampleCollectionViewFlowLayout()
        
        // Text
        
        register(UINib(nibName: "MSGOutgoingTailCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingText")
        register(UINib(nibName: "MSGIncomingTailCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingText")
        
        // Emoji
        
        register(UINib(nibName: "MSGOutgoingEmojiCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingEmoji")

        register(UINib(nibName: "MSGIncomingEmojiCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingEmoji")
        
        // Image
        
        register(UINib(nibName: "MSGOutgoingImageCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "outgoingImage")
        
        register(UINib(nibName: "MSGIncomingImageCollectionViewCell", bundle: MessengerKit.bundle),
                 forCellWithReuseIdentifier: "incomingImage")
        
        // Footers
        
        register(UINib(nibName: "MSGChatExampleOutgoingFooterView", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "outgoingFooter")
        register(UINib(nibName: "MSGChatExampleIncomingFooterView", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "incomingFooter")
        
        // Headers
        
        register(UINib(nibName: "MSGChatExampleOutgoingHeaderView", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "outgoingHeader")
        
        register(UINib(nibName: "MSGChatExampleIncomingHeaderView", bundle: MessengerKit.bundle),
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "incomingHeader")
    }

}
