import UIKit
import CoreData

class Post: NSManagedObject {
    
    var moodColor: UIColor {
        if mood == 1 {
            return .redColor()
        }
        if mood == 2 {
            return .orangeColor()
        }
        return .greenColor()
    }

    convenience init(title: String, text: String, mood: Int) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entityForName("Post", inManagedObjectContext:managedContext)!
        self.init(entity: entity, insertIntoManagedObjectContext: managedContext)
        
        self.title = title
        self.text = text
        self.mood = mood
        
    }
    
}
