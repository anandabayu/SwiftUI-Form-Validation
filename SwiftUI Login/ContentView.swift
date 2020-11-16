//
//  ContentView.swift
//  SwiftUI Login
//
//  Created by Ananda Yudhistira on 24/08/20.
//  Copyright © 2020 Ananda Yudhistira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var authModel = AuthModel()
    
    var body: some View {
        VStack {
            if self.authModel.auth.isAuth {
                HomeView().environmentObject(self.authModel)
            }else{
                LoginView().environmentObject(self.authModel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

