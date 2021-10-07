//
//  ContentView.swift
//  TestAppSwiftUI
//
//  Created by Daniel Pitts on 10/4/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let navBarBackground = UINavigationBarAppearance()
        navBarBackground.configureWithOpaqueBackground()
        navBarBackground.backgroundColor = .darkTeal
        UINavigationBar.appearance().standardAppearance = navBarBackground
        UINavigationBar.appearance().scrollEdgeAppearance = navBarBackground
    }
    
    let projectTitle = "Global Water Initiative"
    let descriptionText = "Every year, middle-class American families put off traveling because they're too busy or too tired, or they just don't have enough money. And, in some ways, they're right. Traveling can be expensive. But by taking the time to learn about discounts readily available to everyone through the internet..."
    let thankYouMessage = "Thanks for your generous donation!"
    
    let goalAmount: Double = 1000.0
    
    @State private var currentAmount: Double = 0.0
    @State private var currentProgress: Double = 0.0
    @State private var donationAmount: Double = 0.0
    @State private var donationCompleted = false
    
    @State private var alertShowing = false
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 16) {
                            Image("logo-fullsize")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 75)
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray).opacity(0.25)
                        }
                        
                        Text(projectTitle)
                            .font(Font.custom("Avenir", size: 18, relativeTo: .headline))
                        
                        Text("Description")
                            .font(Font.custom("Avenir", size: 18, relativeTo: .headline))
                            .bold()
                        
                        Text(descriptionText)
                            .font(Font.custom("Avenir", size: 18, relativeTo: .headline))
                        
                        HStack(alignment: .firstTextBaseline) {
                            Text(NumberFormatter.currencyFormatter.string(for: currentAmount) ?? "$0.00")
                                .font(Font.custom("Avenir", size: 28, relativeTo: .title))
                                .foregroundColor(.darkPurple)
                                .bold()
                            Text("raised")
                                .font(Font.custom("Avenir", size: 18, relativeTo: .headline))
                        }
                        
                        HStack {
                            Text("0%")
                            Spacer()
                            Text("100%")
                        }
                        .font(Font.custom("Avenir", size: 18, relativeTo: .headline))
                        .foregroundColor(.gray)
                        
                        CustomProgressView(currentProgress: $currentProgress)
                        
                        if donationCompleted {
                            Text(thankYouMessage)
                                .italic()
                                .foregroundColor(.darkPurple)
                        }
                        
                        Spacer()
                        
                    } // end VStack
                    .padding(.horizontal, 16)
                    
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray).opacity(0.25)
                } // end ScrollView
                
                GiveButtonView(alertShowing: $alertShowing)
                    .sheet(isPresented: $alertShowing, onDismiss: {
                        currentAmount += donationAmount
                        withAnimation {
                            currentProgress = currentAmount / goalAmount
                        }
                    }) {
                        DonationView(donationAmount: $donationAmount)
                    }
                
            } // end outer VStack
            .edgesIgnoringSafeArea(.bottom)
        } // end NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
