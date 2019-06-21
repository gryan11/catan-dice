//
//  ViewController.swift
//  catandice
//
//  Created by Gabriel Ryan on 6/20/19.
//  Copyright © 2019 Gabriel Ryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var resetInd:Int = 30;
    var rollInd:Int = 36;
    
    var rolls:[(Int, Int)] = [];

    

    
//    required init?(coder aDecoder: NSCoder) {
//        super.init();
//        ResetRoll = 30;
//        rollInd = 0;
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var Die1: UILabel!
    
    @IBOutlet weak var Die2: UILabel!
    
    @IBOutlet weak var Die3: UILabel!
    
    @IBAction func roll_button(_ sender: Any) {
        
        if (rollInd > resetInd) {
        
            rolls = resetRolls();
            rollInd = 0;
        }
        
        Die1.text = String(rolls[rollInd].0);
        Die2.text = String(rolls[rollInd].1);
        Die3.text = String(Int.random(in: 1...12));
        
        rollInd += 1;
    }
    
    func shuffle(ap: [(Int, Int)]) -> [(Int, Int)] {
        var a:[(Int, Int)] = ap;
        var j:Int; var x:(Int, Int);
        
        for i in 0..<a.count {
            j = Int.random(in: 0 ... i + 1);
            x = a[i];
            a[i] = a[j];
            a[j] = x;
        }
        return a;
    }
    
    func resetRolls () -> [(Int, Int)] {
        var rolls:[(Int, Int)] = [];
    
//        for (var i=1; i<=6; i++) {
        for i in 1...6 {
//            for (var j=1; j<=6; j++) {
            for j in 1...6 {
                rolls.append((i, j));
            }
        }
    
        rolls = shuffle(ap: rolls);
    
        return rolls;
    }
}

