//
//  ReactiveButton.swift
//  Copyright Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import UIKit

let panDark = UIColor(red: 130/255.0, green: 70/255.0, blue: 175/255.0, alpha: 1.0)
let panLight = UIColor(red: 214/255.0, green: 191/255.0, blue: 221/255.0, alpha: 1.0)

@IBDesignable
public class ReactiveButton: UIButton {
    @IBInspectable
    public var enabledborderColor: UIColor = panDark
    @IBInspectable
    public var enabledTitleColor: UIColor = panLight
    @IBInspectable
    public var enabledBackgroundColor: UIColor = panDark
    @IBInspectable
    public var disabledborderColor: UIColor = .lightGray
    @IBInspectable
    public var disabledTitleColor: UIColor = panLight
    @IBInspectable
    public var disabledBackgroundColor: UIColor = .white
    override public var isEnabled:Bool {
        didSet {
            if self.isEnabled {
                self.layer.borderColor = enabledborderColor.cgColor
                backgroundColor = enabledBackgroundColor
                setTitleColor(enabledTitleColor, for: .normal)
            } else {
                self.layer.borderColor = disabledborderColor.cgColor
                backgroundColor = disabledBackgroundColor
                setTitleColor(disabledTitleColor, for: .normal)
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1.0
        absorbIsEnabled()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        absorbIsEnabled()
    }
    
    private func absorbIsEnabled() {
        if isEnabled {
            self.isEnabled = true
        } else {
            self.isEnabled = false
        }
    }
}
