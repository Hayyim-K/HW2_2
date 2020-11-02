//
//  ViewController.swift
//  HW2_2
//
//  Created by vitasiy on 16.10.2020.
//  Copyright © 2020 b2banalytica. All rights reserved.
//

import UIKit

//protocol UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField)
//}

class SettingsViewController: UIViewController {

    enum TypeOfColore {
        case red
        case green
        case blue
    }
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redNameLable: UILabel!
    @IBOutlet weak var greenNameLable: UILabel!
    @IBOutlet weak var blueNameLable: UILabel!
    
    @IBOutlet weak var redInfluenceLable: UILabel!
    @IBOutlet weak var greenInfluenceLable: UILabel!
    @IBOutlet weak var blueInfluenceLable: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    
    var delegate: SettingsViewControllerDelegate!
    var colorFromStartVC: UIColor!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 20
        colorView.layer.borderWidth = 3
        colorView.layer.borderColor = CGColor(
            srgbRed: 0,
            green: 0,
            blue: 0,
            alpha: 1
        )
                                               
        
        colorView.backgroundColor = colorFromStartVC
        
        nameLabelesSet()
        
        slidersSet()
        
        influenceLablesSet()
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
    
    @IBAction func doneButtonPressed() {
        
        delegate.saveColor(colorView.backgroundColor!)
        dismiss(animated: true)
    }
    
    private func coloreViewSet() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
    }
    
    private func nameLabelesSet() {
        redNameLable.text = "Red:"
        greenNameLable.text = "Green:"
        blueNameLable.text = "Blue:"
        
        redNameLable.textAlignment = .right
        greenNameLable.textAlignment = .right
        blueNameLable.textAlignment = .right
    }
    
    private func influenceLablesSet() {
        redInfluenceLable.text = String(format: "%1.2f", redSlider.value)
        greenInfluenceLable.text = String(format: "%1.2f", greenSlider.value)
        blueInfluenceLable.text = String(format: "%1.2f", blueSlider.value)
        
        redInfluenceLable.textAlignment = .left
        greenInfluenceLable.textAlignment = .left
        blueInfluenceLable.textAlignment = .left
    }
    
    private func slidersSet() {
        redSlider.minimumTrackTintColor = .systemRed
        greenSlider.minimumTrackTintColor = .systemGreen
        blueSlider.minimumTrackTintColor = .systemBlue
      
        let swiftColor = colorView.backgroundColor!
        if let rgb = swiftColor.rgb() {
            print(rgb)
            redSlider.value = Float(rgb.red) / 255
            greenSlider.value = Float(rgb.green) / 255
            blueSlider.value = Float(rgb.blue) / 255
        } else {
            print("conversion failed")
        }
        
    }
    
    private func addColorSlider(colore: TypeOfColore) {
        
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
        coloreViewSet()
    }
    
    
}

// MARK: Text Field Delegate
extension SettingsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == redTextField {
            greenTextField.becomeFirstResponder()
        } else if textField == greenTextField {
            blueTextField.becomeFirstResponder()
        } else {
            doneButtonPressed()
        }
        
//        switch textField {
//        case redTextField:
//            greenTextField.becomeFirstResponder()
//        case greenTextField:
//            blueTextField.becomeFirstResponder()
//        case blueTextField:
//            doneButtonPressed()
//        default:
//            view.endEditing(true)
//        }
        return true
        
    }
}

// MARK: UIColor differentiation
// здесь не очень понятно что такое & и почему Int * 255... но этим кодом я воспользовался и получил результат - слайдеры принимают правильные значения
extension UIColor {
    
    func rgb() -> (red:Int, green:Int, blue:Int, alpha:Int)? {
        var fRed: CGFloat = 0
        var fGreen: CGFloat = 0
        var fBlue: CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)
            
            return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
        } else {
            return nil
        }
    }
}

