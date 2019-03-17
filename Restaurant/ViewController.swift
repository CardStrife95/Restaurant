//
//  ViewController.swift
//  Restaurant
//
//  Created by Thierry Tran on 09/03/2015.
//  Copyright (c) 2015 Thierry Tran. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var nomLieu: UITextField!
    @IBOutlet weak var adresseLieu: UITextField!
    @IBOutlet weak var commentaireLieu: UITextField!
    @IBOutlet weak var nomType: UILabel!
    
    @IBOutlet weak var typeLieu: UIPickerView!
    @IBOutlet weak var noteLieu: UISlider!
    
    @IBOutlet weak var dejaLa: UIButton!
    @IBOutlet weak var ajouterLieu: UIButton!
    
    let listeTypeLieu = ["Restaurant","Musée","Cinéma","théatre","Observatoire"]
    var type : String = ""
    
    @IBAction func enregistrement(sender: UIButton) {
        
        //Référence à note app delegate
        let appDel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //Référence à notre contexte
        let context : NSManagedObjectContext = appDel.managedObjectContext!
        let en = NSEntityDescription.entityForName("Lieu", inManagedObjectContext: context)
        
        //Création d'une instance
        //var newLieu = Lieu(entity:en!,insertIntoManagedObjectContext:context)
        let newLieu = Lieu(entity:en!,insertIntoManagedObjectContext:context)
        
        //Affectation des variables 
        newLieu.nom=nomLieu.text!
        newLieu.adresse=adresseLieu.text!
        print(noteLieu.value)
        //newLieu.note=noteLieu.value
        //println(type)
        newLieu.type=type
        newLieu.commentaire=commentaireLieu.text!
        
        do {
            //Sauvegarde du contexte
            try context.save()
        } catch _ {
        }
        
        print(newLieu)
        //Retour à la page de la liste
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        typeLieu.dataSource=self
        typeLieu.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listeTypeLieu.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return listeTypeLieu[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        type = listeTypeLieu[row]
    }

}

