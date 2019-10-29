//
//  AddNationalityDataTableViewCell.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class AddNationalityDataTableViewCell: UITableViewCell {


    static let cellIdentifier = String(describing: AddNationalityDataTableViewCell.self)

         @IBOutlet weak var mView: UIView!
         @IBOutlet weak var mLabelNat: UILabel!
         @IBOutlet weak var mCollectionView: UICollectionView!

         
         
         override func prepareForReuse() {
             mLabelNat.text = nil

         }
         
         override func awakeFromNib() {
             super.awakeFromNib()
             
             mView.layer.cornerRadius = 8.0
             mView.configureShadows()

         }
         
         func configureCell() {
             mLabelNat.text = "Nat"
         }
    
}
