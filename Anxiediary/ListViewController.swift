import UIKit
import CoreData

class ListViewController: UIViewController {
    
    var posts = [Post]()
    
    @IBOutlet weak var tabelView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        posts = loadPosts()
        tabelView.reloadData()
        
        if posts.count > 30 {
            addButton.enabled = false
        }
        
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
    
    func deletePost(post: Post) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        managedContext.deleteObject(post)
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! AddPostViewController
        vc.post = sender as? Post
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
        cellText.text = post.text + " \(post.date)"
        
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let post = posts[indexPath.row]
        performSegueWithIdentifier("NewPost", sender: post)
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let post = posts.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            deletePost(post)
        }
    }
}

