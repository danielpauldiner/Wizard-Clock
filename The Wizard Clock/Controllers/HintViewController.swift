//
//  HintViewController.swift
//  The Wizard Clock
//
//  Created by Joshua Dean on 5/26/20.
//  Copyright © 2020 Daniel. All rights reserved.
//

import UIKit

class HintViewController: UIViewController {

    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var navLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hintLabel.text = "Pass a Theme Hint String to hintLabel.text\n to tell user how to tell time.\nString will differ based on current theme"
        navLabel.text = "To navigate back to theme selection,\n swipe this card down.\n Then swipe left on screen."

        // Do any additional setup after loading the view.
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
