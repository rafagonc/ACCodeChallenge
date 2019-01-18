//
//  UISearchBar.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/16/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import UIKit

extension UISearchBar {
    
    func addDoneToolbar(doneHasBeenTapped: @escaping (()->())) {
        if let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField {
            textFieldInsideSearchBar.addDoneToolbar(doneHasBeenTapped: doneHasBeenTapped)
            
        }
        
    }
    
}
