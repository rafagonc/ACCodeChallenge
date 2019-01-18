//
//  UIViewController.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/16/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showErrorAlert(title: String, message: String) {
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
        
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
