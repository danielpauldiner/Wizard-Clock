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
    var hint: String
    
    // Initialization function for Theme class. Puts in default values for name and hint.
    init(){
        self.name = "Theme"
        self.hint = "Pass a Theme Hint String to hintLabel.text\n to tell user how to tell time.\nString will differ based on current theme"
    }

    // Returns the name of the background image for the theme.
    func getBgImage() -> String {
        return "Background"
    }
    
    // Returns the name of the hour image for the theme.
    func getHrImage(hour: Int) -> String {
        return "hour"
    }
    
    // Returns the name of the minute image for the theme.
    func getMinImage(minute: Int) -> String {
        return "minute"
    }
    
    // Returns a CGRect which represents the location and size of the background image.
    func getBGPosition() -> CGRect {
        return UIScreen.main.bounds
    }
    
    // Returns a CGRect which represents the location and size of the hour image.
    func getHrPosition(hour: Int) -> CGRect{
        return UIScreen.main.bounds
    }
        
    // Returns a CGRect which represents the location and size of the minute image.
    func getMinPosition(minute: Int) -> CGRect{
         return UIScreen.main.bounds
    }
    
}
// test commit to firebase branch
