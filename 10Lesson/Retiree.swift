//
//  Retiree.swift
//  10Lesson
//
//  Created by Владислав Пуцыкович on 2.12.21.
//

import Foundation

class Retiree {
    var pension: Double = 500
    var averagePrice: Double = 50
    
    init() {
        let nc: NotificationCenter = NotificationCenter.default
        nc.addObserver(
            self,
            selector: #selector(pensionDidChange(_:)),
            name: .govermentPensionDidChange,
            object: nil
        )
        nc.addObserver(
            self,
            selector: #selector(averagePriceDidChange(_:)),
            name: .govermentAveragePriceDidChange,
            object: nil
        )
    }
    
    @objc func pensionDidChange(_ notification: Notification) {
        guard let pension = notification.userInfo?["govermentPensionDidChange"] as? Double else {return}
        print(pension)
    }
    
    @objc func averagePriceDidChange(_ notification: Notification) {
        guard let newAveragePrice = notification.userInfo?["govermentAveragePriceDidChange"] as? Double else {return}
        print(newAveragePrice)
        guard let inflation = notification.userInfo?["govermentInflation"] as? Double else {return}
        print("Инфляция составила - \(inflation)")
        print("Теперь я могу купить: \(pension / newAveragePrice)")
    }
    
    func dealloc() {
        NotificationCenter.default.removeObserver(self)
    }
}
