//
//  DonationView.swift
//  TestAppSwiftUI
//
//  Created by Daniel Pitts on 10/4/21.
//

import SwiftUI

struct DonationView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var firstName = ""
    @State private var lastName = ""
    @Binding var donationAmount: Double
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Donation Form")
                .font(Font.custom("Avenir", size: 24, relativeTo: .headline))
                .bold()
            
            TextField("First name", text: $firstName)
                .textFieldStyle(.roundedBorder)
                .font(Font.custom("Avenir", size: 18, relativeTo: .headline))

            
            TextField("Last name", text: $lastName)
                .textFieldStyle(.roundedBorder)
                .font(Font.custom("Avenir", size: 18, relativeTo: .headline))

            HStack {
                Text("Donation Amount")
                Spacer()
                Text("$\(donationAmount, specifier: "%g")")
            }
            .font(Font.custom("Avenir", size: 18, relativeTo: .headline))

            Slider(value: $donationAmount, in: 0...1000, step: 25) {
                Text("Donation Amount")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("1000")
            }
            .font(Font.custom("Avenir", size: 18, relativeTo: .headline))
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 8).foregroundColor(.darkPurple)
                        .padding(.horizontal, 16)
                Text("Donate Now")
                    .foregroundColor(.white)
                    .font(Font.custom("Avenir", size: 28, relativeTo: .headline))
                    .bold()
                }
            }
            .frame(height: 64)
            .frame(maxWidth: .infinity)
            
        }
        .padding()
        .onAppear {
            donationAmount = 0
        }
    }
}

struct DonationView_Previews: PreviewProvider {
    static var previews: some View {
        DonationView(donationAmount: .constant(125))
    }
}
