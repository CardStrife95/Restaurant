//
//  Restaurant.swift
//  Restaurant
//
//  Created by Thierry Tran on 10/03/2015.
//  Copyright (c) 2015 Thierry Tran. All rights reserved.
//

import Foundation
import CoreData

class Restaurant: NSManagedObject {

    @NSManaged var adresse: String
    @NSManaged var commentaire: String
    @NSManaged var nom: String
    @NSManaged var note: NSNumber
    @NSManaged var type: String

}
