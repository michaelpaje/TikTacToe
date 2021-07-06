//
//  AboutViewController.swift
//  TikTacToe
//
//  Created by macstudent on 7/3/21.
//

import UIKit

class AboutViewController: UIViewController {
    @IBOutlet var michael: UIImageView!
    @IBOutlet var dom: UIImageView!
    @IBOutlet var cams: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        michael.image = UIImage(named: "mj")
        dom.image = UIImage(named: "dom")
        cams.image = UIImage(named: "cams")
    }
}

