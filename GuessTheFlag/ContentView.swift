//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Shomil Singh on 23/04/23.
//

import SwiftUI

struct ContentView: View {
     @State private var countries=["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    @State private var correctanswers=Int.random(in: 0...2)
    @State private var showingscore=false
    @State private var scoreTitle=""
    @State private var currentScore=0;

    var body: some View {
        ZStack{
//            Color.teal
//                .ignoresSafeArea()
            LinearGradient(gradient: Gradient(colors:[Color(red: 0.0, green: 0.5, blue: 0.5) ,Color(red: 0.8, green: 0.6, blue: 0.2)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text("GUESS THE FLAG")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color(UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.0)))
                Spacer()
                VStack(spacing:35)
                {
                    VStack{
                        Text("Tap the flag of :")
                            .foregroundStyle(.secondary)
                            .font(.title.weight(.semibold))
                        Text(countries[correctanswers])
                            .foregroundColor(Color(UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.0)))
                            .font(.largeTitle.weight(.bold))
                    }
                    ForEach(0..<3){numbers in
                        Button{
                            checkinput(numbers)
                        }label:{
                            Image(countries[numbers])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius:15)
                            
                        }
                        
                    }
                    
                }
                .frame(maxWidth: .infinity)
//                .foregroundColor(scoreTitle=="Correct" ? .green : .red)
                .padding(.vertical,20)
                .background(.ultraThinMaterial)
//                .foreground(scoreTitle=="Correct" ? .green : .red)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score : \(currentScore)")
                    .font(.title2.italic().bold())
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
            
        }
        .alert(scoreTitle, isPresented: $showingscore)
        {
            Button("Continue",action: askQues)
            
            
        }message: {
            Text("Your score is \(currentScore)")
        }
        
        
        
        
       
    }
    
    func checkinput(_ number:Int)
    {
        if(number==correctanswers)
        {
            scoreTitle="Correct"
            currentScore=currentScore+1
        }
        else
        {
            scoreTitle="Incorrect"
            currentScore=0
        }
        showingscore=true
    }
    func askQues(){
        countries.shuffle()
        correctanswers=Int.random(in: 0...2)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


