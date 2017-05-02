//
//  Ext.swift
//  SwizTest
//
//  Created by Andart on 02.05.17.
//  Copyright © 2017 Andart. All rights reserved.
//

import UIKit

func swizzleMethod(_ target: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
    let originalMethod = class_getInstanceMethod(target, originalSelector)
    let swizzledMethod = class_getInstanceMethod(target, swizzledSelector)
    
    let didAddMethod = class_addMethod(target, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
    
    if didAddMethod {
        class_replaceMethod(target, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}

extension UILabel {
    open override class func initialize() {
        guard self == UILabel.self else {
            return
        }
        
        struct Inner {
            static let i: () = {
                swizzleMethod(UILabel.self, originalSelector: #selector(setter: UILabel.text), swizzledSelector: #selector(UILabel.swizzledSetText))
                swizzleMethod(UILabel.self, originalSelector: #selector(UILabel.awakeFromNib), swizzledSelector: #selector(UILabel.swizzledAwakeFromNib))
            }()
        }
        let _ = Inner.i
    }
    
    func swizzledSetText(_ text: String) {
        let text = localize(text)
        
        swizzledSetText(text)
    }
    
    func swizzledAwakeFromNib() {
        swizzledAwakeFromNib()
        
        self.text = self.text!
    }
}
