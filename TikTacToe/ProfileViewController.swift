//
//  ProfileViewController.swift
//  TikTacToe
//
//  Created by macstudent on 7/9/21.
//

import UIKit

class ProfileViewController: UIViewController,  UITabBarControllerDelegate {
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
            print("hello")
        }
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var WinLabel: UILabel!
    @IBOutlet weak var DrawLabel: UILabel!
    @IBOutlet weak var LoseLabel: UILabel!
    @IBOutlet weak var WinPLabel: UILabel!
    var win = 0, draw = 0, lose = 0, winp = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //change forkey per user
        win = Int(UserDefaults.standard.value(forKey: "winr") as! String)!
        draw = Int(UserDefaults.standard.value(forKey: "drawr") as! String)!
        lose = Int(UserDefaults.standard.value(forKey: "loser") as! String)!
        winp += (win + draw + lose)
        winp = (win / winp) * 100
        WinPLabel.text = "\(winp) %"
        WinLabel.text = "\(Int(UserDefaults.standard.value(forKey: "winr") as! String)!)"
        DrawLabel.text = "\(draw)"
        LoseLabel.text = "\(lose)"
    }
    
    @IBAction func profilepage(){
        win = Int(UserDefaults.standard.value(forKey: "winr") as! String)!
        draw = Int(UserDefaults.standard.value(forKey: "drawr") as! String)!
        lose = Int(UserDefaults.standard.value(forKey: "loser") as! String)!
        winp += (win + draw + lose)
        winp = (win / winp) * 100
        WinPLabel.text = "\(winp) %"
        WinLabel.text = "\(Int(UserDefaults.standard.value(forKey: "winr") as! String)!)"
        DrawLabel.text = "\(draw)"
        LoseLabel.text = "\(lose)"
    }
}
