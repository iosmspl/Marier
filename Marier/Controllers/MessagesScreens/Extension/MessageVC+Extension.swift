//
//  MessageVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 15/05/23.
//

import Foundation
import UIKit

extension MessageVC: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MessageTabelView.dequeueReusableCell(withIdentifier: "MessageTabelCell", for: indexPath) as! MessageTabelCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StoryBoards.ChatBoard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
