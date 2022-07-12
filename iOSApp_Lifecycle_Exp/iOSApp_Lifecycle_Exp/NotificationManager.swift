//
//  NotificationManager.swift
//  iOSApp_Lifecycle_Exp
//
//  Created by Shak Feizi on 7/9/22.
//

import UIKit
import UserNotifications


class NotificationManager {
    //MARK: - Properties
    static let shared = NotificationManager()
    let userNotCenter = UNUserNotificationCenter.current()
    
    //MARK: - Functions
    func requestNotificationAuth() {
        self.userNotCenter.requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] (granted, error) in
            if let error = error {
                print("Error: \(error)")
            } else if granted {
                print("PERMISSION GRANTED.")
            } else {
                print("PERMISSION DENIED.")
            }
        }
    }
    
    func launchNotification(date: Date?) {
        let content = UNMutableNotificationContent()
        content.title = "Here you are!"
        content.body = "This is a reminder which you set up. Take a look at the app"
        guard let date = date else { return }
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        userNotCenter.add(request) { error in
            
        }
    }
}
