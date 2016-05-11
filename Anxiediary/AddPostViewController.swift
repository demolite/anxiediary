import UIKit
import CoreData

class AddPostViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textTextField: UITextView!
    @IBOutlet weak var moodOne: UIButton!
    @IBOutlet weak var moodTwo: UIButton!
    @IBOutlet weak var moodThree: UIButton!
    
    var mood: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func resetView() {
        textTextField.text = nil
        titleTextField.text = nil
        moodOne.alpha = 0.7
        moodTwo.alpha = 0.7
        moodThree.alpha = 0.7
    }
    
    @IBAction func moodSelected(sender: UIButton) {
            moodOne.alpha = 0.7
            moodTwo.alpha = 0.7
            moodThree.alpha = 0.7
            sender.alpha = 1
            mood = sender.tag
    }
    
    @IBAction func saveNewPost(sender: AnyObject) {
        
        if textTextField.text! == ""  || titleTextField.text! == "" || mood == nil {
            return
        }
        
        let _ = Post(title: titleTextField.text!, text: textTextField.text!, mood: mood)
        
        resetView()
       
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
}


extension AddPostViewController: UITextFieldDelegate, UITextViewDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}