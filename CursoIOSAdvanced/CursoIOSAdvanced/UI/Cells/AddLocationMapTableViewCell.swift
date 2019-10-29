//
//  AddLocationMapTableViewCell.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import MapKit

class AddLocationMapTableViewCell: UITableViewCell {

    
    
    static let cellIdentifier = String(describing: AddLocationMapTableViewCell.self)

         @IBOutlet weak var mView: UIView!
         @IBOutlet weak var mLabelLatitude: UILabel!
         @IBOutlet weak var mLabelLongitude: UILabel!
         @IBOutlet weak var mTextLatitude: UITextField!
         @IBOutlet weak var mTextLongitude: UITextField!
         @IBOutlet weak var mMapView: MKMapView!

    
         var latitudeString: String?
         var longitudeString: String?
         let regionRadius: CLLocationDistance = 100000
     
         
         override func prepareForReuse() {
            mLabelLatitude.text = nil
            mLabelLongitude.text = nil
            mTextLatitude.text = nil
            mTextLongitude.text = nil

         }
         
         override func awakeFromNib() {
             super.awakeFromNib()
             
             mView.layer.cornerRadius = 8.0
             mView.configureShadows()

         }
         
         func configureCell() {
             mLabelLatitude.text = "Latitude"
             mLabelLongitude.text = "Longitude"
             self.latitudeString = mTextLatitude.text
             self.longitudeString = mTextLongitude.text
                 guard let latitude: Double = Double(latitudeString ?? "0"),
                     let longitude: Double = Double(longitudeString ?? "0") else {
                         return
                 }
                 let location = CLLocation(latitude: latitude, longitude: longitude)
                 centerMapOnLocation(location: location)
       }
    
       private func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        mMapView.setRegion(coordinateRegion, animated: true)
      }
}
