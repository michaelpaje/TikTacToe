//
//  aboutMJViewController.swift
//  TikTacToe
//
//  Created by macstudent on 7/8/21.
//

import UIKit

class aboutMJViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func connect(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.linkedin.com")! as URL, options: [:],completionHandler: nil)
    }

}
