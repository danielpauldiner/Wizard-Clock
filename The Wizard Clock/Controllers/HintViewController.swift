//
//  HintViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 5/26/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class HintViewController: UIViewController {

    // Text labels telling user how to tell time and navi screen
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var navLabel: UILabel!
    
    // Variable with time hint instructions
    var themeHint: String = "Pass a Theme Hint String to hintLabel.text\n to tell user how to tell time.\nString will differ based on current theme"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set hint label based on theme
        hintLabel.text = themeHint
        // Variable telling user how to navi screen
        navLabel.text = "To navigate back to theme selection,\n swipe this card down.\n Then swipe left on screen."

        // Do any additional setup after loading the view.
    }
}
