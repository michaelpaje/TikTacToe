import UIKit

class Login: UIViewController {

    let defaults = UserDefaults.standard
    var success = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var UnameField: UITextField!
    @IBOutlet weak var PwordField: UITextField!
    
    
    @IBAction func loginbtn(_ sender: UIButton) {
        let size = defaults.integer(forKey: "size")
        for i in 0...size {
            let tempUser = defaults.string(forKey: "Username" + String(i))
            let tempPass = defaults.string(forKey: "Password" + String(i))
            if(UnameField.text == "" && PwordField.text == "") {
                let tfMessage = UIAlertController(title: "Login Failed", message: "Please fill up the text fields", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
                })
                tfMessage.addAction(ok)
                self.present(tfMessage, animated: true, completion: nil)
            }
            else if(tempUser == UnameField.text! && tempPass == PwordField.text!) {
                defaults.set(tempUser,forKey: "usernamelogin")
                defaults.set(tempPass,forKey: "passwordlogin")
                defaults.set(String(i),forKey: "num")
                success = true
                break
            }
        }
        if success {
            success = false
            UnameField.text = ""
            PwordField.text = ""
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
            PwordField.text = ""
        }
        
        @IBAction func registerbtn(_ sender: UIButton) {
            let vc = storyboard?.instantiateViewController(identifier: "register_vc") as! Register
            present(vc, animated: true)
        }
    
}
