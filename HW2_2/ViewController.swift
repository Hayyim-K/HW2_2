//
//  ViewController.swift
//  HW2_2
//
//  Created by vitasiy on 16.10.2020.
//  Copyright © 2020 b2banalytica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coloreView: UIView!
    
    @IBOutlet weak var redNameLable: UILabel!
    @IBOutlet weak var greenNameLable: UILabel!
    @IBOutlet weak var blueNameLable: UILabel!
    
    @IBOutlet weak var redInfluenceLable: UILabel!
    @IBOutlet weak var greenInfluenceLable: UILabel!
    @IBOutlet weak var blueInfluenceLable: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var currentRedValue: CGFloat = 0
    var currentGreenValue: CGFloat = 0
    var currentBlueValue: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        currentRedValue = CGFloat(redSlider.value)
        currentGreenValue = CGFloat(greenSlider.value)
        currentBlueValue = CGFloat(blueSlider.value)
        
        coloreView.backgroundColor = UIColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: 1)
        
        coloreView.layer.cornerRadius = 20
        coloreView.layer.borderWidth = 3
        coloreView.layer.borderColor = CGColor(srgbRed: 0, green: 0, blue: 0, alpha: 1)
        
        redNameLable.text = "Red:"
        greenNameLable.text = "Green:"
        blueNameLable.text = "Blue:"
        
        redNameLable.textAlignment = .right
        greenNameLable.textAlignment = .right
        blueNameLable.textAlignment = .right
        
        redInfluenceLable.text = String(redSlider.value)
        greenInfluenceLable.text = String(greenSlider.value)
        blueInfluenceLable.text = String(blueSlider.value)
        
        redInfluenceLable.textAlignment = .left
        greenInfluenceLable.textAlignment = .left
        blueInfluenceLable.textAlignment = .left
     
        redSlider.minimumTrackTintColor = .systemRed
        greenSlider.minimumTrackTintColor = .systemGreen
        blueSlider.minimumTrackTintColor = .systemBlue
        
    }


    @IBAction func addRedBySlider() {
        currentRedValue = CGFloat(redSlider.value)
        redInfluenceLable.text = String(format: "%1.2f", redSlider.value)
        coloreView.backgroundColor = UIColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: 1)
    }
    
    
    @IBAction func addGreenSlider() {
        currentGreenValue = CGFloat(greenSlider.value)
        greenInfluenceLable.text = String(format: "%1.2f", greenSlider.value)
        coloreView.backgroundColor = UIColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: 1)
    }
    
    
    @IBAction func addBlueSlider() {
        currentBlueValue = CGFloat(blueSlider.value)
        blueInfluenceLable.text = String(format: "%1.2f", blueSlider.value)
        coloreView.backgroundColor = UIColor(red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: 1)
    }
    
}

