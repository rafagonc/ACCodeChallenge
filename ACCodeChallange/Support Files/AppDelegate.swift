//
//  AppDelegate.swift
//  ACCodeChallange
//
//  Created by Rafael Gonzalves on 1/15/19.
//  Copyright © 2019 Rafael Gonzalves. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = MovieListViewController()
        let window = UIWindow.init()
        window.rootViewController = UINavigationController.init(rootViewController: rootViewController)
        window.backgroundColor = UIColor.white
        self.window = window
        self.window?.makeKeyAndVisible()
        
        let mr = MovieRepository()
        mr.listUpcomingMovies(page: 1, success: { (movies) in
            print(movies)
        }) { (error) in
            
        }
        
        return true
    }

}

