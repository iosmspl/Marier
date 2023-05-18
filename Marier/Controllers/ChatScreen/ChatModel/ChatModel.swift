//
//  ChatModel.swift
//  Marier
//
//  Created by MacBook M1 on 16/05/23.
//

import Foundation

struct chatModel{
    let user : String?
    let message: String?
    let type : TypeMessage?
}

enum TypeMessage {
case Sender,Recever
}
