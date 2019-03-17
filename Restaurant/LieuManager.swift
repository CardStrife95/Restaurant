//
//  LieuManager.swift
//  Restaurant
//
//  Created by Thierry Tran on 11/03/2015.
//  Copyright (c) 2015 Thierry Tran. All rights reserved.
//

import Foundation
import CoreData

class LieuManager{
    
    var listLieu = [NSManagedObject]()
    
    func nbLieu () -> Int{
        return listLieu.count
    }
    
    func addLieu (lieu : NSManagedObject) {
        listLieu.append(lieu)
    }
    
    
}