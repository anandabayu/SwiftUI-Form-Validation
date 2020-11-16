//
//  AlertView.swift
//  SwiftUI Login
//
//  Created by Ananda Yudhistira on 24/08/20.
//  Copyright © 2020 Ananda Yudhistira. All rights reserved.
//

import SwiftUI

struct ErrorView : View {
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    @State var bgClose: Bool
    
    var body: some View{
        
        ZStack {
            GeometryReader{_ in
                
                VStack{
                    
                    HStack{
                        
                        Text("Message")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                        
                        Spacer()
                    }
                    .padding(.horizontal, 25)
                    
                    Text(self.error == "RESET" ? "Password reset link has been sent successfully" : self.error)
                        .foregroundColor(self.color)
                        .padding(.top)
//                        .padding(.horizontal, 25)
                    
                    Button(action: {
                        
                        self.alert.toggle()
                        
                    }) {
                        
                        Text("OK")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 110)
                    }
                    .background(Color.appSecondary)
                    .cornerRadius(10)
                    .padding(.top, 25)
                    
                }
                .padding(.vertical, 25)
                .frame(width: UIScreen.main.bounds.width - 70)
                .background(Color.white)
                .cornerRadius(15)
                .onTapGesture {
                    print("HOLA")
                }
            }
            .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
            .onTapGesture {
                if self.bgClose {
                    self.alert.toggle()
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(alert: .constant(true), error: .constant("RESET"), bgClose: false)
    }
}
