//
//  UITextField.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/16/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import UIKit
import ObjectiveC

private var AssociatedObjectHandle: UInt8 = 12


extension UITextField {
    
    var doneCallback:(()->())? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectHandle) as? (()->())
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectHandle, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addDoneToolbar(doneHasBeenTapped: @escaping (()->())) {
        let toolbar = UIToolbar.init()
        self.inputAccessoryView = toolbar
        self.doneCallback = doneHasBeenTapped
        toolbar.sizeToFit()
        toolbar.items = [UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),UIBarButtonItem.init(title: "OK", style: .plain, target: self, action: #selector(done))]
    }
    
    @objc func done() {
        if let c = self.doneCallback {
            c()
        }
        self.resignFirstResponder()
    }
    
}

