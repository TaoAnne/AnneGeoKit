//
//  AppDelegate.swift
//  AnneGoeKitExample
//
//  Created by Littlefox iOS Developer on 2022/03/04.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = VC()
        self.window?.makeKeyAndVisible()
        
        return true
    }


}

