//
//  ApiManager.swift
//  CursoIOSAdvanced
//
//  Created by David Jardon on 07/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import Alamofire
//import SwiftyJSON

enum ServiceResult {
    case success(data: Any?)
    case failure(msg: String)
}

typealias ServiceCompletion = (_ results: ServiceResult) -> ()


class ApiManager {
    // MARK: - Singleton declaration
    static let shared = ApiManager()
    private init() {}
    
    // MARK: - Properties
    private let url_users = "https://randomuser.me/api/"
    
    private let numUsers: Int = 100
    private var testLoadUsersJson: UsersDTO? {
        if let path = Bundle.main.path(forResource: "users", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
                return jsonToUsersDTO(json: jsonData)
            }
            catch let error {
                print("parse error: \(error.localizedDescription)")
                return nil
            }
        }
        else {
            print("Invalid filename/path.")
            return nil
        }
    }
    
    private func jsonToUsersDTO(json: Data?) -> UsersDTO? {
        guard let jsonData = json else {
            return nil
        }
        do {
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            
            return try decoder.decode(UsersDTO.self, from: jsonData)
        }
        catch let error {
            print("parse error: \(error.localizedDescription)")
            return nil
        }
    }
    

    
    func fetchUsers(completion: @escaping ServiceCompletion) {
        // Llamar al servicio
        // ALAMOFIRE
        // Devolver datos

        Alamofire.request(url_users,
                          method: .get ,
                          parameters: ["results": 10],
                          encoding: URLEncoding.queryString).response { response in
                            if let responseData = response.data {
                                let usersDTO = self.jsonToUsersDTO(json: responseData)
                                completion(.success(data: self.sortUsersDTOByDate(usersDTO)))
                                
                            }
        }
    }
    
    //Otra manera de hacer fetchUsers
    func fetchUsers2(completion: @escaping ServiceCompletion) {
        // Llamar al servicio
        // ALAMOFIRE
        // Devolver datos

        Alamofire.request(url_users,
                          method: .get ,
                          parameters: ["results": 10])
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess,
                    let jsonDictionary = response.result.value as? [String: Any] else  {
                        
                        completion(.failure(msg: "Error al acceder el servicio remoto"))
                        return
                }
                do{
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonDictionary) else {
                        completion(.failure(msg: "No tenemos JSONData"))
                        return
                    }
                    let usersDTO = self.jsonToUsersDTO(json: jsonData)
                    completion(.success(data: usersDTO))
                }
                
        }

    }
    
    private func sortUsersDTOByDate(_ usersDTO: UsersDTO?) -> UsersDTO {
        let arrayUserDTOSorted = usersDTO?.users?.sorted(by: { (user1, user2) -> Bool in
            if let date1 = user1.dob?.date,
                let date2 = user2.dob?.date {
                return date1.timeIntervalSinceNow > date2.timeIntervalSinceNow
            }
            return false
        })
        return UsersDTO(users: arrayUserDTOSorted, info: usersDTO?.info)
    }
    
    
    //Otra manera de hacer lo mismo
    private func sortUsersDTOByDate2(_ usersDTO: UsersDTO?) -> UsersDTO {
        let arrayUserDTOSorted = usersDTO?.users?.sorted(by: {
            if let date1 = $0.dob?.date,
                let date2 = $1.dob?.date {
                return date1.compare(date2) == .orderedDescending
            }
            return false
        })
        return UsersDTO(users: arrayUserDTOSorted, info: usersDTO?.info)
    }
    
    private func sortUsersDTOByDate3(_ usersDTO: UsersDTO?) -> UsersDTO {
        let arrayUserDTOSorted = usersDTO?.users?.sorted(by: {
                $0.dob?.date ?? Date() < $1.dob?.date ?? Date()
        })
        return UsersDTO(users: arrayUserDTOSorted, info: usersDTO?.info)
    }
}
