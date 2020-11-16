//
//  LoginView.swift
//  SwiftUI Login
//
//  Created by Ananda Yudhistira on 24/08/20.
//  Copyright © 2020 Ananda Yudhistira. All rights reserved.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @EnvironmentObject var authModel:AuthModel
    
    //MARK: - Views Setting
    @State var isNavigationBarHidden: Bool = true
    @State private var offsetValue: CGFloat = 0.0
    
    // field value
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorUsername: String = ""
    @State private var errorPassword: String = ""
    
    @State private var alert: Bool = false
    @State private var error: String = ""
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center, spacing: 16) {
                        
                        HStack {
                            AnandaTextTitle(text: "bekerja", fgColor: .appSecondary)
                        }
                        
                        Image("login").resizable()
                            .frame(width: UIScreen.main.bounds.width - 50, height: 250, alignment: .center)
                        
                        AnandaTextField(
                            icon: "envelope.circle",
                            placeholder: "Email",
                            text: self.$username,
                            error: self.$errorUsername
                        )
                        
                        AnandaTextField(
                            icon: "lock.circle",
                            placeholder: "Password",
                            text: self.$password,
                            error: self.$errorPassword,
                            secure: true
                        )
                        
                        AnandaButton(act: {
                            self.doLogin()
                        },
                             title: "LOG IN",
                             properties: AnandaButtonProperties(
                                fgColor: .white,
                                bgColor: [.appSecondary, .appSecondary]
                            )
                        )
                        
                        HStack {
                            NavigationLink(destination: RegistrationView(isNavigationBarHidden: self.$isNavigationBarHidden)) {
                                AnandaButtonText(text: "Register")
                            }
                            Spacer()
                            NavigationLink(destination: RegistrationView(isNavigationBarHidden: self.$isNavigationBarHidden)) {
                                AnandaButtonText(text: "Forgot Password?")
                            }
                        }.padding(.horizontal)
                        
                    }
                    .padding()
                    
                }
                .dismissKeyboardOnTap()
                .keyboardSensible($offsetValue)
                
                if self.alert{
                    ErrorView(alert: self.$alert, error: self.$error, bgClose: true)
                }
            }
            .accentColor(.appSecondary)
            .navigationBarTitle("")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
            }
        }
        
    }
    
    func doLogin() {
        
        self.errorUsername = ""
        self.errorPassword = ""
        
        var e = 0
        
        if username.isEmpty {
            self.errorUsername = "Email should not be empty"
            e+=1
        }
        
        if password.isEmpty {
            self.errorPassword = "Password should not be empty"
            e+=1
        }
        
        if e > 0 {
            return
        }
        
        self.authModel.login(npp: "12345", name: username)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
