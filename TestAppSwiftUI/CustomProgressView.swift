//
//  CustomProgressView.swift
//  TestAppSwiftUI
//
//  Created by Daniel Pitts on 10/4/21.
//

import SwiftUI

struct CustomProgressView: View {
    @Binding var currentProgress: Double
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(white: 0.95))
                    HStack {
                        Rectangle()
                            .foregroundColor(.darkPurple)
                            .frame(width: geo.size.width * currentProgress)
                        
                        Spacer()
                    }
                }
            }
            .clipShape(Capsule())

            
            Capsule()
                .strokeBorder(lineWidth: 1, antialiased: true)
                .foregroundColor(Color(white: 0.6))
        }
        .frame(height: 24)

    }
}

struct CustomProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CustomProgressView(currentProgress: .constant(0.4))
    }
}
