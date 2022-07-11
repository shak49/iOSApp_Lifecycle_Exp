//
//  FirstViewController.swift
//  iOSApp_Lifecycle_Exp
//
//  Created by Shak Feizi on 7/6/22.
//

import UIKit

class FirstViewController: UIViewController {
    //MARK: - Properties
    private let backView = UIView()
    private let _switch = UISwitch()
    private let datePicker = UIDatePicker()
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.isEnabled = false
        //notManager.requestNotificationAuth()
        setupUIElements()
    }
    
    //MARK: - Actions
    
    //MARK: - Functions
    func setupUIElements() {
        backView.frame = CGRect(x: 20, y: 100, width: 350, height: 350)
        backView.layer.cornerRadius = CGFloat(25.0)
        backView.backgroundColor = .tintColor
        _switch.frame = CGRect(x: 170, y: 150, width: 0, height: 0)
        _switch.addTarget(self, action: #selector(switchAction(_:)), for: .valueChanged)
        datePicker.frame = CGRect(x: 30, y: 200, width: 200, height: 200)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(datePickerAction(_:)), for: .valueChanged)
        view.addSubview(backView)
        view.addSubview(_switch)
        view.addSubview(datePicker)
    }
    
    @objc func switchAction(_ sender: UISwitch!) {
        if sender.isOn == true {
            datePicker.isEnabled = true
            print("Switch: ON")
        } else {
            datePicker.isEnabled = false
            print("Switch: OFF")
        }
    }
                             
    @objc func datePickerAction(_ sender: UIDatePicker!) {
        NotificationManager.shared.launchNotification(date: sender.date)
    }
}
