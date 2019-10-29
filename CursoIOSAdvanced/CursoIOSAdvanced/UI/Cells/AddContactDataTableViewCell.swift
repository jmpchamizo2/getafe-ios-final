//
//  AddContactDataTableViewCell.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class AddContactDataTableViewCell: UITableViewCell {

    static let cellIdentifier = String(describing: AddContactDataTableViewCell.self)

       @IBOutlet weak var mView: UIView!
       @IBOutlet weak var mLabelEmail: UILabel!
       @IBOutlet weak var mLabelCell: UILabel!
       @IBOutlet weak var mLabelPhone: UILabel!
       @IBOutlet weak var mTextEmail: UITextField!
       @IBOutlet weak var mTextCell: UITextField!
       @IBOutlet weak var mTextPhone: UITextField!
       
       
       override func prepareForReuse() {
           mLabelEmail.text = nil
           mLabelCell.text = nil
           mLabelPhone.text = nil
           mTextEmail.text = nil
           mTextCell.text = nil
           mTextPhone.text = nil
       }
       
       override func awakeFromNib() {
           super.awakeFromNib()
           
           mView.layer.cornerRadius = 8.0
           mView.configureShadows()

       }
       
       func configureCell() {
           mLabelEmail.text = "Email"
           mLabelCell.text = "Cell"
           mLabelPhone.text = "Phone"
       }
       
    
}
