//
//  AnandaButton.swift
//  SwiftUI Login
//
//  Created by Ananda Yudhistira on 24/08/20.
//  Copyright © 2020 Ananda Yudhistira. All rights reserved.
//

import SwiftUI

struct AnandaButtonProperties {
    let fgColor: Color
    let bgColor: [Color]
    var height: CGFloat = 15
}

struct AnandaButton: View {
    
    var act: () -> Void
    
    var title: String = "Button"
    var properties: AnandaButtonProperties = AnandaButtonProperties(fgColor: .white, bgColor: [.blue, .blue])
    
    var body: some View {
        Button(action: {
            self.act()
        }){
            HStack {
                Spacer()
                Text(title)
                    .font(.custom("NeoSansStd-Bold", size: 14))
                Spacer()
            }
            .frame(minWidth: 100, maxWidth: .infinity, maxHeight: properties.height)
        }
        .buttonStyle(
            AnandaButtonStyle(
                fgColor: properties.fgColor,
                bgColor: properties.bgColor,
                scale: 1.02
        ))
    }
}

struct AnandaButton_Previews: PreviewProvider {
    static var previews: some View {
        AnandaButton(act: {}).previewLayout(.fixed(width: 350, height: 100))
        .padding()
    }
}

struct AnandaButtonStyle: ButtonStyle {
    
    var fgColor: Color = Color.white
    var bgColor: [Color] = [Color.red, Color.orange]
    var scale: CGFloat = 1.0
    var radius: CGFloat = 10
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(fgColor)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: bgColor), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(radius)
            .scaleEffect(configuration.isPressed ? scale : 1.0)
    }
}
