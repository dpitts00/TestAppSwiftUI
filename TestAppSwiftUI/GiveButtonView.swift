//
//  GiveButtonView.swift
//  TestAppSwiftUI
//
//  Created by Daniel Pitts on 10/4/21.
//

import SwiftUI

struct GiveButtonView: View {
    @Binding var alertShowing: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
//            LinearGradient(colors: [.gray.opacity(0.25), .white], startPoint: .bottom, endPoint: .top)
//                .frame(height: 32)
            
            Rectangle()
                .fill(Color.gray.opacity(0.25))
                .frame(height: 1)
                .padding(.bottom, 16)

            Button {
                alertShowing = true
                
            } label: {
                Text("Give Now!")
                    .foregroundColor(.white)
                    .font(Font.custom("Avenir", size: 28, relativeTo: .headline))
                    .bold()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8).foregroundColor(.darkPurple)
                    .padding(.horizontal, 16)
            )
            
            Rectangle()
                .fill(Color.white)
                .frame(height: 32)
        }
        .background(Color.white.shadow(radius: 16))

    }
}

struct GiveButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GiveButtonView(alertShowing: .constant(false))
    }
}
