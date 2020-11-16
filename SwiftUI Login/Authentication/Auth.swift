//
//  Auth.swift
//  SwiftUI Login
//
//  Created by Ananda Yudhistira on 24/08/20.
//  Copyright © 2020 Ananda Yudhistira. All rights reserved.
//

import Foundation

struct Auth {
    var isAuth: Bool = UserDefaults.standard.bool(forKey: "isAuth")
    var npp: String? = UserDefaults.standard.string(forKey: "authNpp")
    var name: String? = UserDefaults.standard.string(forKey: "authName")
}

class AuthModel: ObservableObject {
    
    @Published var auth = Auth()
    
    private var user = UserDefaults.standard
    
    func login(npp: String, name: String) {
        user.set(true, forKey: "isAuth")
        user.set(npp, forKey: "authNpp")
        user.set(name, forKey: "authName")
        
        auth.isAuth = true
        auth.npp = npp
        auth.name = name
    }
    
    func logout() {
        user.set(false, forKey: "isAuth")
        user.set("", forKey: "authNpp")
        user.set("", forKey: "authName")
        
        auth.isAuth = false
        auth.npp = nil
        auth.name = nil
    }
    
}
