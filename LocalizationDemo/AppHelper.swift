//
//  AppHelper.swift
//  LocalizationDemo
//
//  Created by Krishna on 24/06/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import UIKit

class AppHelper: NSObject {

    static func getLocalizeString(str:String) -> String {
        let string = Bundle.main.path(forResource: UserDefaults.standard.string(forKey: "Language"), ofType: "lproj")
        let myBundle = Bundle(path: string!)
        return (myBundle?.localizedString(forKey: str, value: "", table: nil))!
    }
}
