//
//  ChatVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 16/05/23.
//

import Foundation
import UIKit
extension ChatVC: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return chatData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recverCell = ChatTabelView.dequeueReusableCell(withIdentifier: "ChatTabelCell", for: indexPath) as! ChatTabelCell
        let SenderCell = ChatTabelView.dequeueReusableCell(withIdentifier: "SenderChatTabelCell", for: indexPath) as! SenderChatTabelCell
        
        let type = chatData[indexPath.row].type
        let message = chatData[indexPath.row].message
        if type == TypeMessage.Recever{
            recverCell.lblRecever.text = message
            return recverCell
        }else{
            SenderCell.lblSender.text = message
            return SenderCell
        }
        
    }
    
    
    
}
