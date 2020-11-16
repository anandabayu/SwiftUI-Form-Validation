//
//  AnandaTextField.swift
//  SwiftUI Login
//
//  Created by Ananda Yudhistira on 25/08/20.
//  Copyright © 2020 Ananda Yudhistira. All rights reserved.
//

import SwiftUI

struct AnandaTextField: View {
    
    var icon: String
    var placeholder: String
    @Binding var text: String
    @Binding var error: String
    var secure: Bool = false
    @State var hide: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                
                if !icon.isEmpty {
                    Image(systemName: icon)
                        .foregroundColor(.appSecondary)
                        .font(.system(size: 20))
                }
                
                ZStack(alignment: .leading) {
                    
//                    if text.isEmpty || text == "" {
                        Text(placeholder)
                            .font(.custom("NeoSansStd-Regular", size: 17))
                            .foregroundColor(.gray)
                            .opacity(text.isEmpty ? 1 : 0)
//                    }
                    
                    HStack {
                        if secure && hide {
                            SecureField("", text: self.$text)
                                .font(.custom("NeoSansStd-Regular", size: 17))
                                .foregroundColor(.black)
                        }else{
                            TextField("", text: self.$text)
                                .font(.custom("NeoSansStd-Regular", size: 17))
                                .foregroundColor(.black)
                            
                        }
                        Spacer()
                        if !text.isEmpty && !secure {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.secondary)
                                .opacity(text == "" ? 0 : 1)
                                .onTapGesture { self.text = "" }
                        }
                        
                        if secure {
                            Button(action: {
                                self.hide.toggle()
                            }) {
                                Image(systemName: hide ? "eye.fill" : "eye.slash.fill")
                                    .foregroundColor(.appSecondary)
                                    .font(.system(size: 20))
//                                    .onTapGesture { self.hide = !self.hide }
                            }
                        }
                    }
                    
                    
                }
                
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1).foregroundColor(self.error.isEmpty ? .appSecondary : .appRed))
            
            if !error.isEmpty {
                HStack {
                    Text(error)
                        .font(.custom("NeoSansStd-Regular", size: 12))
                        .foregroundColor(.appRed)
                }
                .padding(.horizontal, 16)
            }
            
        }
    }
}

struct AnandaTextField_Previews: PreviewProvider {
    static var previews: some View {
        AnandaTextField(
            icon: "lock",
            placeholder: "Placeholder",
            text: .constant(""),
            error: .constant("")
        )
            .previewLayout(.fixed(width: 350, height: 100))
        .padding()
    }
}
