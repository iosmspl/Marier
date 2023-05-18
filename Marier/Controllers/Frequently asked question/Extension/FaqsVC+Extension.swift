//
//  FaqsVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 10/05/23.
//

import Foundation
import UIKit

extension FaqsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FaqsTableView.dequeueReusableCell(withIdentifier: "FaqusTabeleCell", for: indexPath) as! FaqusTabeleCell
        cell.lblQues.text = "Sample Question \(indexPath.row)"
        if SelectedIndex == indexPath.row{
            cell.imgPlusMinus.image = UIImage(named: "minus")
            cell.lblAns.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed venenatis volutpat risus vitae iaculis. Duis laoreet molestie efficitur. Aenean arcu velit, vestibulum a libero vel, sollicitudin posuere dui.  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed venenatis volutpat risus vitae iaculis. Duis laoreet molestie efficitur. "
        }else{
            cell.imgPlusMinus.image = UIImage(named: "plus")
            cell.lblAns.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SelectedIndex = indexPath.row
        FaqsTableView.reloadData()
        
    }
    
    
    
}
