//
//  ClockTimeViewController.swift
//  Clock Tranning App
//
//  Created by Marc Gallardo on 13/06/2019.
//  Copyright © 2019 Marc Gallardo. All rights reserved.
//

import Foundation

import UIKit

class ClockTimeViewController: UIViewController {
    @IBOutlet weak var btnSettings: UIButton!
    
    @IBAction func goToSettings(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
