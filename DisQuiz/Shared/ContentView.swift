//
//  ContentView.swift
//  Shared
//

//Character name checking is broken
//Can not display counters

import SwiftUI

struct ContentView: View {
    @State private var actualNumber = 1
    @State private var name: String = ""
    @State private var comparisonText = ""
    @State private var correctCount = 0
    @State private var incorrectCount = 0
    @State private var chName = ""
    var body: some View {
        ZStack(alignment: .top){
            Color.cyan.ignoresSafeArea()
            ZStack{
                VStack{
                Text("Who am i?")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(.all)
                    VStack{
        ForEach (characters) { character in
            let characterNumber = character.characterID
            if(characterNumber == actualNumber)
            {
            //chName = character.name
            CharacterImage(character: character)
            }
        }
                        
        TextField(name, text: $name)
            .background(.white)
            .padding(.all)
                        
        Button(action: {
            if(comparisonText == name)
            {
                correctCount = correctCount + 1
            }
            else
            {
                incorrectCount = incorrectCount + 1
                print(incorrectCount)
            }
            name = ""
            actualNumber = Int.random(in: 1...3)
        }, label: {
            Text("Submit")
                .padding(.all)
                .background(.green)
                .foregroundColor(.black)
                .cornerRadius(50)
        })
        VStack{
            HStack{
                Text("Correct")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(.all)
                Text("Incorrect")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(.all)
            }
            HStack{
                Text("correctCount")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(.all)
                Text("incorrectCount")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(.all)
            }
        }
    }
}
}
}
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CharacterImage: View {
    let character: Character
    var body: some View {
        HStack{
            Image(character.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(50)
                .padding()
        }
    }
}
