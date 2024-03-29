//
//  HomeViewController.swift
//  E-Ticket
//
//  Created by Furkan YILDIRIM on 1.04.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    let cities = ["Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin", "Aydın", "Balıkesir", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir", "Kars", "Kastamonu", "Kayseri", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya", "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Şanlıurfa", "Uşak", "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt", "Karaman", "Kırıkkale", "Batman", "Şırnak", "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük", "Kilis", "Osmaniye", "Düzce"]
    
    @IBOutlet weak var chooseCityView: UIPickerView!
    @IBOutlet weak var chooseCityTwoView: UIPickerView!
    @IBOutlet weak var selectDepLabel: UILabel!
    @IBOutlet weak var selectArrLabel: UILabel!
    @IBOutlet weak var selectDateLabel: UILabel!
    @IBOutlet weak var imageLocTwo: UIImageView!
    @IBOutlet weak var imageLocOne: UIImageView!
    @IBOutlet weak var dateView: UIDatePicker!
    @IBOutlet weak var searchBtn: UIButton!
    var info = TravelMoveModel()
    var fromData = "Adana"
    var toData = "Adana"
    var date : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateView.minimumDate = Date()
        
    }
    
    @IBAction func searchBtn(_ sender: UIButton) {
        
        if fromData == toData {
            Alert.showAlert(alertTitle: "Warning!", alertMessage: "You have selected the same city.", defaultTitle: "OK", cancelTitle: "Cancel", viewController: self)
        }else {
            
            getMoveData()
            saveData()
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "ticketViewController") as! TicketViewController
            vc.navigationItem.largeTitleDisplayMode = .never
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            vc.ticketMove = info
            navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    func saveData() {
        UserDefaults.standard.set(fromData, forKey: "fromLocation")
        UserDefaults.standard.set(toData, forKey: "toLocation")
        UserDefaults.standard.set(self.date, forKey: "date")
    }
    
    @IBAction func dateSelectedFromDatePicker(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        selectDateLabel.text = dateFormatter.string(from: dateView.date)
    }
    
    func getMoveData(){
        let date = dateView.calendar.dateComponents([.day,.month,.year], from: dateView.date)
        info.from = fromData
        info.to = toData
        info.day = date.day!
        info.month = date.month!
        info.year = date.year!
        self.date = "\(date.day!)" + "/" + "\(date.month!)" + "/" + "\(date.year!)"
    }
}


extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == chooseCityView {
            fromData = cities[row]
        } else if pickerView == chooseCityTwoView {
            toData = cities[row]
        }
    }
}


