import UIKit

class secondViewController: UIViewController {
    
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    var finalScore = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        showFinalScore()
        
    }
    func showFinalScore(){
        self.finalScoreLabel.text = "Score: " + String(finalScore) + "/10"
    }


}
