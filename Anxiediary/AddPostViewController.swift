import UIKit
import CoreData

class AddPostViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func saveNewPost(sender: AnyObject) {
        
        if textTextField.text! == ""  || titleTextField.text! == "" {
            return
        }
        
        let _ = Post(title: titleTextField.text!, text: textTextField.text!)
        
        textTextField.text = nil
        titleTextField.text = nil
       
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
}