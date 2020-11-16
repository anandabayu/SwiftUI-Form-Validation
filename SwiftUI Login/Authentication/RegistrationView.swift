//
//  RegistrationView.swift
//  SwiftUI Login
//
//  Created by Ananda Yudhistira on 24/08/20.
//  Copyright © 2020 Ananda Yudhistira. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
    
    //MARK: - Views Setting
    @Binding var isNavigationBarHidden: Bool
    
    var body: some View {
        ZStack {
            Text("HOLA")
        }
        .navigationBarTitle(Text("Registrasi"), displayMode: .inline)
        .onAppear {
            self.isNavigationBarHidden = false
        }
    }
}

#if DEBUG
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(isNavigationBarHidden: .constant(false))
    }
}
#endif
