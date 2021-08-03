import UIKit

class ViewController: UIViewController {
    // Create IBOutlet refs
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var textField: UITextField!

    // Create arrays with 'questions' and their 'answers'
    var questions: Array = ["Dog", "Cat", "House","PC", "Book", "Glass", "Phone", "Flower" ,"Mouse", "Pencil"]
    let answers: Array = ["Dog", "Cat", "House","PC", "Book", "Glass", "Phone", "Flower" ,"Mouse", "Pencil"]
    var index = Array<Int>()
    
    var QuestionNumber = Int()
    var removeQuestion = Int()
    var inputTextFieldText = String()

    // Global reference of score count
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Method to read from a text file
        let fileURLProject = Bundle.main.path(forResource: "data", ofType: "txt")
        var readFromFile = String()
        
        do {
            readFromFile = try String(contentsOfFile: fileURLProject!, encoding: String.Encoding.utf8)
            
        } catch let error as NSError {
            // Print an error if caught
            print(NSError)
        }

        // Populate the array with the index values
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
        // Invoke the function
        clearInputSpace()
        
        //if questions are left
        if Int(index.count) > 0 {
            
            //picks random element from 'index' array
            QuestionNumber = index.randomElement()!
            
            //detects the index of the selected element from the array
            removeQuestion = index.firstIndex(of: QuestionNumber)!
            
            //remove the given element wit its index value
            index.remove(at: removeQuestion)
            
            //updates QuestionLabel
            questionLabel.text = questions[QuestionNumber]
            print(index)
        }
        else {
            //to do when no questions are left
            print("No more questions")
            
            //instantiate a segue
            guard let endVC = storyboard?.instantiateViewController(identifier: "secondViewController") as? secondViewController else {
                return
            }
            // Passes score data to new VC
            endVC.finalScore = score
            present(endVC, animated: true)
        }
    }
    @IBAction func didTapDoneButton(_ sender: Any) {
        
        //set up correction method
        if self.textField.text == answers[QuestionNumber] {
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

