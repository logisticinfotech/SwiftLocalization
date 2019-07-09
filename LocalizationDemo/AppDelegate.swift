//
//  AppDelegate.swift
//  LocalizationDemo
//
//  Created by Krishna on 19/06/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if UserDefaults.standard.object(forKey: "Language") != nil && UserDefaults.standard.object(forKey: "Language") as! String == "he"
        {
            UserDefaults.standard.set("he", forKey: "Language")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        else
        {
            UserDefaults.standard.set("en", forKey: "Language")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        return true
    }
}

