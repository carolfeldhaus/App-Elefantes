//
//  AppDelegate.swift
//  Elefantes
//
//  Created by Caroline Feldhaus de Souza on 18/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ViewController() //UINavigationController(rootViewController: ViewController())
        self.window?.makeKeyAndVisible()
        
        return true
        
        
    
}

}
