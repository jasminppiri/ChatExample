//
//  MSGChatExampleFooterView.swift
//  MessengerKit
//
//  Created by Stephen Radford on 12/06/2018.
//  Copyright © 2018 Cocoon Development Ltd. All rights reserved.
//

import UIKit

class MSGChatExampleFooterView: MSGSectionReusableView {
    
    @IBOutlet weak var label: UILabel!
    
    override var style: MSGMessengerStyle? {
        didSet {
            guard let style = style as? MSGChatExampleStyle else { return }
            
            label.font = style.footerFont
            label.textColor = style.footerTextColor
        }
    }
    
    override var title: String? {
        didSet {
            label.text = title
        }
    }
    
}
