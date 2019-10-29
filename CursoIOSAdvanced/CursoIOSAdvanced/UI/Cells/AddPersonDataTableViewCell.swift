//
//  AddPersonDataTableViewCell.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class AddPersonDataTableViewCell: UITableViewCell {
    
    
    static let cellIdentifier = String(describing: AddPersonDataTableViewCell.self)

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabelFirstName: UILabel!
    @IBOutlet weak var mLabelLastName: UILabel!
    @IBOutlet weak var mTextFirstName: UITextField!
    @IBOutlet weak var mTextLastName: UITextField!
    
    
    override func prepareForReuse() {
        mImage.image = nil
        mLabelFirstName.text = nil
        mLabelLastName.text = nil
        mTextFirstName.text = nil
        mTextLastName.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mView.layer.cornerRadius = 8.0
        mView.configureShadows()

    }
    
    func configureCell() {
        mLabelFirstName.text = "First Name"
        mLabelLastName.text = "Last Name"
    }
    
}
