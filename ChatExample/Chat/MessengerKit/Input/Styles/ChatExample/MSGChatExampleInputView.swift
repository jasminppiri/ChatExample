//
//  MSGChatExampleInputView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 12/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

open class MSGChatExampleInputView: MSGInputView {
    
    override open class var nib: UINib? {
        return UINib(nibName: "MSGChatExampleInputView",
                     bundle: MessengerKit.bundle)
    }
    
    open override var tintColor: UIColor! {
        didSet {
            textView.tintColor = tintColor
            sendButton.tintColor = UIColor(red: 154/255, green: 158/255, blue: 165/255, alpha: 1.0)
            sendButton.backgroundColor = UIColor(red: 47/255, green: 54/255, blue: 68/255, alpha: 1.0)
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        textView.layer.cornerRadius = 10
        
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 40)
    }
    
}
