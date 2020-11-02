//
//  StartViewController.swift
//  HW2_2
//
//  Created by vitasiy on 01.11.2020.
//  Copyright © 2020 b2banalytica. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func saveColor(_ color: UIColor)
}

class StartViewController: UIViewController {
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newContactVC = segue.destination as! SettingsViewController
        newContactVC.colorFromStartVC = view.backgroundColor
        newContactVC.delegate = self
        
    }
    
    
}
extension StartViewController: SettingsViewControllerDelegate {
    func saveColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}
