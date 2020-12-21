//
//  CustomButtonStyle.swift
//  cinebase-ios
//
//  Created by Andimas Bagaswara on 21/12/20.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    
    var foregroundColor: Color
    var backgroundColor: Color
    
    init(isSelected: Bool) {
        foregroundColor = isSelected ? Color.white : Color.orange
        backgroundColor = isSelected ? Color.orange : Color.white
    }
    
    func makeBody(configuration: Self.Configuration) -> some View {        configuration.label
        .font(.customHeading)
        .frame(width: Constants.widthRatio * 100, height: Constants.heightRatio * 44, alignment: .center)
        .foregroundColor(configuration.isPressed ? Color.white.opacity(0.6) : foregroundColor)
        .background(backgroundColor)
        .cornerRadius(.greatestFiniteMagnitude)
        .shadow(color: Color.init(.gray).opacity(0.2), radius: 15, x: 0, y: 4)
    }
}

#if DEBUG
struct CustomButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            Button("Saved") {
                // Action
            }
            .buttonStyle(CustomButtonStyle(isSelected: true))
            .environment(\.colorScheme, .light)
            .previewDisplayName("Primary Button")
            
            Button("Save") {
                // Action
            }
            .buttonStyle(CustomButtonStyle(isSelected: false))
            .environment(\.colorScheme, .light)
            .previewDisplayName("Secondary Button")
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
#endif
