//
//  ChatVC.swift
//  Marier
//
//  Created by MacBook M1 on 16/05/23.
//

import UIKit

class ChatVC: UIViewController {
    @IBOutlet weak var ChatTabelView: UITableView!
    @IBOutlet weak var bottomView: NSLayoutConstraint!
    @IBOutlet weak var SendMessageBtn: UIButton!
    @IBOutlet weak var MessageTextField: UITextField!
    let BottomMargen = 5
    var chatData = [chatModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ChatTabelView.register(UINib(nibName: "ChatTabelCell", bundle: nil), forCellReuseIdentifier: "ChatTabelCell")
        ChatTabelView.register(UINib(nibName: "SenderChatTabelCell", bundle: nil), forCellReuseIdentifier: "SenderChatTabelCell")
        
        // observers for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboradWillhide), name: UIResponder.keyboardWillHideNotification, object: nil)
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(self.Endediting))
        ChatTabelView.addGestureRecognizer(tapgesture)
        // Do any additional setup after loading the view.
    }
   @objc func Endediting(){
        MessageTextField.endEditing(true)
        
    }
    
    @objc func keyBoardWillShow(notification: Notification){
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else{
            return
        }
        let KeyboradHeight = keyboardFrame.height
        bottomView.constant = KeyboradHeight-30
        
        
        
    }
    @objc func keyboradWillhide(){
        bottomView.constant = CGFloat(BottomMargen)
    }
    
    
    
    @IBAction func SendBtnTapped(_ sender: UIButton) {
        let textFieldtxt = MessageTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if textFieldtxt != ""{
            let mesg = chatModel(user: "", message: textFieldtxt , type: .Sender)
            chatData.append(mesg)
            DispatchQueue.main.asyncAfter(deadline: .now()+3.0){ [self] in
                let msg = chatModel(user: "", message: "hjhfhjfddjgfdjgfdjgfjgsjfgjgfjgfsgfsjgfgfgjfxjgffdxdgf", type: .Recever)
                chatData.append(msg)
                ChatTabelView.reloadData()
                tabelToscrole(Row: chatData.count-1, tabletoScrolle: ChatTabelView)
            }
            ChatTabelView.reloadData()
            tabelToscrole(Row: chatData.count-1, tabletoScrolle: ChatTabelView)
        }
        
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
    }
    
    
    @IBAction func ProfilePicTapped(_ sender: UIButton) {
//        print("|||||||click|||")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

}
