import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var questions: Array = ["Dog", "Cat", "House","PC", "Book", "Glass", "Phone", "Flower" ,"Mouse", "Pencil"]
    let answers: Array = ["Dog", "Cat", "House","PC", "Book", "Glass", "Phone", "Flower" ,"Mouse", "Pencil"]
    var index = Array<Int>()
    
    var QuestioNumber = Int()
    var removeQuestion = Int()
    var inputTextFieldText = String()
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //read from textFile
        
        let fileURLProject = Bundle.main.path(forResource: "data", ofType: "txt")
        var readFromFile = String()
        
        do {
            readFromFile = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
            
        } catch let error as NSError {
            print("Fail")
            print(error)
        }
        print(readFromFile)
        
        
        
        
        for i in 0..<10 {
            index.append(Int(i))
        }
        updateQuestionLabel()
        updateScoreLabel()
    
    }
    func clearInputSpace(){
        
        //clears up textField after Buttons is pressed
        self.textField.text = ""
    }
    func updateQuestionLabel(){
        clearInputSpace()
        
        //if questions are left
        if Int(index.count) > 0 {
            
            
            //picks random element from 'index' array
            QuestioNumber = index.randomElement()!
            
            //detects the index of the selected element from the array
            removeQuestion = index.firstIndex(of: QuestioNumber)!
            
            //remove the given element wit its index value
            index.remove(at: removeQuestion)
            
            //updates QuestionLabel
            questionLabel.text = questions[QuestioNumber]
            print(index)

        }
        else {
            
            //to do when no questions are left
            print("No more questions")
            
            //instantiate a segue
            guard let endVC = storyboard?.instantiateViewController(identifier: "secondViewController") as? secondViewController else {
                return
            }
            //passses score data to new VC
            endVC.finalScore = score
            present(endVC, animated: true)
            
        }
    }
    @IBAction func didTapDoneButton(_ sender: Any) {
        
        //set up correction method
        if self.textField.text == answers[QuestioNumber] {
            print("Correct")
            score += 1
        }
        else {
            print("Incorrect")
        }
        
        //to update Score and Question Labels
        updateQuestionLabel()
        updateScoreLabel()
    }
    func updateScoreLabel(){
        
        //updates scoreLabel
        self.scoreLabel.text = String(score) + "/10"
    }
}

