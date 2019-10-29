//
//  UserDetailViewController.swift
//  CursoIOSAdvanced
//
//  Created by Dev2 on 16/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import UIKit

enum UserDetailCellType: Int {
    case personalData
    case country
    case contactData
    case map
}




class UserDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!


    
    // MARK: - Properties
    private var cellSpacing: CGFloat = 16.0
    var user: User?
    private var cellDetail: UserDetailCellType = UserDetailCellType.personalData
    
    
    // MARK: - Lifecycle methods
       override func viewDidLoad() {
           super.viewDidLoad()
           configure(tableView: tableView)
           title = user?.name
       }
    
    
    @IBAction func onDeletePressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Eliminar Usuario",
                                      message: "Vas a eliminar el usuario, ¿estás seguro?",
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "eliminar",
                                      style: .destructive,
                                      handler: {[weak self] _ in
            
            DataManager.shared.deleteUser(user: self?.user)
            //defaultStudents.removeAll(where: { $0.name == self?.student?.name ?? ""})
            self?.navigationController?.popViewController(animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "cancelar",
                                      style: .cancel))
        
        present(alert, animated: true)
    }
    
    
}


// MARK: - Extension TableView methods
extension UserDetailViewController: UITableViewDataSource, UITableViewDelegate {
    /// Configure tableView with default options
    func configure(tableView: UITableView) {
        registerCells(tableView: tableView)
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfSections: Int = 4
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return loadDetailCell(tableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case UserDetailCellType.personalData.rawValue:
            return 155
        case UserDetailCellType.country.rawValue:
            return 60
        case UserDetailCellType.contactData.rawValue:
            return 84
        case UserDetailCellType.map.rawValue:
            return 450 
        default:
            return 0
        }
    }
    
    private func loadDetailCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.row {
        case UserDetailCellType.personalData.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonTableViewCell.cellIdentifier,
                                                           for: indexPath) as? PersonTableViewCell else {
                                                            return UITableViewCell()
            }
            cell.configureCell(image: user?.avatar,
                               name: user?.name,
                               subtitle: user?.lastName,
                               birthdate: user?.birthdate,
                               country: user?.country)

            return cell
            
        case UserDetailCellType.country.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.cellIdentifier,
                                                           for: indexPath) as? CountryTableViewCell else {
                                                            return UITableViewCell()
            }
            cell.configureCell(userNat: user?.nationality,
                               userCountry: user?.country)
            return cell
            
        case UserDetailCellType.contactData.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactDataTableViewCell.cellIdentifier,
                                                           for: indexPath) as? ContactDataTableViewCell else {
                                                            return UITableViewCell()
            }
            cell.configureCell(userEmail: user?.email,
                               userPhone: user?.phone)
            return cell
            
        case UserDetailCellType.map.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MapTableViewCell.cellIdentifier,
                                                           for: indexPath) as? MapTableViewCell else {
                                                            return UITableViewCell()
            }
            cell.configureCell(latitudeString: user?.latitude,
                               longitudeString: user?.longitude)
            return cell

        default:
            return UITableViewCell()
        }
    }
    
    
    private func registerCells(tableView: UITableView){
        tableView.register(UINib(nibName: PersonTableViewCell.cellIdentifier,
              bundle: nil),
        forCellReuseIdentifier: PersonTableViewCell.cellIdentifier)
        tableView.register(UINib(nibName: CountryTableViewCell.cellIdentifier,
              bundle: nil),
        forCellReuseIdentifier: CountryTableViewCell.cellIdentifier)
        tableView.register(UINib(nibName: ContactDataTableViewCell.cellIdentifier,
              bundle: nil),
        forCellReuseIdentifier: ContactDataTableViewCell.cellIdentifier)
        tableView.register(UINib(nibName: MapTableViewCell.cellIdentifier,
              bundle: nil),
        forCellReuseIdentifier: MapTableViewCell.cellIdentifier)
    }
}
