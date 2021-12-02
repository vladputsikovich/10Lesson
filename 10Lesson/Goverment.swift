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
            let info: [String: Double] = ["govermentTaxLevelDidChange": taxLevel]
            NotificationCenter.default.post(name: .govermentTaxLevelDidChange, object: nil, userInfo: info)
        }
    }
    var salary = 1000.0{
        willSet (value) {
            self.salary = value
            let info: [String: Double] = ["govermentSalaryDidChange": salary]
            NotificationCenter.default.post(name: .govermentSalaryDidChange, object: nil, userInfo: info)
        }
    }
    var pension = 550.0 {
        willSet (value) {
            self.pension = value
            let info: [String: Double] = ["govermentPensionDidChange": pension]
            NotificationCenter.default.post(name: .govermentPensionDidChange, object: nil, userInfo: info)
        }
    }
    var averagePrice = 50.0 {
        willSet (value) {
            self.averagePrice = value
            let info: [String: Double] = ["govermentAveragePriceDidChange": averagePrice]
            NotificationCenter.default.post(name: .govermentAveragePriceDidChange, object: nil, userInfo: info)
        }
    }
    
}
