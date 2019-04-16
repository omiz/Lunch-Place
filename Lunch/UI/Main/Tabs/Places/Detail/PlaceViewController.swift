//
//  PlaceViewController.swift
//  Lunch
//
//  Created by Omar Allaham on 4/16/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import UIKit
import Lunch_Data

class PlaceViewController: UITableViewController {
    
    var object: EatingPlace?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Eating Place"
    }
    

    @IBAction
    func saveAction(_ sender: Any!) {
        
        if let object = object {
            object.update(update, completion: updateCompletion)
        } else {
            EatingPlace.new(update, completion: updateCompletion)
        }
    }
    
    func update(_ object: EatingPlace) {
        
    }
    
    func updateCompletion(_ error: Error?) {
        
    }
    
    @IBAction
    func cancelAction(_ sender: Any!) {
        
        dismiss(animated: true)
    }

}
