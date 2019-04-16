//
//  UITableView+Register.swift
//  Utility
//
//  Created by Omar Allaham on 4/16/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func prepareDynamic() {
        
        dynamicRow()
        
        removeExtraSeparators()
    }
    
    func dynamicRow(estimated height: CGFloat = 44) {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = height
    }
    
    func dynamicHeader(estimated height: CGFloat = 44) {
        sectionHeaderHeight = UITableView.automaticDimension
        estimatedSectionHeaderHeight = height
    }
    
    func dynamicFooter(estimated height: CGFloat = 44) {
        sectionFooterHeight = UITableView.automaticDimension
        estimatedSectionFooterHeight = height
    }
    
    func dynamic() {
        dynamicRow()
        dynamicHeader()
        dynamicFooter()
    }
    
    func removeExtraSeparators() {
        tableFooterView = UIView(frame: .zero)
    }
    
    func fullWidthSeparator() {
        separatorInset = .zero
    }
    
    func register<T: UITableViewCell>(_ cls: T.Type) {
        
        let id = String(describing: cls)
        
        register(id)
    }
    
    func register(_ id: String) {
        
        register(UINib(id), forCellReuseIdentifier: id)
    }
    
    func registerView<T: UITableViewHeaderFooterView>(_ cls: T.Type) {
        
        let id = String(describing: cls)
        
        register(UINib(id), forHeaderFooterViewReuseIdentifier: id)
    }
    
    func view<T: UITableViewHeaderFooterView>(_ cls: T.Type) -> T {
        
        let id = String(describing: cls)
        
        let view = dequeueReusableHeaderFooterView(withIdentifier: id)
        
        return view as! T
    }
    
    func cell(_ identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        return cell
    }
    
    func cell<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        
        let id = String(describing: cell)
        
        let cell = dequeueReusableCell(withIdentifier: id, for: indexPath) as! T
        
        return cell
    }
    
    func cell<T: UITableViewCell>(_ cell: T.Type) -> T {
        
        let id = String(describing: cell)
        
        let cell = dequeueReusableCell(withIdentifier: id) as! T
        
        return cell
    }
    
    
    
    
    func reloadDataWith(completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
            self.layoutIfNeeded()
        }) { _ in completion() }
    }
}
