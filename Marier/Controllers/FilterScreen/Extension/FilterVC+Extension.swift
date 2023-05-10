//
//  FilterVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 02/05/23.
//

import Foundation
import UIKit
 
extension FilterVC : UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == GenderTable {
            return GenderArray.count
        }else{
            return sexualityArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalTableCell") as! PersonalTableCell
        if tableView == GenderTable{
            cell.cellLabel.text = GenderArray[indexPath.row]
          return cell
        }else{
            cell.cellLabel.text = sexualityArray[indexPath.row]
            return cell
        }
    }
    
    
}
