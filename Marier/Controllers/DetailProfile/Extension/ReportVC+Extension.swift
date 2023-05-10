//
//  ReportVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 11/04/23.
//

import Foundation
import UIKit
extension ReportVC: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ReportTable.dequeueReusableCell(withIdentifier: "ReportTableCell") as! ReportTableCell
        cell.OptionsLabel.text = optionArray[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        return CGFloat(tableView.)
//    }
//    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
