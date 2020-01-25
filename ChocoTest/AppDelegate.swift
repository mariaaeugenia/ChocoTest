//
//  AppDelegate.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 19/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setup()
        
        if UserDefaults.standard.value(forKey: "token") == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
                 self.window?.rootViewController = loginVC
            }
        }
        
        return true
    }

    func setup() {
        //KEYBOARD
        IQKeyboardManager.shared.enable = true
        
        //REALM
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { _, _ in })
        Realm.Configuration.defaultConfiguration = config
    }
}

