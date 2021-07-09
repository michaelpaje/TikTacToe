//
//  Login.swift
//  TikTacToe
//
//  Created by macstudent on 7/9/21.
//

import UIKit

class Login: UIViewController {

    let defaults = UserDefaults.standard

        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
        @IBOutlet weak var UnameField: UITextField!
        @IBOutlet weak var PwordField: UITextField!
    var success = false
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func loginbtn(_ sender: UIButton) {
        let size = defaults.integer(forKey: "size")
        for i in 0...size {
            let tempUser = defaults.string(forKey: "Username" + String(i))
            let tempPass = defaults.string(forKey: "Password" + String(i))
            if(tempUser == UnameField.text! && tempPass == PwordField.text!) {
                success = true
                break
            }
        }
        if success {
            let vc = storyboard?.instantiateViewController(identifier: "tabBar") as! UITabBarController
            present(vc, animated: true)
        }
        else{
            let dialogMessage = UIAlertController(title: "Login Failed", message: "Invalid Credentials", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            }
            
        }
        
        @IBAction func registerbtn(_ sender: UIButton) {
            let vc = storyboard?.instantiateViewController(identifier: "register_vc") as! Register
            present(vc, animated: true)
        }
    
}
