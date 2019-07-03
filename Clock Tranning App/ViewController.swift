//
//  ViewController.swift
//  Clock Tranning App
//
//  Created by Marc Gallardo on 07/06/2019.
//  Copyright © 2019 Marc Gallardo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnMain: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setButtonView()
    }
    
    private func setButtonView(){
        btnMain.layer.cornerRadius = 8
        btnMain.backgroundColor = UIColor.yellow
    }

    @IBAction func openSetClockViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "setClockViewController")
        self.present(controller, animated: true, completion: nil)
    }
    
}

