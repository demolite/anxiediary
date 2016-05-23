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
        countPosts()
        
        setText()
    }
    
    func setText() {
        if goodPosts > 30  {
            reviewText.text = "It's been a flawless month for you! You've been able to reflect on your negatives in previous months and after your hard work, you've been able to have a fantastic month. By now, hopefully you are well on your way to living a life with far less stress and anxiety. Continue using Anxiediary to track your personal progress to make sure your lifestyle stay completely positive! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 28  {
            reviewText.text = "This month has been almost immaculate, you've almost passed a whole month without ANY bad days! Speak to your councillor about why this month has been so great for you and try and outline what could make it even better. Make sure you celebrate in whichever way you like. Keep up the good work, hopefully next month is just as good! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 25  {
            reviewText.text = "This month has been great! You've had many more good days than bad. If you're still seeing a councillor, let them know about your worst day this month and explain why it was negative so you can work on a clean sheet. You're doing great, keep it up and keep finding those positives! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 20  {
            reviewText.text = "Your month scored pretty high, well done you! Your month has been a success. Hopefully at this current time you are able to reflect on your positives rather than dwelling on your negatives like many of us do. Speak to your councillor about your next step to reducing you anxiety even further. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 15  {
            reviewText.text = "This month has been mostly okay for you, but you've had a few bad days. Try and remember the best experience you had and why. Get your councillor to reflect on how you can improve those days you weren't so fond of. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 10 {
            reviewText.text = "This month hasn't been your best, but sometimes life isn't always great. You must remember that every single day has a positive, there is always something good to carry over to the next day. Speak to your councillor about perhaps walking you through your bad days, so together you can work on finding more positives in the days that pass. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 5 {
            reviewText.text = "Unfortunately, it looks like this month hasn't been great at all for you. Let's try and reflect on your bad days properly so we can understand why those days were mainly negative, and what has been triggering your anxiety and stress. Speak to your councillor about perhaps giving you new excercises to complete during the following month. Hopefully together we can work through these negatives to reach the positives! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        
        reviewText.text = "Welcome to the review page! To review this months progress, please complete all 30 days of your daily posts."
        return
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
