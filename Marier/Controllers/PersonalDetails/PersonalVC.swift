//
//  PersonalVC.swift
//  Marier
//
//  Created by MacBook M1 on 27/03/23.
//

import UIKit
import CoreLocation
import ARSLineProgress
class PersonalVC: UIViewController {
    let locationManger = CLLocationManager()
    let geocoder =  CLGeocoder()
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var BirthTxtField: UITextField!
    @IBOutlet weak var textViewBio: UITextView!
    @IBOutlet weak var sexualityTable: UITableView!
    @IBOutlet weak var genderTable: UITableView!
    
    @IBOutlet weak var sexualityTableHeight: NSLayoutConstraint!
    @IBOutlet weak var genderTableHeight: NSLayoutConstraint!
    var selectGender: Int?
    var selectdDate: String?
    var SexualityArrayApi = [getAllsexuality]()
    var selectedSexualityArr = [String]()
    var SelectedSexualityInd = [String]()
    var addressUser: String?
    var longatude_: CLLocationDegrees?
    var latitude_: CLLocationDegrees?
    let genderArray = ["Male","Female","Non-Binary","Transgender Female","Transgender"]
    let sexualityArray = ["Straight","Gay","Lesbian","Bisexual","Pensexual","Transgender"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
       
        locationManger.startUpdatingLocation()
        
//        ApiManger.Shared.getAllsexuality { resdata, isSucces in
//            if isSucces{
//                let array = (resdata?.data)!
//                self.SexualityArrayApi = array
//
//            }
//        }
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
        
        print("this is sexulaityArray\(SexualityArrayApi)")
        ARSLineProgress.show()
        if latitude_ == nil || longatude_ == nil {
            latitude_ = 0
            longatude_ = 0
            addressUser = ""
        }

        if nameTxtField.text == "" || BirthTxtField.text == "" || selectGender == nil || SelectedSexualityInd.isEmpty == true || textViewBio.hasText == false{
            ARSLineProgress.hide()
            AlertDisplay(AlertTitle: "Missing", Message: "please fill all the details", Actiontitle: "ok")
        }else{
            var sex: String?
            if selectGender! >= 0 && selectGender! <= 1{
                sex = genderArray[selectGender!].lowercased()
            }else{
                sex = "other"
            }
            print("-\(addressUser)-----")

            let parem = UpdateApiParmes(name: nameTxtField.text, sex: sex, dob: BirthTxtField.text, bio: textViewBio.text , setting: Settings(location: Loc(type: "Point", coordinates: ["\(latitude_!)", "\(longatude_!)"])))
            ApiManger.Shared.updateApi(model: parem) { resData, isSuccess in
                if isSuccess {
//                ARSLineProgress.hide()
                let vc = StoryBoards.auth.instantiateViewController(withIdentifier: "InterestsVC") as! InterestsVC
//
                    ApiManger.Shared.getAllInterApi { resdataInterest, isSuccess in
                        if isSuccess {
                            vc.interestArray = (resdataInterest?.data)!

                            // add sexuality api
                            ApiManger.Shared.addSexualOrientaion(parem: sexulaity(sexualOrientations: self.selectedSexualityArr)) { message, isSucces in
                                if isSucces {
                                    ARSLineProgress.hide()
                                    self.navigationController?.pushViewController(vc, animated: true)
                                }else{
                                    ARSLineProgress.hide()
                                    self.AlertDisplay(AlertTitle: "Somthing Wrong", Message: "String", Actiontitle: "OK")
                                }
                            }

//
////                            self.navigationController?.pushViewController(vc, animated: true)
////
                        }else{
                            ARSLineProgress.hide()
                            print("somthing wrong getAllcomp")
                        }
                    }

//
//

                }
                else{
                    ARSLineProgress.hide()
                    self.AlertDisplay(AlertTitle: "Somthing went wrong", Message: "", Actiontitle: "OK")
                }
            }
        }

//
//
//
//
         
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
