//
//  UICollectionView.swift
//  Utility
//
//  Created by Omar Allaham on 4/16/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    var isEmpty: Bool {
        return (0..<numberOfSections).first(where: { numberOfItems(inSection: $0) > 0 }) == nil
    }
    
    func register<T: UICollectionViewCell>(_ cell: T.Type) {
        
        let id = String(describing: cell.classForCoder())
        
        register(UINib(id), forCellWithReuseIdentifier: id)
    }
    
    func register<T: UICollectionReusableView>(_ cell: T.Type, ofKind kind: String) {
        
        let id = String(describing: cell.classForCoder())
        
        register(UINib(id), forSupplementaryViewOfKind: kind, withReuseIdentifier: id)
    }
    
    func registerHeader<T: UICollectionReusableView>(_ cell: T.Type) {
        
        register(cell, ofKind: UICollectionView.elementKindSectionHeader)
    }
    
    func registerFooter<T: UICollectionReusableView>(_ cell: T.Type) {
        
        register(cell, ofKind: UICollectionView.elementKindSectionFooter)
    }
    
    func cell<T: UICollectionViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        let id = String(describing: cell.classForCoder())
        
        let cell = dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! T
        
        cell.tintColor = tintColor
        
        return cell
    }
    
    func cell<T: UICollectionReusableView>(_ cell: T.Type, for indexPath: IndexPath, ofKind kind: String) -> T {
        let id = String(describing: cell.classForCoder())
        
        let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: id, for: indexPath) as! T
        
        cell.tintColor = tintColor
        
        return cell
    }
    
    func header<T: UICollectionReusableView>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        return self.cell(cell, for: indexPath, ofKind: UICollectionView.elementKindSectionHeader)
    }
    
    func footer<T: UICollectionReusableView>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        return self.cell(cell, for: indexPath, ofKind: UICollectionView.elementKindSectionFooter)
    }
}

