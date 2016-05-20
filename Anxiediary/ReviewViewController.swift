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
    
    @IBOutlet weak var reviewText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posts = loadPosts()
        
        func countPosts() {
            for post in posts {

        
        if goodPosts > 5 {
            reviewText.text = "Unfortunately it looks like this month hasn't been great at all for you. Lets try and reflect on your bad days properly so we can understand why those days weren't so good, along with what has triggered your anxiety and stress. Speak to your councillor about perhaps giving you new exercises to complete during the following month."
        }
        
        if goodPosts > 10 < 6 {
            reviewText.text = "This month hasn't been your best, but sometimes life isn't always great. You must remember that every single day has a positive, there is always something good to carry over to the next day. Speak to your councillor about perhaps walking you through your bad days, so together you can work on finding more positives in the days that pass."
            }
        
        if goodPosts > 15 < 11 {
            reviewText.text = "This month has been mostly okay for you, but you've had a few bad days. Try and remember the best experience you had and why. Get your councillor to reflect on how you can improve those days you weren't so fond of."
            }
        
        if goodPosts > 20 < 16 {
            reviewText.text = "Your month scored pretty high, well done you! Your month has been a success. Hopefully at this current time you are able to reflect on your positives rather than dwelling on your negatives like many of us do. Speak to your councillor about your next step to a reduced anxious lifestyle."

            }
        
        if goodPosts > 25 < 21 {
            reviewText.text = "This month has been great! You've had many more good days than bad. If you're still seeing a councillor, let them know your worst day this month and why so you can work on a clean sheet. You're doing great, keep it up and keep finding those positives!"
            }
        
        if goodPosts > 28 < 26 {
            reviewText.text = "This month has been almost immaculate, you've almost passed a whole month without ANY bad days! Speak to your councillor about why this month has been so great for you and try and outline what could make it even better. Make sure you celebrate in whichever way you like. Keep up the good work. hopefully next month is just as good!"
        
            }
        
        if goodPosts > 31 < 29 {
            reviewText.text = "It's been a flawless month for you! You've been able to reflect on your negatives in previous months and after your hard work, you've been able to have a fantastic month. By now, hopefully you are well on your way to living a life with far less stress. Continue using Anxiediary to track your personal progress to make sure your lifestyle stay completely positive!"
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
