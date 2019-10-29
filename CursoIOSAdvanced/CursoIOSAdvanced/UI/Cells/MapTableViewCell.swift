//
//  MapTableViewCell.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import MapKit

class MapTableViewCell: UITableViewCell {

    static let cellIdentifier = String(describing: MapTableViewCell.self)
    
    // MARK: - Outlets -
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mLabelTitle: UILabel!
    @IBOutlet weak var mMapView: MKMapView!
    
    var latitudeString: String?
    var longitudeString: String?
    let regionRadius: CLLocationDistance = 100000
    

    
    
    // MARK: - Lifecycle -
    override func prepareForReuse() {
        mLabelTitle.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mView.layer.cornerRadius = 8.0
        mView.configureShadows()
    }
    
    // MARK: - Configure methods -
    func configureCell(latitudeString: String? = nil, longitudeString: String? = nil) {
        self.latitudeString = latitudeString
        self.longitudeString = longitudeString
        guard let latitude: Double = Double(latitudeString ?? "0"),
            let longitude: Double = Double(longitudeString ?? "0") else {
                return
        }
        let location = CLLocation(latitude: latitude, longitude: longitude)
        centerMapOnLocation(location: location)
        mLabelTitle.text = "Map"
    }
    

    private func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
      mMapView.setRegion(coordinateRegion, animated: true)
    }
}
