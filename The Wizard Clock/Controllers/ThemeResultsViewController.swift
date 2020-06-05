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

    // The theme which is being displayed. Overwritten by input from theme selection page
    var themeName: String = "Nature"
    var clockTimer: Timer?
    // Determines if the greyscale effect is active. Overwritten by input from theme selection page.
    var greyscale: String = "Off"
    // Context which the filtering for the greyscale option occurs in.
    let context = CIContext()
    // The filter being used for the greyscale effect
    let filter = CIFilter(name: "CIPhotoEffectNoir")
    
    // Takes in the name of an image and the position for the image and draws it to the screen.
    func drawImage(imageName: String, position: CGRect){
        var image = UIImage(named: imageName)
        let originalCIImage = CIImage(image: image!)
        // When the greyscale button is selected the noir filter is applied to the images
        if greyscale == "On"{
            filter?.setValue(originalCIImage, forKey: kCIInputImageKey)
            let cgImage = context.createCGImage((filter?.outputImage!)!, from: (filter?.outputImage!.extent)!)
            image = UIImage(cgImage: cgImage!)
        }
        let imageView = UIImageView(image: image!)
        imageView.frame = position
        view.addSubview(imageView)
    }
    
    // Gets the theme based on the selection from the theme selection page.
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
    
    // Draws the clock based on the time and the theme selected.
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
    
    // Function called right before view/screen is shown
    // Hide Top Navigation Bar
    // Code Sourced from StackOverflow
    // https://stackoverflow.com/questions/47150880/hide-navigation-bar-for-a-view-controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
            // Hide the Navigation Bar
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }

    // Function called right beofre view/screen disappears
    // Unhide Navigation bar
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
            // Show the Navigation Bar
            self.navigationController?.setNavigationBarHidden(false, animated: false)
        }

    override func viewDidLoad() {
        super.viewDidLoad()

        drawClock()
        // Redraws the clock timer every 5 seconds so that it is up to date
        clockTimer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(drawClock), userInfo: nil, repeats: true)
    }
    
    // Hides Status Bar to fully imerse the Wizard Clock experience when viewed
    override var prefersStatusBarHidden: Bool {
         return true
    }
    
    // Brings up the hints page when the screen is double tapped
    @IBAction func tapPressed(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "getHints", sender: self)
    }
    
    // Returns to the theme selection page when a swipe left gesture is made
    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Sends the hint appropriate to the theme to the hints page on seque.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "getHints" {
            let theme = getTheme(themeName: themeName)
            let destinationVC = segue.destination as! HintViewController
            destinationVC.themeHint = theme.hint
        }
    }

}
