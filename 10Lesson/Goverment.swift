//
//  Goverment.swift
//  10Lesson
//
//  Created by Владислав Пуцыкович on 1.12.21.
//

import Foundation

extension Notification.Name {
    static let govermentTaxLevelDidChange = Notification.Name("govermentTaxLevelDidChange")
    static let govermentSalaryDidChange = Notification.Name("govermentSalaryDidChange")
    static let govermentPensionDidChange = Notification.Name("govermentPensionDidChange")
    static let govermentAveragePriceDidChange = Notification.Name("govermentAveragePriceDidChange")
}

class Goverment {
    var taxLevel = 5.0 {
        willSet (value) {
            self.taxLevel = value
            NotificationCenter.default.post(name: .govermentTaxLevelDidChange, object: nil, userInfo: nil)
        }
    }
    var salary = 1000.0{
        willSet (value) {
            self.salary = value
            NotificationCenter.default.post(name: .govermentSalaryDidChange, object: nil, userInfo: nil)
        }
    }
    var pension = 550.0 {
        willSet (value) {
            self.pension = value
            NotificationCenter.default.post(name: .govermentPensionDidChange, object: nil, userInfo: nil)
        }
    }
    var averagePrice = 50.0 {
        willSet (value) {
            self.averagePrice = value
            NotificationCenter.default.post(name: .govermentAveragePriceDidChange, object: nil, userInfo: nil)
        }
    }
    
}
