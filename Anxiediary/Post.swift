import UIKit
import CoreData

class Post: NSManagedObject {

    convenience init(title: String, text: String) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Post", inManagedObjectContext:managedContext)!
        self.init(entity: entity, insertIntoManagedObjectContext: managedContext)
        
        self.title = title
        self.text = text
        
    }
    
}
