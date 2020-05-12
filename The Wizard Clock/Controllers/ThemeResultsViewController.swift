//
//  ThemeResultsViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 4/28/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class ThemeResultsViewController: UIViewController {

    var themeName: String = "Nature"
    var clockTimer: Timer?
    
    func drawImage(imageName: String, position: CGRect){
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = position
        view.addSubview(imageView)
    }
    
    func getTheme(themeName: String) -> Theme{
        var theme: Theme
        switch themeName{
        case "Nature":
            theme = NatureTheme()
        case "Jersey":
            theme = JerseyTheme()
        case "Binary":
            theme = BinaryTheme()
        default:
            theme = Theme()
        }
        return theme
    }
    
    @objc func drawClock(){
        let theme = getTheme(themeName: themeName)
        
        let clockTime = ClockTime()
        
        let screenSize: CGRect = theme.getBGPosition()
        let hoursFrame: CGRect = theme.getHrPosition(hour: clockTime.getHour())
        let minutesFrame: CGRect = theme.getMinPosition(minute: clockTime.getMinute())
        
        let backgroundName = theme.getBgImage()
        let hoursName = theme.getHrImage(hour: clockTime.getHour())
        let minutesName = theme.getMinImage(minute: clockTime.getMinute())
        
        drawImage(imageName: backgroundName, position: screenSize)
        drawImage(imageName: hoursName, position: hoursFrame)
        drawImage(imageName: minutesName, position: minutesFrame)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawClock()
        
        clockTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(drawClock), userInfo: nil, repeats: true)
    }
    
    @IBAction func tapPressed(_ sender: UITapGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
