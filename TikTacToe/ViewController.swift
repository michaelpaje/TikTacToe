import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var turn: UIImageView!
    @IBOutlet weak var wonText: UILabel!
    @IBOutlet weak var drawText: UILabel!
    var activePlayer = 1 // X
    var state = [0,0,0,0,0,0,0,0,0]
    let winCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var isGameActive = true
    var check = false
    
    @IBAction func Moves(_ sender: UIButton) {
        // check if empty
        if(state[sender.tag-1] == 0 && isGameActive == true && check == false) {
            // put a value on clicked iamge
            state[sender.tag-1] = activePlayer
            if(activePlayer == 1) {
                sender.setImage(UIImage(named: "x"), for: UIControl.State())
                turn.image = UIImage(named: "o")
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "o"), for: UIControl.State())
                turn.image = UIImage(named: "x")
                activePlayer = 1
            }
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
                } else { // o win
                    turn.image = UIImage(named: "o")
                }
                check = true
                wonText.text = " WON!"
                playAgainBtn.isHidden = false
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
        if isGameActive == false {
            turn.isHidden = true
            wonText.isHidden = true
            drawText.isHidden = false
            playAgainBtn.isHidden = false
        }
    }
    

    @IBOutlet weak var playAgainBtn: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        // reset game
        state = [0,0,0,0,0,0,0,0,0]
        isGameActive = true
        activePlayer = 1
        playAgainBtn.isHidden = true
        turn.isHidden = false
        drawText.isHidden = true
        wonText.isHidden = false
        wonText.text = "\'s turn"
        check = false
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

