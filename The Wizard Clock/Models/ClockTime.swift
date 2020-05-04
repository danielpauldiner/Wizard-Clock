//
//  ClockTime.swift
//  The Wizard Clock
//
//  Created by Daniel on 2/11/1399 AP.
//  Copyright © 1399 Daniel. All rights reserved.
//

import UIKit

struct ClockTime {
    
    func getHour() -> Int {
        let date = Date()
        let calendar = Calendar.current
        var hour = calendar.component(.hour, from: date)
        if hour > 12{
            hour = hour - 12
        }
        return hour
    }
    
    func getMinute() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let minute = calendar.component(.minute, from: date)
        return minute
    }
}
