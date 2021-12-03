//
//  ViewController.swift
//  10Lesson
//
//  Created by Владислав Пуцыкович on 1.12.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let goverment = Goverment()
        
        let doctor = Doctor()
        
        let business = Businessmen()
        
        let retiree = Retiree()
        
        NotificationCenter.default.addObserver(self, selector: #selector(govermentNotification(_:)), name: .govermentTaxLevelDidChange, object: nil
        )
        
        goverment.taxLevel = 13
        goverment.salary = 1400
        goverment.pension = 550
        goverment.averagePrice = 70
        
        doctor.salary = goverment.salary
        doctor.averagePrice = goverment.averagePrice
        
        business.taxLevel = goverment.taxLevel
        business.averagePrice = goverment.averagePrice
        
        retiree.pension = goverment.pension
        retiree.averagePrice = goverment.averagePrice
        
    }
    
    @objc func govermentNotification(_ notification: Notification) {
        print(notification.description)
    }
    
    func delloc() {
        NotificationCenter.default.removeObserver(self)
    }


}

