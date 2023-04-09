//
//  PayTicketViewController.swift
//  E-Ticket
//
//  Created by STARK on 9.04.2023.
//

import UIKit

class PayTicketViewController: UIViewController {
    
    
    
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
        
        
    }
    

}
