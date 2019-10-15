//
//  DatabaseManager.swift
//  CursoIOSAdvanced
//
//  Created by David Jardon on 07/10/2019.
//  Copyright © 2019 David Jardon. All rights reserved.
//

import Foundation
import RealmSwift


class DatabaseManager {
    // MARK: - Singleton declaration
    static let shared = DatabaseManager()
    private init() {}

    // MARK: - Properties
    // Get the default Realm database
    //En las extensiones no podemos crear variables, solo variables computadas
    // No lo hacemos porque sino cada vez que llamasemos con nuestra variable computada a la bbdd crearía una nueva instancia y con muchos usuarios podría ser un problema.


}

//Mejor hacer extensiones por libreria
//MARK: - Realm
extension DatabaseManager{

    private var realm: Realm {
        return try! Realm()
    }
    
    var users: Results<UserDAO> {
        return realm.objects(UserDAO.self)
    }
    
    
    func save(user: UserDAO) {
        try! realm.write {
            realm.add(user,
                      update: .modified)
        }
    }
    
    func user(by id: String) -> UserDAO? {
        return realm.object(ofType: UserDAO.self,
                            forPrimaryKey: id)
    }
    
    func deleteAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func delete(user: UserDAO) {
        try! realm.write {
            realm.delete(user)
        }
    }
}


//MARK: - UserDefault
extension DatabaseManager {
    var KEY_OPTION_SELECTED: String {
        "KEY_OPTION_SELECTED"
    }
    
    //Funciones simples mejor hacerlas variables computadas
    var optionSelected: Int {
        return UserDefaults.standard.integer(forKey: KEY_OPTION_SELECTED)
    }
    
    func save(option: Int){
        UserDefaults.standard.set(option, forKey: KEY_OPTION_SELECTED)
    }
    

}
