//
//  ViewController.swift
//  Weather
//
//  Created by Ngoc on 8/20/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lbl_city: UILabel!
    
    @IBOutlet weak var lbl_proverb: UILabel!
    
    @IBOutlet weak var imv_background: UIImageView!
    
    @IBOutlet weak var temperature: UIButton!
    
    @IBOutlet weak var lbl_tempScale: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getTemp()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var cities = ["Hanoi","Haiphong","Danang"]
    
    var proverbs = ["The pen is mightier than the sword.", "Keep your friends close and your enemies closer", "Actions speak louder than words." ]
    
    var backgroundImages = ["Blood", "Moon", "Sun"]
    
    var temp: Double = 0.0
    
    var state: Bool = true
    
    @IBAction func action_random(sender: AnyObject) {
        
        let cityIndex = Int(arc4random_uniform(UInt32(cities.count)))
        
        lbl_city.text = cities[cityIndex]
        
        let proverbIndex = Int(arc4random_uniform(UInt32(proverbs.count)))
        
        lbl_proverb.text = proverbs[proverbIndex]
        
        let imageIndex = Int(arc4random_uniform(UInt32(backgroundImages.count)))
        
        
        imv_background.image = UIImage.init(named: backgroundImages[imageIndex])
        
        getTemp()
    }
    
    
    @IBAction func action_changeToFahrenheit(sender: AnyObject) {
        
        
        if(state == true){
            
            state = false
            
            lbl_tempScale.text = "F"
            
            temp = changeCelsiusToFahrenheit(temp)
            
            temperature.setTitle(String(format: "%2.1f",temp), forState: .Normal)
            
            
        }else{
            state = true
            
            lbl_tempScale.text = "C"
            
            temp = changeFahrenheitToCelsius(temp)
            
            temperature.setTitle(String(format: "%2.1f",temp), forState: .Normal)
        }
        
    }
    
    
    func getTemp() -> Void{
        
        temp = tempRandom()
        
        temperature.setTitle(String(format: "%2.1f", temp), forState: .Normal)
        
        
    }
    
    func tempRandom() -> Double {
        
        var tempRandom: Double = 0.0
        
        if(state == true){
            tempRandom = Double(arc4random_uniform(18) + 14) + Double(arc4random())/Double(INT32_MAX)
        }else{
            tempRandom = Double(arc4random_uniform(18) + 50) + Double(arc4random())/Double(INT32_MAX)
        }
        
        return tempRandom
    }
    
    func changeCelsiusToFahrenheit(tempByC: Double) -> Double{
        
        return (9/5 * tempByC + 32)
        
    }
    
    func changeFahrenheitToCelsius(tempByF: Double) -> Double{
        return ((tempByF - 32) * 5/9)
    }

}

