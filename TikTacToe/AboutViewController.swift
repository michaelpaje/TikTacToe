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
    @IBOutlet weak var niko: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        michael.image = UIImage(named: "mj")
        dom.image = UIImage(named: "dom")
        cams.image = UIImage(named: "cams")
        niko.image = UIImage(named: "niko")
        michael.setRounded()
        dom.setRounded()
        cams.setRounded()
        niko.setRounded()
    }
    
}

extension UIImageView {
    func setRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
