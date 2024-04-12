//
//  UserDefault.swift
//  MVVM
//
//  Created by Nuntapat Hirunnattee on 10/4/2567 BE.
//

import Foundation

enum Keys: String {
    case user = "user"
}

protocol UserDefaultProtocol {
    func add(value: Any, forKey: Keys)
    func remove(forKey: Keys)
    func getInteger(forKey: Keys) -> Int?
    func getString(forKey: Keys) -> String?
    func getBool(forKey: Keys) -> Bool?
    func getData(forKey: Keys) -> Data?
    func getObject(forKey: Keys) -> Any?
    func getArray(forKey: Keys) -> [Any]?
    func getDictionary(forKey: Keys) -> [String : Any]?
    func getDouble(forKey: Keys) -> Double?
    func getFloat(forKey: Keys) -> Float?
    func getstringArray(forKey: Keys) -> [String]?
    func getUrl(forKey: Keys) -> URL?
    func getValue(forKey: Keys) -> Any?
    func deleteAllStoredDatas()
    
}

class UserDefault: UserDefaultProtocol {
    
    static let shared = UserDefault()
    private let userDefault: UserDefaults
    private init(userDefault: UserDefaults = .standard) {
        self.userDefault = userDefault
    }
    
    func add(value: Any, forKey key: Keys) {
        userDefault.set(value, forKey: key.rawValue)
    }
    
    func remove(forKey key: Keys) {
        userDefault.removeObject(forKey: key.rawValue)
    }
    
    func getInteger(forKey key: Keys) -> Int? {
        return userDefault.integer(forKey: key.rawValue)
    }
    
    func getString(forKey key: Keys) -> String? {
        return userDefault.string(forKey: key.rawValue)
    }
    
    func getBool(forKey key: Keys) -> Bool? {
        return userDefault.bool(forKey: key.rawValue)
    }
    
    func getData(forKey key: Keys) -> Data? {
        return userDefault.data(forKey: key.rawValue)
    }
    
    func getObject(forKey key: Keys) -> Any? {
        return userDefault.object(forKey: key.rawValue)
    }
    
    func getArray(forKey key: Keys) -> [Any]? {
        return userDefault.array(forKey: key.rawValue)
    }
    
    func getDictionary(forKey key: Keys) -> [String : Any]? {
        return userDefault.dictionary(forKey: key.rawValue)
    }
    
    func getDouble(forKey key: Keys) -> Double? {
        return userDefault.double(forKey: key.rawValue)
    }
    
    func getFloat(forKey key: Keys) -> Float? {
        return userDefault.float(forKey: key.rawValue)
    }
    
    func getstringArray(forKey key: Keys) -> [String]? {
        return userDefault.stringArray(forKey: key.rawValue)
    }
    
    func getUrl(forKey key: Keys) -> URL? {
        return userDefault.url(forKey: key.rawValue)
    }
    
    func getValue(forKey key: Keys) -> Any? {
        return userDefault.value(forKey: key.rawValue)
    }
    
    func deleteAllStoredDatas() {
        let datas: [String: Any] = userDefault.dictionaryRepresentation()
        datas.forEach({
            userDefault.removeObject(forKey: $0.key)
        })
    }
    
}
