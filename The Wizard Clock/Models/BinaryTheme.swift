//
//  BinaryTheme.swift
//  The Wizard Clock
//
///  Created by Daniel Diner on 5/1/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class BinaryTheme: Theme {
    
    // Initialization function for Theme class. Puts in default values for name and hint.
    override init(){
        super.init()
        self.name = "Binary"
        self.hint = "The dots on the left show the tens and \nones of the hours in binary, while the \ndots on the right do the same for minutes"
    }
    
    // Returns the name of the background image for the theme.
    override func getBgImage() -> String {
        return "Binary_Background"
    }
        
    // Returns the name of the hour image for the theme.
    override func getHrImage(hour: Int) -> String {
        var hourImage: String
        switch hour{
        case 1:
            hourImage = "Binary_Hour_1"
        case 2:
            hourImage = "Binary_Hour_2"
        case 3:
            hourImage = "Binary_Hour_3"
        case 4:
            hourImage = "Binary_Hour_4"
        case 5:
            hourImage = "Binary_Hour_5"
        case 6:
            hourImage = "Binary_Hour_6"
        case 7:
            hourImage = "Binary_Hour_7"
        case 8:
            hourImage = "Binary_Hour_8"
        case 9:
            hourImage = "Binary_Hour_9"
        case 10:
            hourImage = "Binary_Hour_10"
        case 11:
            hourImage = "Binary_Hour_11"
        case 12:
            hourImage = "Binary_Hour_12"
        default:
            hourImage = "Binary_Hour_1"
        }
        return hourImage
    }
        
    // Returns the name of the minute image for the theme.
    override func getMinImage(minute: Int) -> String {
        var minuteImage: String
        switch minute{
        case 0:
            minuteImage = "Binary_Minute_0"
        case 1:
            minuteImage = "Binary_Minute_1"
        case 2:
            minuteImage = "Binary_Minute_2"
        case 3:
            minuteImage = "Binary_Minute_3"
        case 4:
            minuteImage = "Binary_Minute_4"
        case 5:
            minuteImage = "Binary_Minute_5"
        case 6:
            minuteImage = "Binary_Minute_6"
        case 7:
            minuteImage = "Binary_Minute_7"
        case 8:
            minuteImage = "Binary_Minute_8"
        case 9:
            minuteImage = "Binary_Minute_9"
        case 10:
            minuteImage = "Binary_Minute_10"
        case 11:
            minuteImage = "Binary_Minute_11"
        case 12:
            minuteImage = "Binary_Minute_12"
        case 13:
            minuteImage = "Binary_Minute_13"
        case 14:
            minuteImage = "Binary_Minute_14"
        case 15:
            minuteImage = "Binary_Minute_15"
        case 16:
            minuteImage = "Binary_Minute_16"
        case 17:
            minuteImage = "Binary_Minute_17"
        case 18:
            minuteImage = "Binary_Minute_18"
        case 19:
            minuteImage = "Binary_Minute_19"
        case 20:
            minuteImage = "Binary_Minute_20"
        case 21:
            minuteImage = "Binary_Minute_21"
        case 22:
            minuteImage = "Binary_Minute_22"
        case 23:
            minuteImage = "Binary_Minute_23"
        case 24:
            minuteImage = "Binary_Minute_24"
        case 25:
            minuteImage = "Binary_Minute_25"
        case 26:
            minuteImage = "Binary_Minute_26"
        case 27:
            minuteImage = "Binary_Minute_27"
        case 28:
            minuteImage = "Binary_Minute_28"
        case 29:
            minuteImage = "Binary_Minute_29"
        case 30:
            minuteImage = "Binary_Minute_30"
        case 31:
            minuteImage = "Binary_Minute_31"
        case 32:
            minuteImage = "Binary_Minute_32"
        case 33:
            minuteImage = "Binary_Minute_33"
        case 34:
            minuteImage = "Binary_Minute_34"
        case 35:
            minuteImage = "Binary_Minute_35"
        case 36:
            minuteImage = "Binary_Minute_36"
        case 37:
            minuteImage = "Binary_Minute_37"
        case 38:
            minuteImage = "Binary_Minute_38"
        case 39:
            minuteImage = "Binary_Minute_39"
        case 40:
            minuteImage = "Binary_Minute_40"
        case 41:
            minuteImage = "Binary_Minute_41"
        case 42:
            minuteImage = "Binary_Minute_42"
        case 43:
            minuteImage = "Binary_Minute_43"
        case 44:
            minuteImage = "Binary_Minute_44"
        case 45:
            minuteImage = "Binary_Minute_45"
        case 46:
            minuteImage = "Binary_Minute_46"
        case 47:
            minuteImage = "Binary_Minute_47"
        case 48:
            minuteImage = "Binary_Minute_48"
        case 49:
            minuteImage = "Binary_Minute_49"
        case 50:
            minuteImage = "Binary_Minute_50"
        case 51:
            minuteImage = "Binary_Minute_51"
        case 52:
            minuteImage = "Binary_Minute_52"
        case 53:
            minuteImage = "Binary_Minute_53"
        case 54:
            minuteImage = "Binary_Minute_54"
        case 55:
            minuteImage = "Binary_Minute_55"
        case 56:
            minuteImage = "Binary_Minute_56"
        case 57:
            minuteImage = "Binary_Minute_57"
        case 58:
            minuteImage = "Binary_Minute_58"
        case 59:
            minuteImage = "Binary_Minute_59"
        default:
            minuteImage = "Binary_Minute_0"
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
        return CGRect(x: Int(0.25*screenSize.width), y: Int(0.2*screenSize.height),  width:Int(0.25*screenSize.width) , height: Int(0.6*screenSize.height))
    }
            
    // Returns a CGRect which represents the location and size of the minute image.
    override func getMinPosition(minute: Int) -> CGRect{
        let screenSize = UIScreen.main.bounds
        return CGRect(x: Int(0.5*screenSize.width), y: Int(0.2*screenSize.height), width: Int(0.25*screenSize.width) , height: Int(0.6*screenSize.height))
    }
        
}
