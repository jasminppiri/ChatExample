//
//  MSGChatExampleStyle.swift
//  MessengerKit
//
//  Created by Stephen Radford on 10/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//
import UIKit

public struct MSGChatExampleStyle: MSGMessengerStyle {
    
    public var collectionView: MSGCollectionView.Type = MSGChatExampleCollectionView.self
    
    public var inputView: MSGInputView.Type = MSGChatExampleInputView.self
    
    public var headerHeight: CGFloat = 30
    
    public var footerHeight: CGFloat = 30
    
    public var backgroundColor: UIColor = UIColor(red: 36/255, green: 41/255, blue: 54/255, alpha: 1.0)
    
    public var inputViewBackgroundColor: UIColor = UIColor(red: 36/255, green: 41/255, blue: 54/255, alpha: 1.0)
    
    public var inputTextViewBackgroundColor : UIColor = UIColor(red: 28/255, green: 32/255, blue: 41/255, alpha: 1.0)
    
    public var font: UIFont = .preferredFont(forTextStyle: .body)
    
    public var inputFont: UIFont = .systemFont(ofSize: 14, weight: .semibold)
    
    public var inputTextColor: UIColor = .white
    
    public var inputPlaceholder: String = "Write"
    
    public var inputPlaceholderTextColor: UIColor = .lightGray
    
    public var outgoingTextColor: UIColor = .white
    
    public var incomingTextColor: UIColor = .white
    
    public var outgoingLinkColor: UIColor = .white
    
    public var incomingLinkColor: UIColor = .white

    public var outgoingLinkUnderlineStyle: NSNumber = 0

    public var incomingLinkUnderlineStyle: NSNumber = 0
    
    public func size(for message: MSGMessage, in collectionView: UICollectionView) -> CGSize {
        
        var size: CGSize!
        
        switch message.body {
        case .text(let body):
            
            let bubble = MSGTailOutgoingBubble()
            bubble.text = body
            bubble.font = font
            let bubbleSize = bubble.calculatedSize(in: CGSize(width: collectionView.bounds.width, height: .infinity))
            size = CGSize(width: collectionView.bounds.width, height: bubbleSize.height)
            
            break
            
        case .emoji:
            
            size = CGSize(width: collectionView.bounds.width, height: 60)
            
            break
            
        default:
            
            size = CGSize(width: collectionView.bounds.width, height: 175)
            
            break
        }
        
        return size
        
    }
    
    
    // MARK: - Custom Properties
    
    /// The color of the bubble when its outgoing
    public var outgoingBubbleColor: UIColor = UIColor(red: 35/255, green: 37/255, blue: 46/255, alpha: 1.0)
    
    /// The color of the bubble when its incoming
    public var incomingBubbleColor: UIColor = UIColor(red: 47/255, green: 54/255, blue: 68/255, alpha: 1.0)
    
    /// If set to true then tails will be displayed on every cell
    /// and not use the final cell in the section.
    public var alwaysDisplayTails: Bool = false
    
    /// The font used by header views
    public var headerFont: UIFont = UIFont.systemFont(ofSize: 14)
    
    /// The text color used by header views
    public var headerTextColor: UIColor = .white
    
    /// The font used by footer views
    public var footerFont: UIFont = UIFont.systemFont(ofSize: 10)
    
    /// The text color used by footer views
    public var footerTextColor: UIColor = UIColor(hue:0.67, saturation:0.03, brightness:0.58, alpha:1.00)
    
}
