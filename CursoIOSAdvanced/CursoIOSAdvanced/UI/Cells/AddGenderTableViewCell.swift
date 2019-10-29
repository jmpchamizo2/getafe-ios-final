//
//  AddGenderTableViewCell.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 24/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

class AddGenderTableViewCell: UITableViewCell {

    static let cellIdentifier = String(describing: AddGenderTableViewCell.self)
    private var cellSpacing: CGFloat = 16.0
    

       @IBOutlet weak var mView: UIView!
       @IBOutlet weak var mLabelGender: UILabel!
       @IBOutlet weak var mColletionView: UICollectionView!

       
       
       override func prepareForReuse() {
           mLabelGender.text = nil

       }
       
       override func awakeFromNib() {
           super.awakeFromNib()
           
           mView.layer.cornerRadius = 8.0
           mView.configureShadows()

       }
       
       func configureCell() {
           mLabelGender.text = "Gender"
       }
       
}


// MARK: - Extension CollectionView methods
extension AddGenderTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var gender: Array<String> {
        return ["male", "female"]
        }
    
    /// Configure collectionView with default options
    func configure(collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: LabelCollectionViewCell.cellIdentifier,
                                      bundle: nil),
                                forCellWithReuseIdentifier: LabelCollectionViewCell.cellIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gender.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.cellIdentifier,
                                                       for: indexPath) as? LabelCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(label: gender[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width - cellSpacing) / 2
        return CGSize(width: size,
                      height: size)
    }
}
