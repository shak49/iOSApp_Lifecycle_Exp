//
//  FirstViewController.swift
//  iOSApp_Lifecycle_Exp
//
//  Created by Shak Feizi on 7/6/22.
//

import UIKit

class FirstViewController: UIViewController {
    //MARK: - Properties
    private let label = UILabel()
    private let backView = UIView()
    private let _switch = UISwitch()
    private let _switchTwo = UISwitch()
    private let datePicker = UIDatePicker()
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.isEnabled = false
        view.backgroundColor = .white
        setupUIElements()
    }
    
    //MARK: - Actions
    
    //MARK: - Functions
    func setupUIElements() {
        setupLabels()
        setupBackView()
        setupSwitches()
        setupDatepicker()
    }
    
    func setupLabels() {
        label.frame = CGRect(x: 130, y: 75, width: 150, height: 50)
        label.text = "iOS App Lifecycle"
        view.addSubview(label)
    }
    
    func setupBackView() {
        backView.frame = CGRect(x: 20, y: 150, width: 350, height: 450)
        backView.layer.cornerRadius = CGFloat(25.0)
        backView.backgroundColor = .tintColor
        view.addSubview(backView)
    }
    
    func setupSwitches() {
        _switch.frame = CGRect(x: 170, y: 200, width: 0, height: 0)
        _switch.addTarget(self, action: #selector(switchAction(_:)), for: .valueChanged)
        _switchTwo.frame = CGRect(x: 170, y: 500, width: 0, height: 0)
        _switchTwo.addTarget(self, action: #selector(switchActionTwo(_:)), for: .valueChanged)
        view.addSubview(_switch)
        view.addSubview(_switchTwo)
    }
    
    func setupDatepicker() {
        datePicker.frame = CGRect(x: 30, y: 250, width: 200, height: 200)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(datePickerAction(_:)), for: .valueChanged)
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
    
    @objc func switchActionTwo(_ sender: UISwitch!) {
        if sender.isOn == true {
            view.backgroundColor = .black
            label.textColor = .white
            print("Switch: ON")
        } else {
            view.backgroundColor = .white
            label.textColor = .black
            print("Switch: OFF")
        }
    }
                             
    @objc func datePickerAction(_ sender: UIDatePicker!) {
        NotificationManager.shared.launchNotification(date: sender.date)
    }
}
