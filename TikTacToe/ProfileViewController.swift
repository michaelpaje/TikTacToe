//
//  ProfileViewController.swift
//  TikTacToe
//
//  Created by macstudent on 7/7/21.
//

import UIKit
import Foundation
class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var WinLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //WinLabel.text = String(Int(UserDefaults.standard.string(forKey: "winr")!)!)
    }
    /* READING
     let preferences = NSUserDefaults.standardUserDefaults()

    let currentLevelKey = "currentLevel"

    if preferences.objectForKey(currentLevelKey) == nil {
        //  Doesn't exist
    } else {
        let currentLevel = preferences.integerForKey(currentLevelKey)
    }*/
    /* WRITING
     let preferences = NSUserDefaults.standardUserDefaults()

     let currentLevelKey = "currentLevel"

     let currentLevel = ...
     preferences.setInteger(currentLevel, forKey: currentLevelKey)

     //  Save to disk
     let didSave = preferences.synchronize()

     if !didSave {
         //  Couldn't save (I've never seen this happen in real world testing)
     }
     */
}
