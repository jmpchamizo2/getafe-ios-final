//
//  PersonalDataTableViewCell.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class PersonalDataTableViewCell: UITableViewCell {

    static let cellIdentifier = String(describing: PersonalDataTableViewCell.self)
    

    
    // MARK: - Outlets -
    @IBOutlet weak var mView: UIView!
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mLabelTitle: UILabel!
    @IBOutlet weak var mLabelName: UILabel!
    @IBOutlet weak var mLabelDate: UILabel!
    @IBOutlet weak var mLabelCity: UILabel!
    
    
    
    // MARK: - Lifecycle -
    override func prepareForReuse() {
        mImage.image = nil
        mLabelName.text = nil
        mLabelDate.text = nil
        mLabelCity.text = nil
        mLabelTitle.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mView.configureShadows()
        mImage.makeRounded()
        debugPrint(mImage.frame.width)
        debugPrint(mImage.frame.height)
    }
    
    // MARK: - Configure methods -
    func configureCell(image: String? = nil,
                       userName: String? = nil,
                       userDate: Date? = nil,
                       userCity: String? = nil) {
        let url = URL(string: image ?? "")
        mImage.kf.setImage(with: url)
        mLabelName.text = userName
        if let date = userDate {
            mLabelDate.text = dateToString(date: date)
        }
        mLabelCity.text = userCity
        mLabelTitle.text = "Personal Data"
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy'"
        return formatter.string(from: date)
    }
    
}
