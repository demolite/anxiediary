import UIKit
import CoreData

class ListViewController: UIViewController {
    
    var posts = [Post]()
    
    @IBOutlet weak var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        posts = loadPosts()
        tabelView.reloadData()
    }

    
    func loadPosts() -> [Post] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
//        let sort = NSSortDescriptor(key: "city", ascending: true)
        let fetchRequest = NSFetchRequest(entityName: "Post")
//        fetchRequest.sortDescriptors = [sort]
        var posts = [Post]()
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            posts = results as! [Post]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return posts
    }
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        
        let post = posts[indexPath.row]
        
        cell.contentView.backgroundColor = post.moodColor
        
        
        let cellTitle = cell.viewWithTag(1) as! UILabel
        cellTitle.text = post.title
        
        let cellText = cell.viewWithTag(2) as! UILabel
        cellText.text = post.text
        
        
        
        

        
        return cell
    }
}

extension ListViewController: UITableViewDelegate {

}

