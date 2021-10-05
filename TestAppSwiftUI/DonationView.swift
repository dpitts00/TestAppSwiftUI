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
    @State private var donation = ""
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Donation Form")
                .font(.headline)
            
            TextField("First name", text: $firstName)
                .padding()
                .border(Color.gray.opacity(0.25), width: 1)
            
            TextField("Last name", text: $lastName)                .padding()
                .border(Color.gray.opacity(0.25), width: 1)
            
            TextField("Enter an amount to donate", text: $donation, onCommit:  {
                if let donation = Double(donation) {
                    donationAmount = donation
                }
            })
                .padding()
                .border(Color.gray.opacity(0.25), width: 1)
                .keyboardType(.decimalPad)
            
            Spacer()
            
            Button {
                if let donation = Double(donation) {
                    donationAmount = donation
                }
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Donate Now")
                    .foregroundColor(.white)
                    .font(Font.custom("Avenir", size: 28, relativeTo: .headline))
                    .bold()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8).foregroundColor(.darkPurple)
            )
            

        }
        .padding()
    }
}

struct DonationView_Previews: PreviewProvider {
    static var previews: some View {
        DonationView(donationAmount: .constant(0))
    }
}
