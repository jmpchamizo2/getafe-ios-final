//
//  AddLocationTableViewCell.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class AddLocationTableViewCell: UITableViewCell {

    
    static let cellIdentifier = String(describing: AddLocationTableViewCell.self)

         @IBOutlet weak var mView: UIView!
         @IBOutlet weak var mLabelCountry: UILabel!
         @IBOutlet weak var mLabelState: UILabel!
         @IBOutlet weak var mLabelCity: UILabel!
         @IBOutlet weak var mLabelStreet: UILabel!
         @IBOutlet weak var mTextState: UITextField!
         @IBOutlet weak var mTextCity: UITextField!
         @IBOutlet weak var mTextStreet: UITextField!
         @IBOutlet weak var mPickerCountry: UIPickerView!

         
         
         override func prepareForReuse() {
            mLabelCountry.text = nil
            mLabelState.text = nil
            mLabelCity.text = nil
            mLabelStreet.text = nil

         }
         
         override func awakeFromNib() {
             super.awakeFromNib()
             
             mView.layer.cornerRadius = 8.0
             mView.configureShadows()

         }
         
         func configureCell() {
             mLabelCountry.text = "Country"
             mLabelState.text = "State"
             mLabelCity.text = "City"
             mLabelStreet.text = "Street"
            
    }
}
