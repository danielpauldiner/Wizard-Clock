//
//  ThemeResultsViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 4/28/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit
import CoreImage

class ThemeResultsViewController: UIViewController {

    var themeName: String = "Nature"
    var clockTimer: Timer?
    var greyscale: String = "Off"
    let context = CIContext()
    let filter = CIFilter(name: "CIPhotoEffectNoir")
    
    func drawImage(imageName: String, position: CGRect){
        var image = UIImage(named: imageName)
        let originalCIImage = CIImage(image: image!)
        if greyscale == "On"{
            filter?.setValue(originalCIImage, forKey: kCIInputImageKey)
            let cgImage = context.createCGImage((filter?.outputImage!)!, from: (filter?.outputImage!.extent)!)
            image = UIImage(cgImage: cgImage!)
        }
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
    
    // Hide/Show Top Navigation Bar
    // Code Sourced from StackOverflow
    // https://stackoverflow.com/questions/47150880/hide-navigation-bar-for-a-view-controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
            // Hide the Navigation Bar
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
            // Show the Navigation Bar
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }

    override func viewDidLoad() {
        super.viewDidLoad()

        drawClock()
        
        clockTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(drawClock), userInfo: nil, repeats: true)
    }
    
    // Hides Status Bar to fully imerse the Wizard Clock experience when viewed
    override var prefersStatusBarHidden: Bool {
         return true
    }
    
    @IBAction func tapPressed(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "getHints", sender: self)
    }
    
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getHints" {
            let theme = getTheme(themeName: themeName)
            let destinationVC = segue.destination as! HintViewController
            destinationVC.themeHint = theme.hint
        }
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
