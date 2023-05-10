//
//  FilterVC.swift
//  Marier
//
//  Created by MacBook M1 on 26/04/23.
//

import UIKit
import TTRangeSlider

class FilterVC: UIViewController {
    @IBOutlet weak var GenderTable: UITableView!
    @IBOutlet weak var SexualityTabel: UITableView!
    
    @IBOutlet weak var AgeSlider: TTRangeSlider!
    @IBOutlet weak var DistanceSlider: UISlider!
    @IBOutlet weak var ClassicRadioImg: UIImageView!
    @IBOutlet weak var GalleryRadioImg: UIImageView!
    var ChoesedHomeMode = "Classic"
    let GenderArray = ["Male","Female","Non-binary","Transgender","Transgender Female"]
    let sexualityArray = ["Straight","Gay","Lesbian","Bisexual","Pansexual","Transgender"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GenderTable.register(UINib(nibName: "PersonalTableCell", bundle: nil), forCellReuseIdentifier: "PersonalTableCell")
        SexualityTabel.register(UINib(nibName: "PersonalTableCell", bundle: nil), forCellReuseIdentifier: "PersonalTableCell")
        
        let colorpink = SetcolorRgb(red: 230, green: 84, blue: 160)
        let colorGrey = SetcolorRgb(red: 224, green: 224, blue: 224)
        
        
        // for age slider
        AgeSlider.minValue = 10
        AgeSlider.maxValue = 90
        AgeSlider.selectedMinimum = 20
        AgeSlider.selectedMaximum = 40
        AgeSlider.step = 1
        AgeSlider.tintColorBetweenHandles = colorpink
        AgeSlider.tintColor = colorGrey
        AgeSlider.lineHeight = 4
        AgeSlider.handleImage = UIImage(named: "radio")
        AgeSlider.minDistance = 1
        AgeSlider.handleDiameter = 20      // for distance slider
        DistanceSlider.tintColor = colorGrey
        DistanceSlider.minimumTrackTintColor = colorpink
        
//        let thumbImage = UIImage(named: "radio")?.resizableImage(withCapInsets: UIEdgeInsets(top: 5, left: 5 , bottom: 5, right: 5))
        DistanceSlider.setThumbImage(UIImage(named: "radio"), for: .normal)
        
//        DistanceSlider.
        
            // set the thumb color and border color
//            DistanceSlider.thumbImage = UIImage(named: "thumbImage")
        

        // For age slider
//        AgeSlider.minimumValu
        
        
        
        // Do any additional setup after loading the view.
        
//        if ChoesedHomeMode == "classic"{
//            ClassicRadioImg.image = UIImage(named: "activeRadio")
//            GalleryRadioImg.image = UIImage(named: "inactiveRadio")
//        }else{
//            GalleryRadioImg.image = UIImage(named: "activeRadio")
//            ClassicRadioImg.image = UIImage(named: "inactiveRadio")
//        }
        chosedmode()
    }
    
    func chosedmode(){
        if ChoesedHomeMode == "Classic"{
            ClassicRadioImg.image = UIImage(named: "activeRadio")
            GalleryRadioImg.image = UIImage(named: "inactiveRadio")
        }else{
            GalleryRadioImg.image = UIImage(named: "activeRadio")
            ClassicRadioImg.image = UIImage(named: "inactiveRadio")
        }
    }
    
    
    
    @IBAction func ClassicTapped(_ sender: UIButton) {
        
        ChoesedHomeMode = "Classic"
        chosedmode()
//        ClassicRadioImg.image = UIImage(named: "activeRadio")
//        GalleryRadioImg.image = UIImage(named: "inactiveRadio")
        
    }
    
    
    
    
    
    
    
    @IBAction func GalleryTapped(_ sender: UIButton){
        ChoesedHomeMode = "Gallery"
        chosedmode()
//        GalleryRadioImg.image = UIImage(named: "activeRadio")
//        ClassicRadioImg.image = UIImage(named: "inactiveRadio")
    }
    @IBAction func BackTapped(_ sender: UIButton){
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func saveTapped(_ sender: UIButton) {
        let Tabbar = StoryBoards.Discover.instantiateViewController(withIdentifier: "TabBarVc") as! TabBarVc
        var TabbarControllers = Tabbar.viewControllers
        if ChoesedHomeMode == "Classic"{
            UserDefaults.standard.set("classic", forKey: "homepage")
            let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "ClassicVC") as! ClassicVC
//           let tabbaritem = UITabBarItem(title: "", image: UIImage(named: ""), selectedImage: UIImage(named: ))
            TabbarControllers?[0] = vc
            Tabbar.viewControllers = TabbarControllers
            
            navigationController?.pushViewController(Tabbar, animated: true)
        }else{
            UserDefaults.standard.set("Gallery", forKey: "homepage")
            let vc = StoryBoards.Discover.instantiateViewController(withIdentifier: "GalleryVC") as! GalleryVC
            TabbarControllers?[0] = vc
            Tabbar.viewControllers = TabbarControllers
            Tabbar.tabBar.items?[0].image = UIImage(named: "location iconb")
            Tabbar.tabBar.items?[0].selectedImage = UIImage(named: "loaction")
            Tabbar.tabBar.items?[0].title = ""
            navigationController?.pushViewController(Tabbar, animated: true)
        }
        
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
