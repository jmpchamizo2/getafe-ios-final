//
//  User.swift
//  CursoIOSAdvanced
//
//  Created by David Jardon on 08/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation


class User {
    let id: String
    let avatar: String?
    let firstName: String?
    let lastName: String?
    let email: String?
    let birthdate: Date?
    let gender: String?
    let country: String?
    let nationality: String?
    let phone: String?
    let latitude: String?
    let longitude: String?
    
    var name: String {
        var userName = ""
        if let userFirstName = firstName {
            userName += userFirstName
        }
        
        if let userLastName = lastName {
            userName += (userName.count > 0 ? " \(userLastName)": userLastName)
        }
        
        return "\(userName)"
    }
    
    var age: Int {
        guard let date = birthdate,
              let yearAge = Calendar.current.dateComponents([.year],
                                                                  from: date, to: Date()).year else {
            return 0
        }
        
        return yearAge
    }
    
    
    
    init(id: String, avatar: String? = nil, firstName: String? = nil, lastName: String? = nil, email: String? = nil, birthdate: Date? = nil, gender: String? = nil, country: String? = nil, nationality: String? = nil, phone: String? = nil, latitude: String? = nil, longitude: String? = nil) {
        
        self.id = id
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.birthdate = birthdate
        self.gender = gender
        self.country = country
        self.nationality = nationality
        self.phone = phone
        self.latitude = latitude
        self.longitude = longitude
    }
    
}
