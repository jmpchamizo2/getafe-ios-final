//
//  PersonTableViewCell.swift
//  CursoIOSAdvanced
//
//  Created by David Jardon on 03/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit
import Kingfisher


class PersonTableViewCell: UITableViewCell {
    static let cellIdentifier = String(describing: PersonTableViewCell.self)

    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabelName: UILabel!
    @IBOutlet weak var mLabelBirthdate: UILabel!
    @IBOutlet weak var mLabelCountry: UILabel!
    @IBOutlet weak var mLabelEmail: UILabel!
    
    
    override func prepareForReuse() {
        mImage.image = nil
        mLabelName.text = nil
        mLabelEmail.text = nil
        mLabelBirthdate.text = nil
        mLabelCountry.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mView.layer.cornerRadius = 8.0
        mView.configureShadows()
        mImage.makeRounded()
    }
    
    func configureCell(image: String? = nil, name: String? = nil, subtitle: String? = nil, birthdate: Date?, country: String?) {
        let url = URL(string: image ?? "")
        mImage.kf.setImage(with: url)
        mLabelName.text = name
        mLabelEmail.text = subtitle
        mLabelCountry.text = country
        mLabelBirthdate.text = dateToString(date: birthdate ?? Date())
    }
    
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy'"
        return formatter.string(from: date)
    }
}




