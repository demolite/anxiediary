//
//  ReviewViewController.swift
//  Anxiediary
//
//  Created by Samuel Jones (i7262665) on 18/05/2016.
//  Copyright © 2016 Kyle Goslan. All rights reserved.
//

import UIKit
import CoreData


class ReviewViewController: UIViewController {

    var posts: [Post]!
    var goodPosts = 0
    var badPosts = 0
    
    @IBOutlet weak var demoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = loadPosts()
        
        countPosts()
    
        if goodPosts == 1 {
            demoLabel.text = "HAPPY"
            
            if goodPosts == 2 {
                demoLabel.text = "sad"
            }
        
        }
        
    }
    
    func countPosts() {
        for post in posts {
            if post.mood == 1 {
                badPosts = badPosts + 1
            }
            
            if post.mood == 3 {
                goodPosts = goodPosts + 1
            }
        }
    }
    
    
    func loadPosts() -> [Post] {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        //        let sort = NSSortDescriptor(key: "city", ascending: true)
        let fetchRequest = NSFetchRequest(entityName: "Post")
        
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        dateFormatter.timeZone = NSTimeZone(name: "GMT")
//        let dateString = dateFormatter.stringFromDate(NSDate())
        
//        let resultPredicate = NSPredicate(format: "date>= \(dateString) AND date<= \(dateString)")
//        fetchRequest.predicate = resultPredicate
        
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
