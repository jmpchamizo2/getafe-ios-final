//
//  AddBirthDateTableViewCell.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class AddBirthDateTableViewCell: UITableViewCell {

     static let cellIdentifier = String(describing: AddBirthDateTableViewCell.self)

          @IBOutlet weak var mView: UIView!
          @IBOutlet weak var mLabelBirthdate: UILabel!
          @IBOutlet weak var date: UIDatePicker!

          
          
          override func prepareForReuse() {
              mLabelBirthdate.text = nil
              date.calendar = nil

          }
          
          override func awakeFromNib() {
              super.awakeFromNib()
              
              mView.layer.cornerRadius = 8.0
              mView.configureShadows()

          }
          
          func configureCell() {
              mLabelBirthdate.text = "Birthdate"
          }
    
}
