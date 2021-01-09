//
//  AppDelegate.swift
//  ChintanGohelAssignment
//
//  Created by Chintan Gohel on 09/01/21.
//

import UIKit
import SSTwitterLogin

public struct TwitterKeys {
    static let KConsumerKey = "Sh4JYw4aQ773emLJTL9zlFFF2"
    static let KConsumerSecret = "KYZk6x2O0HO8e1ClUyqDDMjXOnYJhjwHBXrY4PJ6M7OFBxkE7z"
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        TwitterLoginHelper.sharedInstance.twitterStartwith(consumerKey: TwitterKeys.KConsumerKey, consumerSecret: TwitterKeys.KConsumerSecret)

        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return TwitterLoginHelper.sharedInstance.twitterConfigurationWithOptions(application,open: url, options:options)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

