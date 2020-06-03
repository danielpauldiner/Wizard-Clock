//
//  NatureTheme.swift
//  The Wizard Clock
//
//  Created by Daniel Diner on 4/30/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class NatureTheme: Theme {
    
    // Initialization function for Theme class. Puts in default values for name and hint
    override init(){
        super.init()
        self.name = "Nature"
        self.hint = "The trees represent hours and \nthe birds place in the sky the \nminutes"
    }
    
    // Returns the name of the background image for the theme.
    override func getBgImage() -> String {
        return "Nature_Background"
    }
        
    // Returns the name of the hour image for the theme.
    override func getHrImage(hour: Int) -> String {
        var hourImage: String
        switch hour{
        case 1:
            hourImage = "Nature_Hour_1"
        case 2:
            hourImage = "Nature_Hour_2"
        case 3:
            hourImage = "Nature_Hour_3"
        case 4:
            hourImage = "Nature_Hour_4"
        case 5:
            hourImage = "Nature_Hour_5"
        case 6:
            hourImage = "Nature_Hour_6"
        case 7:
            hourImage = "Nature_Hour_7"
        case 8:
            hourImage = "Nature_Hour_8"
        case 9:
            hourImage = "Nature_Hour_9"
        case 10:
            hourImage = "Nature_Hour_10"
        case 11:
            hourImage = "Nature_Hour_11"
        case 12:
            hourImage = "Nature_Hour_12"
        default:
            hourImage = "Nature_Hour_1"
        }
        return hourImage
    }
        
    // Returns the name of the minute image for the theme.
    override func getMinImage(minute: Int) -> String {
        return "Nature_Bird"
    }
        
    // Returns a CGRect which represents the location and size of the background image.
    override func getBGPosition() -> CGRect {
        return UIScreen.main.bounds
    }
    
    // Returns a CGRect which represents the location and size of the hour image.
    override func getHrPosition(hour: Int) -> CGRect{
        let screenSize = UIScreen.main.bounds
        return CGRect(x: 0, y: Int(0.66*screenSize.height), width: Int(screenSize.width) , height: Int(0.33*screenSize.height))
    }
            
    // Returns a CGRect which represents the location and size of the minute image.
    override func getMinPosition(minute: Int) -> CGRect{
        let imageHeight = 20
        let imageWidth = 50
        let screenSize = UIScreen.main.bounds
        
        var heightPosition: Int = Int(screenSize.height/3)
        var widthPosition: Int = 0
        
        let angle = 3.0 * Double(minute) * Double.pi / 180
        let sinVal = sin(angle)
        let fullHeight = Double(screenSize.height) * (1.0 - sinVal)
        
        heightPosition = Int(fullHeight/3) + 10
        widthPosition = Int((Int(screenSize.width) - imageWidth) / 59 * minute)
        
        return CGRect(x: widthPosition, y: heightPosition, width: imageWidth, height: imageHeight)
    }
    
}
