//
//  UserFileModel.swift
//  EncryptMe
//
//  Created by Tyler hostager on 1/23/17.
//  Copyright © 2017 Tyler Hostager. All rights reserved.
//

import Foundation

class User {
    
    // init constants
#if DEBUG
    static let debugUsername = String.UserDefaults.DebugUsername.rawValue
    static let debugPassword = String.UserDefaults.DebugPassword.rawValue
#else
    static let adminUsername = String.UserDefaults.AdminUsername.rawValue
    static let adminPassword = String.UserDefaults.AdminPassword.rawValue
    static let defaultUsername = String.UserDefaults.AdminUsername.rawValue
    static let defaultPassword = String.UserDefaults.AdminPassword.rawValue
#endif
    
    enum UserType {
        case Admin
        #if DEBUG
        case Debug
        #endif
        case Default
        
        init() {
            self = .Default
        }
    }
    
    // init private vars
    private var userType: UserType! {
        get {
            return self.userType ?? .Default
        } set {
            self.userType = newValue ?? .Default
        }
    }
    
    #if DEBUG
    private var isDebug: Bool! {
        get {
            switch self.userType as UserType {
            case .Debug:
                return true
            case .Admin:
                return false
            default:
                return false
            }
        }
    }
    #endif
    
    private var isAdmin: Bool!
    
    private var hasSavedPrefsData: Bool! {
        get {
            
        }
    }
    
    // init vars
    var username: String!
    var password: String!
    var hasFullPermissions: Bool!
    var hasReadPermissions: Bool!
    var hasWritePermissions: Bool!
    var hasDefaultPermissions: Bool!
    
    init() {
        initDefaultUser()
        validateUserAccount()
    }
    
    init(withUsername username: String, password: String) {
        createUser(withUsername: username, password: password, isAdmin: true)
        validateUserAccount()
    }
    
    init(withUsername username: String, password: String, isAdmin: Bool) {
        createUser(withUsername: username, password: password, isAdmin: isAdmin)
        validateUserAccount()
    }
    
#if DEBUG
    init(debugMode enabled: Bool) {
        if enabled {
            self.username = String.UserDefaults.AdminUsername.rawValue
            self.password = String.UserDefaults.AdminPassword.rawValue
            self.isAdmin = true
            self.userType = .Debug
        } else {
            initDefaultUser()
        }
    }
#endif
    
    func initDefaultUser() -> Void {
        self.username = String.UserDefaults.DefaultUsername.rawValue
        self.password = String.UserDefaults.DefaultPassword.rawValue
        self.isAdmin = false
        self.userType = .Default
    }
    
    func isAdminAccount() -> Bool {
        validateUserAccount()
        
        // TODO: fill in method
        
        return true
    }
    
    func isDebugging() -> Bool {
        
    }
    
    fileprivate func createUser(withUsername username: String!, password: String!, isAdmin: Bool) -> Void {
        self.isAdmin = isAdmin
        #if DEBUG
            self.username = String.UserDefaults.DebugUsername.rawValue
            self.password = String.UserDefaults.DebugPassword.rawValue
            self.userType = .Debug
        #else
            if isAdmin {
                self.username = username ?? String.UserDefaults.AdminUsername.rawValue
                self.password = password ?? String.UserDefaults.AdminPassword.rawValue
                self.userType = .Admin
            } else {
                self.username = username ?? String.UserDefaults.DefaultUsername.rawValue
                self.password = password ?? String.UserDefaults.DefaultPassword.rawValue
                self.userType = .Default
            }
        #endif
    }
    
    fileprivate func validateUserAccount() -> Void {
        
    }
    
    fileprivate func isLoggedIn() -> Bool {
        var isLoggedIn = false
        
        //if AppData.sharedInstance.dataManager.user.isSaved
        
        return isLoggedIn
    }
    
    fileprivate func hasFullPermissions() -> Bool {
        var hasFull = false
        
        return hasFull
    }
}





/*
struct User {
    enum Info: String {
        case Username, Password
    }
    
    let canDecrypt, canEdit, canCreate, canRemove, canParse, canOpenInEditor: Bool
    let directory, dateCreated: String
    let parentDirectory: String!
    let fileSize: Int
}
*/