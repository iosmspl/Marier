//
//  EditProfileVC.swift
//  Marier
//
//  Created by MacBook M1 on 05/05/23.
//

import UIKit

class EditProfileVC: UIViewController {
    
    @IBOutlet weak var heightView: NSLayoutConstraint!
    var height:CGFloat = 750
    
    // texfields
    
    @IBOutlet weak var aboutTextField: UITextField!
    @IBOutlet weak var AgeTextField: UITextField!
    @IBOutlet weak var BirthTextField: UITextField!
    @IBOutlet weak var GenderField: UITextField!
    @IBOutlet weak var passionField: UITextField!
    @IBOutlet weak var ProffesionField: UITextField!
    @IBOutlet weak var MediaField: UITextField!
    @IBOutlet weak var LivingField: UITextField!
    
    //^^^
    @IBOutlet weak var EditScroleView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         height = heightView.constant
        let FieldArray = [aboutTextField,AgeTextField,BirthTextField,GenderField,passionField,ProffesionField,MediaField,LivingField]
        for Field in FieldArray{
            Field?.delegate = self
        }

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardhide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }
    @IBAction func backTapped(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func keyboardShow(notification: Notification){
        
        guard  let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else{
            return
        }
        heightView.constant = height+keyboardFrame.height
//
//        let bottomOffset = CGPoint(x: 0, y: EditScroleView.contentSize.height - EditScroleView.bounds.size.height)
//
//        // Set the content offset and animate the scrolling if desired
//        EditScroleView.setContentOffset(bottomOffset, animated: true)
        
//        let keybordframe
        
    }
    @objc func keyboardhide(notification: Notification){
        heightView.constant = height
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
