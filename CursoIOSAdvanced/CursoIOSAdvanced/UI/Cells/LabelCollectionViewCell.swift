//
//  LabelCollectionViewCell.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class LabelCollectionViewCell: UICollectionViewCell {

        static let cellIdentifier = String(describing: LabelCollectionViewCell.self)

         @IBOutlet weak var mView: UIView!
         @IBOutlet weak var mLabel: UILabel!


         
         
         override func prepareForReuse() {
             mLabel.text = nil

         }
         
         override func awakeFromNib() {
             super.awakeFromNib()
             
             mView.layer.cornerRadius = 8.0
             mView.configureShadows()

         }
         
    func configureCell(label: String? = nil) {
             mLabel.text = label
         }
}
