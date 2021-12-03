//
//  Doctor.swift
//  10Lesson
//
//  Created by Владислав Пуцыкович on 2.12.21.
//

import Foundation
import UIKit

class Doctor {
    var salary: Double = 700
    var averagePrice: Double = 50
    
    init() {
        let nc: NotificationCenter = NotificationCenter.default
        nc.addObserver(
            self,
            selector: #selector(salaryDidChange(_:)),
            name: .govermentSalaryDidChange,
            object: nil
        )
        nc.addObserver(
            self,
            selector: #selector(averagePriceDidChange(_:)),
            name: .govermentAveragePriceDidChange,
            object: nil
        )
        nc.addObserver(
            self,
            selector: #selector(appSleep(_:)),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
    }
    
    @objc func salaryDidChange(_ notification: Notification) {
        guard let newSalary = notification.userInfo?["govermentSalaryDidChange"] as? Double else {return}
        if self.salary < newSalary {
            print("life is shit")
        } else {
            print("yes because we safe life")
        }
        self.salary = newSalary
    }
    
    @objc func averagePriceDidChange(_ notification: Notification) {
        guard let newAveragePrice = notification.userInfo?["govermentAveragePriceDidChange"] as? Double else {return}
        print(newAveragePrice)
        guard let inflation = notification.userInfo?["govermentInflation"] as? Double else {return}
        print("Инфляция составила - \(inflation)")
        print("Потенциальная зарплата должна быть: \(((self.salary) * (100 + inflation)) / 100)")
    }
    
    @objc func appSleep(_ notification: Notification) {
        print("SLEEP DOCTOR")
    }
    
    func dealloc() {
        NotificationCenter.default.removeObserver(self)
    }
}
