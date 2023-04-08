//
//  SeatViewController.swift
//  E-Ticket
//
//  Created by STARK on 3.04.2023.
//

import UIKit

final class SeatViewController: UIViewController{
    
    var totalSeats = 55

    @IBOutlet weak var seatsCollectionView: UICollectionView!
    
    @IBOutlet weak var selectedSeatsLabel: UILabel!
    var busTicketModel = BusTicket()
    var selectedIndexPath: IndexPath?
    var selectedSeats = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configureCollectionView()
        
        seatsCollectionView?.reloadData()

    }
    
    private func configureCollectionView(){
        
        seatsCollectionView.delegate = self
        seatsCollectionView.dataSource = self
        
    }
    
}

extension SeatViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 55
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // nasıl göründüğü
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seatCell", for: indexPath) as! SeatCollectionViewCell
        
        cell.seatNumberLabel.text = "\(indexPath.row + 1)"
        
        let hidden = (indexPath.row == 26 || indexPath.row == 25) || (indexPath.row - 2) % 5 == 0 && indexPath.row <= totalSeats
        
        cell.isHidden = hidden
        
        cell.setup(model: Seats(seatsImage: "seat", seatsNumber: indexPath.row + 1))

        if selectedSeats.contains(indexPath.row) {
            cell.backgroundColor = UIColor.orange
        } else {
            cell.backgroundColor = UIColor.clear
        }
        
        
        
        return cell
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    
            let selectedCell = collectionView.cellForItem(at: indexPath)
            
            let seatNumber = indexPath.row + 1
            
    
            if selectedSeats.contains(indexPath.row+1) {
                // If already selected, deselect
                if let index = selectedSeats.firstIndex(of: indexPath.row+1) {
                    selectedSeats.remove(at: index)
                }
                selectedCell?.backgroundColor = UIColor.clear
            } else {
                // If not selected, select if there are less than 5 seats selected
                if selectedSeats.count < 5 {
                    selectedSeats.append(indexPath.row+1)
                    selectedCell?.backgroundColor = UIColor.orange
                }else{
                    
                    Alert.showAlert(alertTitle: "UYARI", alertMessage: "5 Koltuktan fazla seçemezsin.", defaultTitle: "OK", cancelTitle: "Cancel", viewController: self)
                    
                }
                    
            }
            selectedSeatsLabel.text = selectedSeats.map { String($0) }.joined(separator: ", ")

    
            //print("Selected seats: \(selectedSeats)")
        }
    }
    
    
    
    

