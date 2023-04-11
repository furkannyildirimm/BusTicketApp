//
//  PayTicketViewController.swift
//  E-Ticket
//
//  Created by Furkan YILDIRIM on 9.04.2023.
//

import UIKit

class PayTicketViewController: UIViewController {
    
    let paymentTimeLimit: TimeInterval = 20
    var remainingTime: TimeInterval = 0
    var timer: Timer?
    
    
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var ıdTextField: UITextField!
    @IBOutlet weak var payNameSurname: UITextField!
    @IBOutlet weak var cardCvc: UITextField!
    @IBOutlet weak var expirationDate: UITextField!
    @IBOutlet weak var cardNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.placeholder = "Name"
        surnameTextField.placeholder = "Surname"
        ıdTextField.placeholder = "ID"
        phoneNumberTextField.placeholder = "Phone Number"
        payNameSurname.placeholder = "Name Surname"
        cardNumber.placeholder = "Card Number"
        expirationDate.placeholder = "Month/Year"
        cardCvc.placeholder = "369"
        
        startTimer()
        
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        completePayment()
    }
    
    func startTimer(){
        remainingTime = paymentTimeLimit
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        remainingTime -= 1
        
        if remainingTime == 0 {
            timer?.invalidate()
            timer = nil
            navigationController?.popViewController(animated: true)
        }
        
        updateCountdownLabel()
        
    }
    
    func updateCountdownLabel() {
        let minutes = Int(remainingTime) / 60
        let seconds = Int(remainingTime) % 60
        countdownLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    @IBAction func completePayment() {
        // Ödeme işlemini tamamladığınızda timer'ı durdurun
        timer?.invalidate()
        timer = nil
    }
        
        
        
        
        @IBAction func payBtn(_ sender: UIButton) {
            guard let name = nameTextField.text, !name.isEmpty,
                  let surname = surnameTextField.text, !surname.isEmpty,
                  let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty,
                  let id = ıdTextField.text, !id.isEmpty,
                  let payName = payNameSurname.text, !payName.isEmpty,
                  let cardNum = cardNumber.text, !cardNum.isEmpty,
                  let expDate = expirationDate.text, !expDate.isEmpty,
                  let cvc = cardCvc.text, !cvc.isEmpty
            else {
                
                Alert.showAlert(alertTitle: "Error", alertMessage: "Please fill in all fields.", defaultTitle: "OK", cancelTitle: "Cancel", viewController: self)
                return
            }
            UserDefaults.standard.set(nameTextField.text!, forKey: "Name")
            UserDefaults.standard.set(surnameTextField.text!, forKey: "Surname")
            UserDefaults.standard.set(ıdTextField.text!, forKey: "ID")
            UserDefaults.standard.set(phoneNumberTextField.text!, forKey: "Phone")
            
        }
    
    
    }
    
        
    

