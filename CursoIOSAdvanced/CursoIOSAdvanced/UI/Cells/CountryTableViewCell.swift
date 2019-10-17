//
//  CountryTableViewCell.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
        static let cellIdentifier = String(describing: CountryTableViewCell.self)

    // MARK: - Outlets -
       @IBOutlet weak var mView: UIView!
       @IBOutlet weak var mLabelFlag: UILabel!
       @IBOutlet weak var mLabelTitle: UILabel!
       @IBOutlet weak var mLabelCountry: UILabel!
       
       
       // MARK: - Lifecycle -
       override func prepareForReuse() {
           mLabelFlag.text = nil
           mLabelCountry.text = nil
           mLabelTitle.text = nil
       }
       
       override func awakeFromNib() {
           super.awakeFromNib()
           
           mView.layer.cornerRadius = 8.0
           mView.configureShadows()
       }
       
       // MARK: - Configure methods -
       func configureCell(userNat: String? = nil,
                          userCountry: String? = nil) {
           mLabelFlag.text = flag(country: userNat ?? "")
           mLabelCountry.text = userCountry
           mLabelTitle.text = "Country"
       }
       
    func flag(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}
