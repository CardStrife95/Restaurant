//
//  DetailsViewController.swift
//  Restaurant
//
//  Created by Thierry Tran on 10/03/2015.
//  Copyright (c) 2015 Thierry Tran. All rights reserved.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController {

    @IBOutlet weak var nomLieu: UILabel!
    @IBOutlet weak var adresseLieu: UILabel!
    @IBOutlet weak var noteLieu: UILabel!
    @IBOutlet weak var typeLieu: UILabel!
    @IBOutlet weak var commentaireLieu: UILabel!
    
    var nom : String = ""
    var adresse : String = ""
    var commentaire : String = ""
    var note : Float = 0
    var type : String = ""
    
    var existLieu : NSManagedObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (existLieu != nil) {
            nomLieu.text=nom
            adresseLieu.text=adresse
            //noteLieu.text=
            typeLieu.text=type
            commentaireLieu.text=commentaire
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
