//
//  JerseyTheme.swift
//  The Wizard Clock
//
///  Created by Daniel Diner on 5/1/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class JerseyTheme: Theme {
    
    // Initialization function for Theme class. Puts in default values for name and hint.
    override init(){
        super.init()
        self.name = "Jersey"
        self.hint = "The jersey on the left is the hour \nand the jersey on the right are \nthe minutes"
    }
    
    // Returns the name of the background image for the theme.
    override func getBgImage() -> String {
        return "Jersey_Background"
    }
        
    // Returns the name of the hour image for the theme.
    override func getHrImage(hour: Int) -> String {
        var hourImage: String
        switch hour{
        case 1:
            hourImage = "Jersey_Hour_1"
        case 2:
            hourImage = "Jersey_Hour_2"
        case 3:
            hourImage = "Jersey_Hour_3"
        case 4:
            hourImage = "Jersey_Hour_4"
        case 5:
            hourImage = "Jersey_Hour_5"
        case 6:
            hourImage = "Jersey_Hour_6"
        case 7:
            hourImage = "Jersey_Hour_7"
        case 8:
            hourImage = "Jersey_Hour_8"
        case 9:
            hourImage = "Jersey_Hour_9"
        case 10:
            hourImage = "Jersey_Hour_10"
        case 11:
            hourImage = "Jersey_Hour_11"
        case 12:
            hourImage = "Jersey_Hour_12"
        default:
            hourImage = "Jersey_Hour_1"
        }
        return hourImage
    }
        
    // Returns the name of the minute image for the theme.
    override func getMinImage(minute: Int) -> String {
        var minuteImage: String
        switch minute{
        case 0:
            minuteImage = "Jersey_Minute_0"
        case 1:
            minuteImage = "Jersey_Minute_1"
        case 2:
            minuteImage = "Jersey_Minute_2"
        case 3:
            minuteImage = "Jersey_Minute_3"
        case 4:
            minuteImage = "Jersey_Minute_4"
        case 5:
            minuteImage = "Jersey_Minute_5"
        case 6:
            minuteImage = "Jersey_Minute_6"
        case 7:
            minuteImage = "Jersey_Minute_7"
        case 8:
            minuteImage = "Jersey_Minute_8"
        case 9:
            minuteImage = "Jersey_Minute_9"
        case 10:
            minuteImage = "Jersey_Minute_10"
        case 11:
            minuteImage = "Jersey_Minute_11"
        case 12:
            minuteImage = "Jersey_Minute_12"
        case 13:
            minuteImage = "Jersey_Minute_13"
        case 14:
            minuteImage = "Jersey_Minute_14"
        case 15:
            minuteImage = "Jersey_Minute_15"
        case 16:
            minuteImage = "Jersey_Minute_16"
        case 17:
            minuteImage = "Jersey_Minute_17"
        case 18:
            minuteImage = "Jersey_Minute_18"
        case 19:
            minuteImage = "Jersey_Minute_19"
        case 20:
            minuteImage = "Jersey_Minute_20"
        case 21:
            minuteImage = "Jersey_Minute_21"
        case 22:
            minuteImage = "Jersey_Minute_22"
        case 23:
            minuteImage = "Jersey_Minute_23"
        case 24:
            minuteImage = "Jersey_Minute_24"
        case 25:
            minuteImage = "Jersey_Minute_25"
        case 26:
            minuteImage = "Jersey_Minute_26"
        case 27:
            minuteImage = "Jersey_Minute_27"
        case 28:
            minuteImage = "Jersey_Minute_28"
        case 29:
            minuteImage = "Jersey_Minute_29"
        case 30:
            minuteImage = "Jersey_Minute_30"
        case 31:
            minuteImage = "Jersey_Minute_31"
        case 32:
            minuteImage = "Jersey_Minute_32"
        case 33:
            minuteImage = "Jersey_Minute_33"
        case 34:
            minuteImage = "Jersey_Minute_34"
        case 35:
            minuteImage = "Jersey_Minute_35"
        case 36:
            minuteImage = "Jersey_Minute_36"
        case 37:
            minuteImage = "Jersey_Minute_37"
        case 38:
            minuteImage = "Jersey_Minute_38"
        case 39:
            minuteImage = "Jersey_Minute_39"
        case 40:
            minuteImage = "Jersey_Minute_40"
        case 41:
            minuteImage = "Jersey_Minute_41"
        case 42:
            minuteImage = "Jersey_Minute_42"
        case 43:
            minuteImage = "Jersey_Minute_43"
        case 44:
            minuteImage = "Jersey_Minute_44"
        case 45:
            minuteImage = "Jersey_Minute_45"
        case 46:
            minuteImage = "Jersey_Minute_46"
        case 47:
            minuteImage = "Jersey_Minute_47"
        case 48:
            minuteImage = "Jersey_Minute_48"
        case 49:
            minuteImage = "Jersey_Minute_49"
        case 50:
            minuteImage = "Jersey_Minute_50"
        case 51:
            minuteImage = "Jersey_Minute_51"
        case 52:
            minuteImage = "Jersey_Minute_52"
        case 53:
            minuteImage = "Jersey_Minute_53"
        case 54:
            minuteImage = "Jersey_Minute_54"
        case 55:
            minuteImage = "Jersey_Minute_55"
        case 56:
            minuteImage = "Jersey_Minute_56"
        case 57:
            minuteImage = "Jersey_Minute_57"
        case 58:
            minuteImage = "Jersey_Minute_58"
        case 59:
            minuteImage = "Jersey_Minute_59"
        default:
            minuteImage = "Jersey_Minute_0"
        }
        return minuteImage
    }
        
    // Returns a CGRect which represents the location and size of the background image.
    override func getBGPosition() -> CGRect {
        return UIScreen.main.bounds
    }
    
    // Returns a CGRect which represents the location and size of the hour image.
    override func getHrPosition(hour: Int) -> CGRect{
        let screenSize = UIScreen.main.bounds
        return CGRect(x: Int(0.19*screenSize.width), y: Int(0.21*screenSize.height), width: Int(0.15*screenSize.width) , height: Int(0.215*screenSize.height))
    }
            
    // Returns a CGRect which represents the location and size of the minute image.
    override func getMinPosition(minute: Int) -> CGRect{
        let screenSize = UIScreen.main.bounds
        return CGRect(x: Int(0.69*screenSize.width), y: Int(0.21*screenSize.height), width: Int(0.15*screenSize.width) , height: Int(0.215*screenSize.height))
    }
    
}
