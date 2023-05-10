//
//  PersonalVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 27/03/23.
//

import Foundation
import UIKit

extension PersonalVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == genderTable{
            return genderArray.count
        }else{
            return sexualityArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalTableCell", for: indexPath) as! PersonalTableCell
        if tableView == genderTable{
            cell.cellLabel.text = genderArray[indexPath.row]
        }else{
            cell.cellLabel.text = sexualityArray[indexPath.row]
        }
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.updateConstraints()
    }
    
}
