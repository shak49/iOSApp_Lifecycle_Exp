//
//  AppDelegate.swift
//  iOSApp_Lifecycle_Exp
//
//  Created by Shak Feizi on 7/6/22.
//

import UIKit
import Firebase
import FirebaseMessaging


@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        NotificationManager.shared.userNotCenter.delegate = self
        Messaging.messaging().delegate = self
        NotificationManager.shared.requestNotificationAuth()
        application.registerForRemoteNotifications()
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }

}

extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token { token, error in
            if let error = error {
                print("ERROR: \(error)")
            }
            guard let token = token else { return }
            print("<<< TOKEN: \(token) >>>")
        }
    }
}
