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
        
        NotificationCenter.default.addObserver(self, selector: #selector(govermentNotification(_:)), name: .govermentTaxLevelDidChange, object: nil
        )
        
        goverment.taxLevel = 13
        goverment.salary = 1100
        goverment.pension = 550
        goverment.averagePrice = 100
        
        
        
    }
    @objc func govermentNotification(_ notification: Notification) {
        print(notification.description)
    }
    
    func delloc() {
        NotificationCenter.default.removeObserver(self)
    }


}

