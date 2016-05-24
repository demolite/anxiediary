import UIKit
import CoreData

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
    }

    @IBAction func reset(sender: AnyObject) {
        
        let alert=UIAlertController(title: "Reset current progress?", message: "Once you clear all your days, you cannot get them back.", preferredStyle: UIAlertControllerStyle.ActionSheet);
   
        presentViewController(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil));
        //event handler with closure
        alert.addAction(UIAlertAction(title: "Reset", style: .Destructive, handler: { _ in
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            let fetchRequest = NSFetchRequest(entityName: "Post")
            var posts = [Post]()
            do {
                let results = try managedContext.executeFetchRequest(fetchRequest)
                posts = results as! [Post]
            } catch let error as NSError {
                print("Could not fetch \(error), \(error.userInfo)")
            }
            
            for post in posts {
                managedContext.deleteObject(post)
            }
            
            do {
                try managedContext.save()
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
        }))
        
    }
    
}

