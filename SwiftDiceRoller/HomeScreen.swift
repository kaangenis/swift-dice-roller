//
//  HomeScreen.swift
//  SwiftDiceRoller
//
//  Created by Kaan Geniş on 15.04.2024.
//

import SwiftUI

struct HomeScreen: View {
    @State private var firstDiceValue: Int = 6
    @State private var secondDiceValue: Int = 6
    @State private var showResetAlert: Bool = false
    
    func throwFunc() {
        withAnimation{
            firstDiceValue = Int.random(in: 1...6)
            secondDiceValue = Int.random(in: 1...6)
        }
    }
    
    func resetFunc() {
        withAnimation{
            firstDiceValue = 6
            secondDiceValue = 6
            showResetAlert = true
        }
    }
    
    var body: some View {
        VStack{
            
            Text("Throw The Dices")
                .font(.largeTitle.lowercaseSmallCaps())
            
            HStack {
                Image(systemName: "die.face.\(firstDiceValue)")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .padding()
                
                Image(systemName: "die.face.\(secondDiceValue)")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .padding()
            }
            .padding()
            
            Button("Throw!"){ throwFunc() }
                .buttonStyle(.borderedProminent)
                .padding()
            
            Button("Reset"){ resetFunc() }
                .buttonStyle(.bordered)
        }
        .alert(isPresented: $showResetAlert){
            Alert(
                title: Text("Resetted."),
                message: Text("Dices Resetted"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    HomeScreen()
}
