//
//  ViewController.swift
//  HW2_2
//
//  Created by vitasiy on 16.10.2020.
//  Copyright © 2020 b2banalytica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum TypeOfColore {
        case red
        case green
        case blue
    }
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
               
        coloreView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                             green: CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: 1)
        
        coloreView.layer.cornerRadius = 20
        coloreView.layer.borderWidth = 3
        coloreView.layer.borderColor = CGColor(srgbRed: 0,
                                               green: 0,
                                               blue: 0,
                                               alpha: 1)
        
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

    func addColorSlider(colore: TypeOfColore) {
        
        let lable: UILabel
        let slider: UISlider
        
        switch colore {
        case .red:
            lable = redInfluenceLable
            slider = redSlider
        case .green:
            lable = greenInfluenceLable
            slider = greenSlider
        case .blue:
            lable = blueInfluenceLable
            slider = blueSlider
        }
        
        lable.text = String(format: "%1.2f", slider.value)
        coloreView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                             green: CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: 1)
    }
    
    
    @IBAction func addRedBySlider() {
        addColorSlider(colore: .red)
    }
    
    @IBAction func addGreenSlider() {
       addColorSlider(colore: .green)
    }
    
    @IBAction func addBlueSlider() {
       addColorSlider(colore: .blue)
    }
    
}

