//
//  Restaurant.swift
//  Restaurant
//
//  Created by Thierry Tran on 09/03/2015.
//  Copyright (c) 2015 Thierry Tran. All rights reserved.
//

import UIKit
import CoreData

@objc(Lieu)
class Lieu : NSManagedObject {
    
    @NSManaged var nom : String
    @NSManaged var adresse : String
    @NSManaged var note : Float
    @NSManaged var type : String
    @NSManaged var commentaire : String
}
