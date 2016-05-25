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
        
        if goodPosts > 29 {
            reviewText.text = "First of all, Anxiediary would like to congratulate you on your month! You've had less than a handful of bad days, meaning that you're now beginning to structure your mindset around being more positive. Speak to your counsellor about possibly talking about what has made you so happy this month. Good job! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        if goodPosts > 28  {
            reviewText.text = "This month has been almost immaculate, you've almost passed a whole month without ANY bad days! Speak to your councillor about why this month has been so great for you and try and outline what could make it even better. Make sure you celebrate in whichever way you like. Keep up the good work, hopefully next month is just as good! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 27 {
            reviewText.text = "Well done! You've had very little bad days this month. You seem to have been able to work with your negatives to create more positive outcomes. To be honest with you, however your frame of mind, you'll always have bad days at some point. Keep this work up my friend, you're doing a fantastic job! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 26 {
            reviewText.text = "Fantastic review! You've been able to continue through the month with a huge positive attitude. Yeah okay, you've had a handful of bad days, but we all do, right? Wherever you are in your journey against fighting anxiety, just make sure that you know that your effects will never go to waste. You will beat anxiety and stress eventually! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 25  {
            reviewText.text = "This month has been great! You've had many more good days than bad. If you're still seeing a councillor, let them know about your worst day this month and explain why it was negative so you can work on a clean sheet. You're doing great, keep it up and keep finding those positives! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 24 {
            reviewText.text = "This month has been great for you, well done! Your progress has been remarkable. Speak to your counsellor about what could make your bad days any better. Remember, its their job to listen to you so make sure you utilise that. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        if goodPosts > 23 {
            reviewText.text = "Its been a very positive month, good job! We do still have a few bad days, but hopefully with just a little more work, we can make that diary screen look even greener. Speak to your counsellor about your next step. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        if goodPosts > 22 {
            reviewText.text = "Its been a fairly good month for you, congratulations! Even though you've had a few bad days, you've still managed to have lots of good days! Keep up the fantastic work and hopefully we will see you next month with even more green in that feed."
            return
        }

        if goodPosts > 21 {
            reviewText.text = "This month has been mostly positive for you, but still needs work. Try going through your post feed and reviewing each bad day in more detail so that you can understand your negatives, rather than just hoping for a better month next time. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        if goodPosts > 20  {
            reviewText.text = "Your month scored pretty high, well done you! Your month has been a success. Hopefully at this current time you are able to reflect on your positives rather than dwelling on your negatives like many of us do. Speak to your councillor about your next step to reducing you anxiety even further. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 19 {
            reviewText.text = "This month has outweighed in your favour with positive days, but only slightly. Try speaking to your counsellor about possibly altering what you accomplish in your sessions together, perhaps you have some underlying issues you should discuss with them. We all have our own problems, but we should never bottle them up, even if they happened years ago. It all helps! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        if goodPosts > 18 {
            reviewText.text = "This month has had quite a few positive days, good job! Try talking to your counsellor about how life is in your student house of indeed at home, perhaps there are improvements to be made there in order to see more green in the feed. Hopefully next month brings better things! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 17 {
            reviewText.text = "This month has been above average, with a couple of green days outweighing the red! The next month you complete with anxiediary will hopefully fill up that feed with plenty of green. you can do it, we believe in you! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        if goodPosts > 16 {
            reviewText.text = "Congratulations, you've had more good days than bad days! But only just. The coming month still needds lots more progress. But you've shown that you can still have positive attitudes to life, dont give up on yourself! Take each day as it comes and remember to give yourself the respect you deserve every single day. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        if goodPosts > 15  {
            reviewText.text = "This month has been mostly okay for you, but you've had a few bad days. Try and remember the best experience you had and why. Get your councillor to reflect on how you can improve those days you weren't so fond of. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 14 {
            reviewText.text = "This month has nearly broken even, you've only just had more negative days than positives. This can be seen as good news, because hopefully the coming month can tip the scale! Make sure you're writing those daily plans, eating healthy and exercising, be good to yourself. Speak to your counsellor about your next step. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        if goodPosts > 13 {
            reviewText.text = "This month has been just below average according to your score. We cannot forget the positive days though! What was it that made those days so good? Is there anything that you can carry over to the negative days to turn them green? Speak to your counsellor about the next step. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        if goodPosts > 12 {
            reviewText.text = "This month has had quite a few positives, but sadly its had more negatives. Try and pinpoint which part of the day makes you most stressed and why. Getting out of bed? Going to class? Going to sleep? Speak to your counsellor about what you could do to make these times easier for you. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        if goodPosts > 11 {
            reviewText.text = "This month hasn't been the greatest, but by far the worst. Consider trying to increase your notivation with your education by writing daily plans, as completing plans is a good way to boost your self esteem. Speak to your counsellor about your next step. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        if goodPosts > 10 {
            reviewText.text = "This month hasn't been your best, but sometimes life isn't always great. You must remember that every single day has a positive, there is always something good to carry over to the next day. Speak to your councillor about perhaps walking you through your bad days, so together you can work on finding more positives in the days that pass. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 9 {
            reviewText.text = "This month has been reasonably okay for you, but there have been more negative days than positive days. This month has been tough, but maybe you need to start to think about changing things for the better. Sometimes changing your daily routine can be the start of becoming less stressed. Speak to your counsellor about what you can do to improve your daily routine. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        if goodPosts > 8 {
            reviewText.text = "You've had a number of good days in this month, but your diary indicates that you've been having quite a tough time. Eating well is one of a number of ways to make yourself feel better, inside and out. When it comes to stress, you need to work alongside your body in order to succeed. Keep going, we will get there eventually don't worry! Speak to your counsellor about possible changes to your diet perhaps. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        
        if goodPosts > 7 {
            reviewText.text = "This month hasn't been all bad for you, but its fair to say there is lots of room for improvement. Perhaps you should consider something that can utilise your time better. Exercise is a great way to get ride of stress and anxiety and helps you feel better about yourself! Speak to your counsellor about your next step. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        
        if goodPosts > 6 {
            reviewText.text = "You've had a couple of good days, but overall, this month has been pretty negative for you. What was it about this month that made you feel so anxious? Speak to your counsellor about how you can turn next month around. If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }

        
        if goodPosts > 5 {
            reviewText.text = "Unfortunately, it looks like this month hasn't been great at all for you. Let's try and reflect on your bad days properly so we can understand why those days were mainly negative, and what has been triggering your anxiety and stress. Speak to your councillor about perhaps giving you new excercises to complete during the following month. Hopefully together we can work through these negatives to reach the positives! If you wish to start another month from scratch, please click to reset button on the home screen."
            return
        }
        
        if goodPosts > 4 {
            reviewText.text = "Its fair to say that this month could have been better. But we have to remember that its not always sunshine and rainbows, sometimes it gets worse before it gets better. Speak to your counsellor about what you think has made this month as stressful as its been. Stay calm, we will get there! If you wish to start another month from scratch, please click to reset button on the home screen."
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
