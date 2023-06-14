//
//  DetailProfileVC+Extension.swift
//  Marier
//
//  Created by MacBook M1 on 10/04/23.
//

import Foundation
import UIKit
import AlamofireImage
import CoreLocation

// collection  for detail profile
    // MARK:- Detailvc collection
extension DetailProfileVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        print("this is the image count detail \(imgArrayTemp.count)")
        return galleryUser.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = DetailCollection.dequeueReusableCell(withReuseIdentifier: "DetailProfileCollectionCell", for: indexPath) as! DetailProfileCollectionCell
        
        if let imgUrl = (galleryUser[indexPath.item].image){
            cell.moreImg.af.setImage(withURL: URL(string: imgUrl)!)
        }
//        cell.moreImg.af.setImage(withURL: <#T##URL#>)
//        cell.moreImg.image = imgArrayTemp[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 150
        )
    }
    
    
    
}

extension DetailProfileVC{
    func reverseGeocoding(lati: CLLocationDegrees , longi: CLLocationDegrees , compilation: @escaping(_ Address: String?)-> Void){
        let location = CLLocation(latitude: lati, longitude: longi)
        
        geocoding.reverseGeocodeLocation(location) { placemaker, error in
            if let error = error{
                
                print("problem in obtaining location\(error.localizedDescription)")
                compilation(nil)
                return
            }else if let placemaker = placemaker?.last{
                let city = placemaker.locality ?? ""
//                print("location = \(city)-")
                compilation(city)
            }else{
                compilation(nil)
                print("somhting is wrong")
            }
        }
    }
}


