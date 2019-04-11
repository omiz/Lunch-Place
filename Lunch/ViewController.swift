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
    
    @IBOutlet weak var resultLabel: UILabel!
    
    lazy var slices: [CarnivalWheelSlice] = makeSlices()
    
    func makeSlices() -> [CarnivalWheelSlice] {
        return []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinningWheel.slices = slices
        spinningWheel.equalSlices = true
        spinningWheel.frameStroke.width = 0
        
        
        spinningWheel.initialDrawingOffset = -90
        
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
        
        self.resultLabel.text = nil
        
        let count = spinningWheel.slices.count
        
        spinButton.isEnabled = false
        
        var index: Int = .random(in: 0..<count)
        
        if index == 0 {
            index = Int.random(in: 0..<count)
        }
        
        self.spinningWheel.startAnimating(fininshIndex: index) { finished in
            
            guard finished else { return }
            
            self.spinButton.isEnabled = true
            
            self.resultLabel.text = self.spinningWheel.slices[index].title
        }
    }
}

