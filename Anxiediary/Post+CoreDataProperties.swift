//
//  Post+CoreDataProperties.swift
//  Anxiediary
//
//  Created by Kyle Goslan on 07/03/2016.
//  Copyright © 2016 Kyle Goslan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Post {

    @NSManaged var text: String!
    @NSManaged var title: String!

}
