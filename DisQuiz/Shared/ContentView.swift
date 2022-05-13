//
//  ContentView.swift
//  Shared
//

//Character name checking is broken
//Can not display counters

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
            Color.cyan.ignoresSafeArea()
            VStack{
                Image("logo 2")
                    .offset(y: -150)
                NavigationLink(destination: GameView(totalQuestions: 10, difficulty: "HARD"))
            {
                Text("Quick Play!")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(.all)
            }
            NavigationLink(destination: MenuView(menuTotalQuestions: 10, menuDifficulty: "MEDIUM", difficultyCounter: 2))
            {
                Text("Set Up Game!")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(.all)
            }
            }
            .offset(y: -150)
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

struct MenuView: View {
    @State var menuTotalQuestions: Int
    @State var menuDifficulty: String
    @State var difficultyCounter: Int
    var body: some View {
        ZStack{
        Color.cyan.ignoresSafeArea()
            VStack{
                Image("logo 2")
                Text("Game Settings!")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(.all)
                    .font(.system(size: 25))
                VStack{
                    Text("Total Questions")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .padding(.all)
                HStack{
                    Button(action: {
                        if (menuTotalQuestions > 5)
                        {
                        menuTotalQuestions = menuTotalQuestions - 5
                        }
                        print(menuTotalQuestions)
                    }, label: {
                        Image("UIButtonLEFT")
                            .resizable()
                            .frame(width: 30, height: 30)
                    })
                    
                    let menuQuestionsDisplay = "\(menuTotalQuestions)"
                    
                    Text(menuQuestionsDisplay)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding(.all)
                    
                    Button(action: {
                        if (menuTotalQuestions < 60)
                        {
                        menuTotalQuestions = menuTotalQuestions + 5
                        }
                        print(menuTotalQuestions)
                    }, label: {
                        Image("UIButtonRIGHT")
                            .resizable()
                            .frame(width: 30, height: 30)
                    })
                }
                }
                
                VStack{
                    Text("Difficulty")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                        .padding(.all)
                HStack{
                    Button(action: {
                        if (difficultyCounter == 2)
                        {
                            difficultyCounter = 1
                            menuDifficulty = "EASY"
                        }
                        else if (difficultyCounter == 3)
                        {
                            difficultyCounter = 2
                            menuDifficulty = "MEDIUM"
                        }
                        print(difficultyCounter)
                        print(menuDifficulty)
                    }, label: {
                        Image("UIButtonLEFT")
                            .resizable()
                            .frame(width: 30, height: 30)
                    })
                    
                    Text(menuDifficulty)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding(.all)
                    
                    Button(action: {
                        if (difficultyCounter == 1)
                        {
                            difficultyCounter = 2
                            menuDifficulty = "MEDIUM"
                        }
                        else if (difficultyCounter == 2)
                        {
                            difficultyCounter = 3
                            menuDifficulty = "HARD"
                        }
                        print(difficultyCounter)
                        print(menuDifficulty)
                    }, label: {
                        Image("UIButtonRIGHT")
                            .resizable()
                            .frame(width: 30, height: 30)
                    })
                }
                }
                NavigationLink(destination: GameView(totalQuestions: menuTotalQuestions, difficulty: menuDifficulty))
                {
                    Text("Play Game!")
                        .padding(.all)
                        .background(.green)
                        .foregroundColor(.black)
                        .cornerRadius(50)
                }
            }
            .offset(y: -80)
            }
        }
    }

struct GameView: View {
    @State private var actualNumber = 1
    @State private var name: String = ""
    @State private var comparisonText = ""
    @State private var correctCount = 0
    @State private var incorrectCount = 0
    @State private var chName = ""
    @State private var characterNumber = 0
    var totalQuestions: Int
    var difficulty: String
    @State var question = 0
    var body: some View {
        ZStack(alignment: .top){
            Color.cyan.ignoresSafeArea()
            ZStack{
                VStack{
                    Image("logo 2")
                Text("Who am i?")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(.all)
                    VStack{
        ForEach (characters) { character in
            let characterNumber = character.characterID
            //chName = character.name
            if(characterNumber == actualNumber)
            {
            CharacterImage(character: character)
            }
        }
                        
        TextField(name, text: $name)
            .background(.white)
            .padding(.all)
                        
        Button(action: {
            if(question < totalQuestions)
            {
                if(name != "")
                {
                    question = question + 1
                    if(name != "" && comparisonText == name)
                    {
                        correctCount = correctCount + 1
                    }
                    else
                    {
                        incorrectCount = incorrectCount + 1
                    }
                    if(difficulty == "EASY")
                    {
                        actualNumber = Int.random(in: 1...20)
                    }
                    else if (difficulty == "MEDIUM")
                    {
                        actualNumber = Int.random(in: 1...40)
                    }
                    else if (difficulty == "HARD")
                    {
                        actualNumber = Int.random(in: 1...60)
                    }
                    name = ""
                    }
                }
        }, label: {
            Text("Submit")
                .padding(.all)
                .background(.green)
                .foregroundColor(.black)
                .cornerRadius(50)
        })
        if (question == totalQuestions)
        {
            NavigationLink(destination: ResultsView(correctAnswers: correctCount, incorrectAnswers: incorrectCount))
            {
                Text("Game Finished! Go To Results")
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

struct ResultsView: View {
    var correctAnswers: Int
    var incorrectAnswers: Int
    var body: some View {
        ZStack{
        Color.cyan.ignoresSafeArea()
        VStack{
            Image("logo 2")
            let correctDisplay = "\(correctAnswers)"
            let incorrectDisplay = "\(incorrectAnswers)"
            Text("Results!")
            Text("You answered " + correctDisplay + " correctly")
            Text("You answered " + incorrectDisplay + " incorrectly")
            NavigationLink(destination: ContentView())
            {
                Text("Play Again")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(.all)
            }
        }
        }
    }
}
