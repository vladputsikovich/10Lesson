//
//  Doctor.swift
//  10Lesson
//
//  Created by Владислав Пуцыкович on 2.12.21.
//

import Foundation

class Doctor {
    var salary: Double = 700
    
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
    }
    
    func dealloc(){
        NotificationCenter.default.removeObserver(self)
    }
}
