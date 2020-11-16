//
//  HomeView.swift
//  SwiftUI Login
//
//  Created by Ananda Yudhistira on 24/08/20.
//  Copyright © 2020 Ananda Yudhistira. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var authModel:AuthModel
    
    var body: some View {
        VStack {
            Text("You are logged in!")
            
            Text("\(authModel.auth.name ?? "")")
            Text("\(authModel.auth.npp ?? "")")
            
            Button(action: {
                self.authModel.logout()
            }) {
                Text("Logout")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
