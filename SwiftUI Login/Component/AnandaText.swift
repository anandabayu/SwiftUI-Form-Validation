//
//  AnandaText.swift
//  SwiftUI Login
//
//  Created by Ananda Yudhistira on 24/08/20.
//  Copyright © 2020 Ananda Yudhistira. All rights reserved.
//

import Foundation
import SwiftUI

struct AnandaTextTitle: View {
    
    var text: String
    var fgColor: Color = .blue
    var size: CGFloat = 34
    
    var body: some View {
        Text(text)
            .font(.custom("Dosis-ExtraBold", size: size))
            .foregroundColor(fgColor)
    }
}

struct AnandaButtonText: View {
    
    var text: String
    var fgColor: Color = .appSecondary
    var size: CGFloat = 17
    
    var body: some View {
        Text(text)
            .font(.custom("Dosis-Bold", size: size))
            .foregroundColor(fgColor)
    }
}
