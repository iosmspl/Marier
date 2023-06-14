//
//  PersonalVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 27/03/23.
//

import Foundation
import UIKit
import CoreLocation

extension PersonalVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == genderTable{
            return genderArray.count
        }else{
//            print("-count--\(SexualityArrayApi.count)")
            return SexualityArrayApi.count-1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalTableCell", for: indexPath) as! PersonalTableCell
        if tableView == genderTable{
            cell.cellLabel.text = genderArray[indexPath.row]
            cell.cellImage.image = UIImage(named: "inactiveRadio") // activeRadio
            if selectGender != nil && indexPath.row == selectGender{
                cell.cellImage.image = UIImage(named: "activeRadio")
               
            }
            return cell
        }else{
            cell.cellLabel.text = (SexualityArrayApi[indexPath.row].sexuality)!
            if SelectedSexualityInd.isEmpty == false {
                for Indx in SelectedSexualityInd{
                    let Ind:Int = (Int)(Indx)!
                    if Ind == indexPath.row {
                        cell.cellImage.image = UIImage(named: "activeRadio")
                        return cell
                    }else{
                        cell.cellImage.image = UIImage(named: "inactiveRadio")
//                        return cell
                    }
                }
            }else {
                cell.cellImage.image = UIImage(named: "inactiveRadio")
//                return cell
            }
            return cell
        }
//        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.updateConstraints()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == genderTable {
            selectGender = indexPath.row
            genderTable.reloadData()
        }
        
        if tableView == sexualityTable {
            let index = indexPath.row
            let sexuaityObj = (SexualityArrayApi[index]._id)!
            if SelectedSexualityInd.contains("\(index)"){
              let ind = ( SelectedSexualityInd.firstIndex(of: "\(index)"))!
//                print("--ind--|\(ind)")
                SelectedSexualityInd.remove(at: ind)
                sexualityTable.reloadData()
            }else{
                SelectedSexualityInd.append("\(index)")
                sexualityTable.reloadData()
            }
         
            if selectedSexualityArr.contains("\(sexuaityObj)"){
                let ind = (selectedSexualityArr.firstIndex(of: "\(sexuaityObj)"))!
                selectedSexualityArr.remove(at: ind)
                
            }else{
                selectedSexualityArr.append("\(sexuaityObj)")
            }
//            print("-id-arr-\(selectedSexualityArr)")
        }
    }
    
}
extension PersonalVC: CLLocationManagerDelegate{
    
    
    //MARK: -to get latitude and longitude
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            latitude_ = (location.coordinate.latitude)
            longatude_ = (location.coordinate.longitude)
            locationManger.stopUpdatingLocation()
            reverseGeocoding(latitude: latitude_ ?? CLLocationDegrees(0), longitude: longatude_ ?? CLLocationDegrees(0)) { addres in
//                print("\(addres)")
                
                Defaults.defaultClass.loc = (addres) ?? ""
                
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("||\(latitude_)  \(longatude_)")
        print("|personalVC|error\(error)")
    }
    //^-------------------------------------
    
    // MARK: - to get address
   
}
extension PersonalVC{
    func reverseGeocoding(latitude: CLLocationDegrees, longitude: CLLocationDegrees , compilation: @escaping(_ addres: String?)-> Void){
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        geocoder.reverseGeocodeLocation(location) { (Placemakers, error)  in
            if let error = error{
                print("|reverGeo||\(error)")
                compilation(nil)
            }else if let Placemaker = Placemakers?.first{
//                let name = Placemaker.name ?? ""
                let city = Placemaker.locality ?? ""
//                let country = Placemaker.country ?? ""
                let address = "\(city)"
                print("---------\(address)-----------------")
                compilation(address)
            }else{
                print("|reverse||\(self.latitude_)\(self.longatude_)")
                compilation(nil)
            }
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
   
}
