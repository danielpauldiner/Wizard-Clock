//
//  Theme.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 4/28/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class Theme {
    var name: String
    
    init(){
        self.name = "Theme"
    }

    func getBgImage() -> String {
        return "Background"
    }
    
    func getHrImage(hour: Int) -> String {
        return "hour"
    }
    
    func getMinImage(minute: Int) -> String {
        return "minute"
    }
        
    func getBGPosition() -> CGRect {
        return UIScreen.main.bounds
    }

    func getHrPosition(hour: Int) -> CGRect{
        return UIScreen.main.bounds
    }
    
    func getMinPosition(minute: Int) -> CGRect{
         return UIScreen.main.bounds
    }
    
}
// test commit to firebase branch
