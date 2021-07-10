//
//  ProfileViewController.swift
//  TikTacToe
//
//  Created by macstudent on 7/7/21.
//

import UIKit

class ProfileViewController: UIViewController,  UITabBarControllerDelegate {
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
            print("hello")
        }
    let defaults = UserDefaults.standard
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var WinLabel: UILabel!
    @IBOutlet weak var DrawLabel: UILabel!
    @IBOutlet weak var LoseLabel: UILabel!
    @IBOutlet weak var WinPLabel: UILabel!
    var win = 0, draw = 0, lose = 0, winp: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        UsernameLabel.text = (defaults.value(forKey: "usernamelogin") as! String)
        //change forkey per user
        win = defaults.integer(forKey: "Username" + (defaults.value(forKey: "num") as! String) + "winr")
        draw = defaults.integer(forKey: "Username" + (defaults.value(forKey: "num") as! String) + "drawr")
        lose = defaults.integer(forKey: "Username" + (defaults.value(forKey: "num") as! String) + "loser")
        winp = Double(win + draw + lose)
        if(winp != 0){
            winp = (Double(win) / winp) * 100.0
        }
        WinPLabel.text = "\(winp) %"
        WinLabel.text = "\(win)"
        DrawLabel.text = "\(draw)"
        LoseLabel.text = "\(lose)"
    }
 
    
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var CurrentPassTextField: UITextField!
    @IBOutlet weak var NewPassTextField: UITextField!
    @IBOutlet weak var ConfirmPassTextField: UITextField!
    @IBAction func EditButton(_ sender: Any) {
        if UsernameTextField.text?.isEmpty == true || CurrentPassTextField.text?.isEmpty == true || NewPassTextField.text?.isEmpty == true || ConfirmPassTextField.text?.isEmpty == true {
            print("empty")
        }else{
            if(CurrentPassTextField.text != (defaults.value(forKey: "passwordlogin") as! String)){
                print("Not same!")
            }
            if(NewPassTextField.text != ConfirmPassTextField.text){
                print("Not same")
            }
        }
    }
}
