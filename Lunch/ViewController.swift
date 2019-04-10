//
//  ViewController.swift
//  Lunch
//
//  Created by Omar Allaham on 4/10/19.
//  Copyright © 2019 Martian Bears. All rights reserved.
//

import UIKit
import TTFortuneWheel

class ViewController: UIViewController {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var spinningWheel: TTFortuneWheel!
    
    lazy var slices: [CarnivalWheelSlice] = makeSlices()
    
    func makeSlices() -> [CarnivalWheelSlice] {
        return [.init(title: "Amplio"),
                .init(title: "Block House"),
                .init(title: "Rewe"),
                .init(title: "Prime kabab Donner"),
                .init(title: "Prime kabab chinese"),
                .init(title: "Prime kabab curry wurst"),
                .init(title: "Amplio"),
                .init(title: "L'Osteria"),
                .init(title: "Thai"),
                .init(title: "Order in")]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinningWheel.slices = slices
        spinningWheel.equalSlices = true
        spinningWheel.frameStroke.width = 0
        
        slices.enumerated().forEach { (pair) in
            let slice = pair.element
            let offset = pair.offset
            switch offset % 4 {
            case 0: slice.style = .brickRed
            case 1: slice.style = .sandYellow
            case 2: slice.style = .babyBlue
            case 3: slice.style = .deepBlue
            default: slice.style = .brickRed
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func rotateButton(_ sender: Any) {
        
        let count = spinningWheel.slices.count
        
        spinningWheel.startAnimating()
        
        spinButton.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            
            self.spinningWheel.startAnimating(fininshIndex: .random(in: 0..<count)) { _ in
                
                self.spinButton.isEnabled = true
            }
        }
    }
}

