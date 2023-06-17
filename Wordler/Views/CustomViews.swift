//
//  CustomViews.swift
//  Wordler
//
//  Created by danilka on 17.06.2023.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    
    var icon: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.init(hex: 0xb6b6b6))
            TextField(title, text: $text)
        }
        .padding(10)
        .background(Color.myGray)
        .clipShape(Capsule())
    }
}

struct GreenButton: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .padding(.horizontal, UIScreen.main.bounds.width / 2.5)
            .background(Color.accentColor)
            .clipShape(Capsule())
            .frame(maxWidth: .infinity)
    }
}
