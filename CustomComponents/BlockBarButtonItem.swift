//
//  BlockBarButtonItem.swift
//  Copyright Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)

import UIKit

public typealias BlockAction = (()->Void)
public class BlockBarButtonItem: UIBarButtonItem {
    private var actionHandler: BlockAction?
    
    public convenience init(title: String?, style: UIBarButtonItem.Style, actionHandler: BlockAction?) {
        self.init(title: title, style: style, target: nil, action: #selector(barButtonItemPressed))
        self.target = self
        self.actionHandler = actionHandler
    }
    
    public convenience init(image: UIImage?, style: UIBarButtonItem.Style, actionHandler: BlockAction?) {
        self.init(image: image, style: style, target: nil, action: #selector(barButtonItemPressed))
        self.target = self
        self.actionHandler = actionHandler
    }
    
    @objc func barButtonItemPressed(sender: UIBarButtonItem) {
        actionHandler?()
    }
}
