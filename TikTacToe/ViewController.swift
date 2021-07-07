import UIKit

class ViewController: UIViewController {
    // image per turn text
    @IBOutlet weak var turn: UIImageView!
    // turn text
    @IBOutlet weak var wonText: UILabel!
    @IBOutlet weak var drawText: UILabel!
    var wing: Int = Int.init(), loseg: Int = Int.init(), drawg: Int = Int.init()
    var activePlayer = 1 // X
    var state = [0,0,0,0,0,0,0,0,0]
    let winCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var isGameActive = true
    var check = false
    // if vsplayer
    var vP = false
    // if x/o
    var pickedPlayer = ""
    var loop = true
    
    // Buttons
    @IBOutlet weak var aBtn: UIButton!
    @IBOutlet weak var bBtn: UIButton!
    @IBOutlet weak var cBtn: UIButton!
    @IBOutlet weak var dBtn: UIButton!
    @IBOutlet weak var eBtn: UIButton!
    @IBOutlet weak var fBtn: UIButton!
    @IBOutlet weak var gBtn: UIButton!
    @IBOutlet weak var hBtn: UIButton!
    @IBOutlet weak var iBtn: UIButton!
    // start tictactoe logo
    @IBOutlet weak var sgLogo: UIImageView!
    // tictactoe background
    @IBOutlet weak var sgPic: UIImageView!
    @IBOutlet weak var vsComputer: UIButton!
    @IBOutlet weak var vsPlayer: UIButton!
    @IBOutlet weak var mainMenuBtn: UIButton!
    @IBOutlet weak var changeSidesBtn: UIButton!
    func setStart() {
        state = [0,0,0,0,0,0,0,0,0]
        isGameActive = true
        activePlayer = 1
        turn.isHidden = false
        wonText.isHidden = false
        sgPic.isHidden = false
        aBtn.isHidden = false
        bBtn.isHidden = false
        cBtn.isHidden = false
        dBtn.isHidden = false
        eBtn.isHidden = false
        fBtn.isHidden = false
        gBtn.isHidden = false
        hBtn.isHidden = false
        iBtn.isHidden = false
        mainMenuBtn.isHidden = false
        sgLogo.isHidden = true
        vsPlayer.isHidden = true
        vsComputer.isHidden = true
        if(!vP && pickedPlayer == "o") {
            turn.image = UIImage(named: "o")
            activePlayer = 2
            state[computerMove("x")] = 1
        }
    }
    @IBAction func startGame(_ sender: UIButton) {
        if(sender.tag == 1) {
            vP = true
            setStart()
        } else {
            vP = false
            let alert = UIAlertController(title: "TicTacToe", message: "Pick Sides", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Pick X", style: UIAlertAction.Style.default, handler: {
                actions in self.pickedPlayer = "x"
                self.setStart()
            }))
            alert.addAction(UIAlertAction(title: "Pick O", style: UIAlertAction.Style.default, handler: {
                actions in self.pickedPlayer = "o"
                self.setStart()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func mainMenu(_ sender: Any) {
        turn.isHidden = true
        wonText.isHidden = true
        sgPic.isHidden = true
        aBtn.isHidden = true
        bBtn.isHidden = true
        cBtn.isHidden = true
        dBtn.isHidden = true
        eBtn.isHidden = true
        fBtn.isHidden = true
        gBtn.isHidden = true
        hBtn.isHidden = true
        iBtn.isHidden = true
        mainMenuBtn.isHidden = true
        playAgainBtn.isHidden = true
        changeSidesBtn.isHidden = true
        drawText.isHidden = true
        sgLogo.isHidden = false
        vsPlayer.isHidden = false
        vsComputer.isHidden = false
        isGameActive = false
        wonText.text = "\'s turn"
        check = false
        reset()
    }
    
    func computerMove(_ comp: String) -> Int {
        var number = 0
        while(loop) {
            number = Int.random(in: 0...8)
            if(state[number] == 0) {
                switch number {
                case 0:
                    aBtn.setImage(UIImage(named: comp), for: UIControl.State())
                    loop = false
                    
                case 1:
                    bBtn.setImage(UIImage(named: comp), for: UIControl.State())
                    loop = false
                case 2:
                    cBtn.setImage(UIImage(named: comp), for: UIControl.State())
                    loop = false
                case 3:
                    dBtn.setImage(UIImage(named: comp), for: UIControl.State())
                    loop = false
                case 4:
                    eBtn.setImage(UIImage(named: comp), for: UIControl.State())
                    loop = false
                case 5:
                    fBtn.setImage(UIImage(named: comp), for: UIControl.State())
                    loop = false
                case 6:
                    gBtn.setImage(UIImage(named: comp), for: UIControl.State())
                    loop = false
                case 7:
                    hBtn.setImage(UIImage(named: comp), for: UIControl.State())
                    loop = false
                case 8:
                    iBtn.setImage(UIImage(named: comp), for: UIControl.State())
                    loop = false
                default:
                    loop = true
                }
            }
        }
        loop = true
        return number
    }
    
    @IBAction func Moves(_ sender: UIButton) {
        // check if empty
        if(state[sender.tag-1] == 0 && isGameActive == true && check == false) {
            // put a value on clicked iamge
            state[sender.tag-1] = activePlayer
            // IF VS PLAYER
            if(vP) {
                if(activePlayer == 1) {
                    sender.setImage(UIImage(named: "x"), for: UIControl.State())
                    turn.image = UIImage(named: "o")
                    activePlayer = 2
                } else {
                    sender.setImage(UIImage(named: "o"), for: UIControl.State())
                    turn.image = UIImage(named: "x")
                    activePlayer = 1
                }
                // IF VS COMPUTER
            } else {
                var temp = false
                if (pickedPlayer == "x") {
                    sender.setImage(UIImage(named: "x"), for: UIControl.State())
                    activePlayer = 1
                    for i in state {
                        if i == 0 {
                            temp = true
                            break
                        }
                    }
                    if(temp) {
                        state[computerMove("o")] = 2
                    }
                } else {
                    state[computerMove("x")] = 1
                    sender.setImage(UIImage(named: "o"), for: UIControl.State())
                    activePlayer = 2
                }
            }
            print(state)
        }
        
        // check for the winner
        for combination in winCombinations {
            if (state[combination[0]] != 0 && state[combination[0]] == state[combination[1]] && state[combination[1]] == state[combination[2]])
            {
                isGameActive = false
                // x win
                if (state[combination[0]] == 1)
                {
                    turn.image = UIImage(named: "x")
                    if(pickedPlayer == "x"){
                        wing+=1
                    }else{
                        loseg+=1
                    }
                } else { // o win
                    turn.image = UIImage(named: "o")
                    if(pickedPlayer == "o"){
                        wing+=1
                    }else{
                        loseg+=1
                    }
                }
                check = true
                wonText.text = " WON!"
                playAgainBtn.isHidden = false
                if(!vP) {
                    changeSidesBtn.isHidden = false
                }
            }
        }
        isGameActive = false
        // check if all box are clicked
        for i in state {
            if i == 0 {
                isGameActive = true
                break
            }
        }
        // check if draw
        if isGameActive == false && check == false {
            turn.isHidden = true
            wonText.isHidden = true
            drawText.isHidden = false
            playAgainBtn.isHidden = false
            if(!vP) {
                changeSidesBtn.isHidden = false
            }
            drawg+=1
        }
        print("\(wing) \(drawg) \(loseg)")
        UserDefaults.standard.setValue(String(wing), forKey: "winr")
        UserDefaults.standard.set(String(drawg), forKey: "drawr")
        UserDefaults.standard.set(String(loseg), forKey: "loser")
    }
    

    @IBOutlet weak var playAgainBtn: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        // reset game
        state = [0,0,0,0,0,0,0,0,0]
        isGameActive = true
        playAgainBtn.isHidden = true
        changeSidesBtn.isHidden = true
        turn.isHidden = false
        drawText.isHidden = true
        wonText.isHidden = false
        wonText.text = "\'s turn"
        check = false
        reset()
        // o
        if(pickedPlayer == "o") {
            turn.image = UIImage(named: "o")
            state[computerMove("x")] = 1
            activePlayer = 2
        } else { //x
            turn.image = UIImage(named: "x")
            activePlayer = 1
        }
    }
    
    
    @IBAction func changeSides(_ sender: Any) {
        state = [0,0,0,0,0,0,0,0,0]
        isGameActive = true
        playAgainBtn.isHidden = true
        changeSidesBtn.isHidden = true
        turn.isHidden = false
        drawText.isHidden = true
        wonText.isHidden = false
        wonText.text = "\'s turn"
        check = false
        reset()
        // x > o
        if(pickedPlayer == "x") {
            pickedPlayer = "o"
            turn.image = UIImage(named: "o")
            state[computerMove("x")] = 1
            activePlayer = 2
        } else { // o > x
            pickedPlayer = "x"
            turn.image = UIImage(named: "x")
            //state[computerMove("x")] = 1
            activePlayer = 1
        }
        
    }
    
    func reset() {
        // reset image button
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

