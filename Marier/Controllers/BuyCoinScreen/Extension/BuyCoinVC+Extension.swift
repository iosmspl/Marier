//
//  BuyCoinVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 09/05/23.
//

import Foundation
import UIKit

extension BuyCoinVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DropDownArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DropDownTabelView.dequeueReusableCell(withIdentifier: "BuyCoinTabelCell", for: indexPath) as! BuyCoinTabelCell
        
        cell.lbl_Drop.text = DropDownArray[indexPath.row]
        
        if selectedIndex == indexPath.row {
            cell.imgView.image = UIImage(named: "Tick")
            return cell
        }
        else{
            cell.imgView.image = UIImage(named: "")
            return cell
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectedOffere_lbl.text = DropDownArray[indexPath.row]
        selectedIndex = indexPath.row
        DropDownTabelView.reloadData()
        DropBoxHeight.constant = 0
    }
    
    
}
