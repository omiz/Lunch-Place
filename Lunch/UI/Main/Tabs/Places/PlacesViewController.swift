//
//  PlacesViewController.swift
//  Lunch
//
//  Created by Omar Allaham on 4/16/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import UIKit
import Lunch_Data

class PlacesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSource: [[EatingPlace?]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTableView()

        reloadData()
    }
    
    func prepareTableView() {
        
        tableView.prepareDynamic()
        
        tableView.register(PlaceItemTableViewCell.self)
    }
    
    func reloadData() {
        dataSource = [[nil, nil]]
    }
}

extension PlacesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        return dataSource[section].count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.cell(PlaceItemTableViewCell.self, for: indexPath)
        
        cell.setup(dataSource[indexPath.section][indexPath.row])
        
        (cell.accessoryView as? UIImageView)?.isHighlighted = indexPath.row == 1
        
        return cell
    }
}

extension PlacesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
