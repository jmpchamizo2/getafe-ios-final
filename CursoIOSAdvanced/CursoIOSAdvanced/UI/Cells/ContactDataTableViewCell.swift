//
//  ContactDataTableViewCell.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class ContactDataTableViewCell: UITableViewCell {

    static let cellIdentifier = String(describing: ContactDataTableViewCell.self)
    
    // MARK: - Outlets -
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mLabelTitle: UILabel!
    @IBOutlet weak var mLabelEmail: UILabel!
    @IBOutlet weak var mLabelPhone: UILabel!
    
    
    // MARK: - Lifecycle -
    override func prepareForReuse() {

        mLabelEmail.text = nil
        mLabelPhone.text = nil
        mLabelTitle.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mView.layer.cornerRadius = 8.0
        mView.configureShadows()
    }
    
    // MARK: - Configure methods -
    func configureCell(userEmail: String? = nil,
                       userPhone: String? = nil) {

        mLabelEmail.text = userEmail
        mLabelPhone.text = userPhone
        mLabelTitle.text = "Contact"

    }
}
