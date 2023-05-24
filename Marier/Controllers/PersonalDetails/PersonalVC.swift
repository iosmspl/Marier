//
//  PersonalVC.swift
//  Marier
//
//  Created by MacBook M1 on 27/03/23.
//

import UIKit
import CoreLocation
class PersonalVC: UIViewController {
    let locationManger = CLLocationManager()
    let geocoder =  CLGeocoder()
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var BirthTxtField: UITextField!
    
    @IBOutlet weak var sexualityTable: UITableView!
    @IBOutlet weak var genderTable: UITableView!
    
    @IBOutlet weak var sexualityTableHeight: NSLayoutConstraint!
    @IBOutlet weak var genderTableHeight: NSLayoutConstraint!
    var longatude_: CLLocationDegrees?
    var latitude_: CLLocationDegrees?
    let genderArray = ["Male","Female","Non-Binary","Transgender Female","Transgender"]
    let sexualityArray = ["Straight","Gay","Lesbian","Bisexual","Pensexual","Transgender"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManger.requestWhenInUseAuthorization()
        locationManger.delegate = self
        locationManger.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }
    
    
    
    override func loadView() {
        super.loadView()
        sexualityTable.register(UINib(nibName: "PersonalTableCell", bundle: nil), forCellReuseIdentifier: "PersonalTableCell")
        genderTable.register(UINib(nibName: "PersonalTableCell", bundle: nil), forCellReuseIdentifier: "PersonalTableCell")
        
//
    }
    func updateConstraints(){
        sexualityTableHeight.constant = sexualityTable.contentSize.height
        genderTableHeight.constant = genderTable.contentSize.height
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func proceedTapped(_ sender: Any){
        
       
            
        
            
//        let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "InterestsVC") as! InterestsVC
//        self.navigationController?.pushViewController(vc, animated: true)
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
