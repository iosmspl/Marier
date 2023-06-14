//
//  DetailProfileVC.swift
//  Marier
//
//  Created by MacBook M1 on 07/04/23.
//

import UIKit
import AlamofireImage
import CoreLocation
class DetailProfileVC: UIViewController {
    var geocoding = CLGeocoder()
    var menuClicked = false
    @IBOutlet weak var MenuView: UIView!
    @IBOutlet weak var DetailCollection: UICollectionView!
    @IBOutlet weak var StarBtn: UIButton!
    @IBOutlet weak var LikeBtn: UIButton!
    @IBOutlet weak var DislikeBtn: UIButton!
    @IBOutlet weak var bio: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var interests: UILabel!
    @IBOutlet weak var userpic: UIImageView!
    
    var avatar: String?
    var bioUser: String?
    var genderUser: String?
    var userLocation: String?
    var interestsUser = [GetallInterData]()
    var nameUser: String?
    var galleryUser = [Gallery]()
    var location = [Double]()
    let imgArrayTemp = [UIImage(named: "i1"),UIImage(named: "i2")
                  ,UIImage(named: "i3"),UIImage(named: "i4"),
                    UIImage(named: "i5")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuView.isHidden = true
        let arrayBtn:[UIButton] = [StarBtn,LikeBtn,DislikeBtn]
        for btn in arrayBtn{
            btn.layer.cornerRadius = 25
            btn.layer.masksToBounds = false
            btn.layer.shadowColor = UIColor.black.cgColor
            btn.layer.shadowOffset = CGSize(width: 0, height: 2)
            btn.layer.shadowRadius = 2
            btn.layer.shadowOpacity = 0.5
            
        }
        
        
        DetailCollection.register(UINib(nibName: "DetailProfileCollectionCell", bundle: nil), forCellWithReuseIdentifier: "DetailProfileCollectionCell")
        setData()
        // Do any additional setup after loading the view.
    }
    
    func setData(){
        bio.text = "\(bioUser ?? "")" 
        gender.text = genderUser ?? ""
        name.text = nameUser ?? ""
        if interestsUser.isEmpty == false {
            var interstUser = ""
            var count = 0
            for interes in interestsUser{
//                print("\(interes)")
//               interstUser = interstUser + "\((interes.interest) ?? "")"
                interstUser.append(contentsOf: "\((interes.interest) ?? "")")
//                print("\(count < interstUser.count-1),\(interestsUser.count)")
                if count < interestsUser.count-1{
                    interstUser.append(", ")
                }
                count += 1
            }
            interests.text = interstUser
        }
        if avatar !=  ""{
            userpic.af.setImage(withURL: URL(string: avatar ?? "")!)
        }
        if location.isEmpty == false {
            
            reverseGeocoding(lati: location[0], longi: location[1]) { Address in
                self.from.text = Address
            }

        }
    }
    
    
    
    
    @IBAction func BackTapped(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
     
    @IBAction  func menuTapped(_ sender: UIButton){
//        if menuClicked == false{
//            MenuView.isHidden = false
//            menuClicked = true
//        }else{
//            MenuView.isHidden = true
//            menuClicked = false
//        }
        let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "ShareVC") as! ShareVC
               self.present(vc, animated: true)

        
    }
    
    @IBAction func ShareTapped(_ sender: UIButton) {
//        let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "ShareVC") as! ShareVC
//               self.present(vc, animated: true)
    }
    
    @IBAction func ReportTapped(_ sender: UIButton) {
//        let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "ReportVC") as! ReportVC
//               self.present(vc, animated: true)
    }
    
    
    
}
