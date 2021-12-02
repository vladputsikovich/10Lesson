//
//  Businessman.swift
//  10Lesson
//
//  Created by Владислав Пуцыкович on 2.12.21.
//

import Foundation

class Businessmen {
    var taxLevel: Double = 5.0
    var averagePrice: Double = 0
    init() {
        let nc: NotificationCenter = NotificationCenter.default
        nc.addObserver(
            self,
            selector: #selector(taxLevelDidChange(_:)),
            name: .govermentTaxLevelDidChange,
            object: nil
        )
        nc.addObserver(
            self,
            selector: #selector(averagePriceDidChange(_:)),
            name: .govermentAveragePriceDidChange,
            object: nil
        )
    }
    
    @objc func taxLevelDidChange(_ notification: Notification) {
        guard let taxLevel = notification.userInfo?["govermentTaxLevelDidChange"] as? Double else {return}
        print(taxLevel)
    }
    
    @objc func averagePriceDidChange(_ notification: Notification) {
        guard let newAveragePrice = notification.userInfo?["govermentAveragePriceDidChange"] as? Double else {return}
        print(newAveragePrice)
        guard let inflation = notification.userInfo?["govermentInflation"] as? Double else {return}
        print("Инфляция составила - \(inflation)")
        print("С учетом налогов прибыль с 10 товаров составит: \(((10 * newAveragePrice) * (100 - self.taxLevel)) / 100)")
    }
    
    func dealloc() {
        NotificationCenter.default.removeObserver(self)
    }
}
