//
//  setClockViewController.swift
//  Clock Tranning App
//
//  Created by Marc Gallardo on 07/06/2019.
//  Copyright © 2019 Marc Gallardo. All rights reserved.
//

import Foundation

import UIKit

class setClockViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var btnIntervals: UIButton!
    @IBOutlet weak var btnPrepareTime: UIButton!
    @IBOutlet weak var btnWorkTime: UIButton!
    @IBOutlet weak var btnRestTime: UIButton!
    @IBOutlet weak var btnCooldownTime: UIButton!
    @IBOutlet weak var btnContinue: UIButton!
    
    @IBOutlet weak var txtFieldIntervals: UITextField!
    @IBOutlet weak var txtFieldPrepareTime: UITextField!
    @IBOutlet weak var txtFieldWorkoutTime: UITextField!
    @IBOutlet weak var txtFieldRestTime: UITextField!
    @IBOutlet weak var txtFieldCooldownTime: UITextField!
    
    @IBOutlet weak var scrollViewConfigureClock: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setButtonView()
        self.setTextFieldDelegate()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(
            dismissKeyboard))
        view.addGestureRecognizer(tap)
        setTextFieldStart()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTextFieldStart()
        self.scrollViewConfigureClock.setContentOffset(.zero, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
    }
    
    // MARK: Setbutton Views
    
    private func setButtonView(){
        btnIntervals.layer.cornerRadius = 6
        btnIntervals.backgroundColor = UIColor.yellow
        
        btnPrepareTime.layer.cornerRadius = 6
        btnPrepareTime.backgroundColor = UIColor.yellow
        
        btnWorkTime.layer.cornerRadius = 6
        btnWorkTime.backgroundColor = UIColor.yellow
        
        btnRestTime.layer.cornerRadius = 6
        btnRestTime.backgroundColor = UIColor.yellow
        
        btnCooldownTime.layer.cornerRadius = 6
        btnCooldownTime.backgroundColor = UIColor.yellow
        
        btnContinue.layer.cornerRadius = 6
        btnContinue.backgroundColor = UIColor.yellow
    }
    
    // MARK: Set delegate textfields
    
    private func setTextFieldDelegate(){
        txtFieldRestTime.delegate = self
        txtFieldIntervals.delegate = self
        txtFieldPrepareTime.delegate = self
        txtFieldWorkoutTime.delegate = self
        txtFieldCooldownTime.delegate = self
    }
    
    private func setTextFieldStart(){
        txtFieldIntervals.text = "0"
        txtFieldRestTime.text = "0"
        txtFieldCooldownTime.text = "0"
        txtFieldWorkoutTime.text = "0"
        txtFieldPrepareTime.text = "0"
    }
    
    // MARK: UITEXTFIELD method delegates
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == txtFieldIntervals{
            txtFieldPrepareTime.becomeFirstResponder()
        } else if textField == txtFieldPrepareTime{
            txtFieldWorkoutTime.becomeFirstResponder()
        } else if textField == txtFieldWorkoutTime{
            txtFieldRestTime.becomeFirstResponder()
        } else if textField == txtFieldRestTime{
            txtFieldCooldownTime.becomeFirstResponder()
        } else if textField == txtFieldCooldownTime{
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtFieldIntervals{
            textField.text = ""
        } else if textField == txtFieldPrepareTime{
            textField.text = ""
        } else if textField == txtFieldWorkoutTime{
            textField.text = ""
        } else if textField == txtFieldRestTime{
            textField.text = ""
        } else if textField == txtFieldCooldownTime{
            textField.text = ""
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    @IBAction func tappedContinueToClock(_ sender: Any) {
        let clockTime = ClockTime()
        let stringIntervals = self.txtFieldIntervals.text
        let prepareTime = self.txtFieldPrepareTime.text
        let workoutTime = self.txtFieldWorkoutTime.text
        let restTime = self.txtFieldRestTime.text
        let cooldownTime = self.txtFieldCooldownTime.text
        
        clockTime.intervals = Int(stringIntervals ?? "") ?? 0
        clockTime.prepareTimeSeconds = Int(prepareTime ?? "") ?? 0
        clockTime.workTimeSeconds = Int(workoutTime ?? "") ?? 0
        clockTime.restTime = Int(restTime ?? "") ?? 0
        clockTime.cooldownTime = Int(cooldownTime ?? "") ?? 0
        
        // TO DO: Si los intervalos son 0 sacar un alert Controller
        if clockTime.intervals == 0{
            let alertController = UIAlertController(title: "Error", message: "One field is empty", preferredStyle: .alert)
            
            let action1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                print("You've pressed default");
            }
            
            alertController.addAction(action1)
            self.present(alertController, animated:  true, completion: nil)
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "clocktimeview")
            self.present(controller, animated: true, completion: nil)
        }
    }
}
