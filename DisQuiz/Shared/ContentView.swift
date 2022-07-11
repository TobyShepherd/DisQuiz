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
                    Image("star sky")
                        .resizable()
                        .frame(width: 400, height: 900)
                        .offset(y: -50)
                VStack{
                
                Image("logo 2")
                
            NavigationLink(destination: GameView(totalQuestions: 10, difficulty: "HARD"))
            {
                Text("Quick Play!")
                    .padding(.all)
                    .background(.green)
                    .foregroundColor(.black)
                    .cornerRadius(50)
                    .font(.system(size: 50))
            }
            NavigationLink(destination: MenuView(menuTotalQuestions: 10, menuDifficulty: "MEDIUM", difficultyCounter: 2))
            {
                Text("Set Up Game!")
                    .padding(.all)
                    .background(.green)
                    .foregroundColor(.black)
                    .cornerRadius(50)
                    .font(.system(size: 50))
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
            Image("star sky")
                .resizable()
                .frame(width: 400, height: 900)
                .offset(y: -50)
            VStack{
                Image("logo 2")
                Text("Game Settings!")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(.all)
                    .font(.system(size: 25))
                VStack{
                    Text("Total Questions")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding(.all)
                HStack{
                    Button(action: {
                        if (menuTotalQuestions > 5)
                        {
                        menuTotalQuestions = menuTotalQuestions - 5
                        }
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
                    }, label: {
                        Image("UIButtonRIGHT")
                            .resizable()
                            .frame(width: 30, height: 30)
                    })
                }
                }
                
                VStack{
                    Text("Difficulty")
                        .foregroundColor(.white)
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
    @State private var actualNumber = Int.random(in: 1...60)
    @State private var name: String = ""
    @State private var comparisonText = ""
    @State private var correctCount = 0
    @State private var incorrectCount = 0
    @State private var characterNumber = 0
    @State private var gameActive = false
    @State private var answered = false
    @State private var newNumber = false;
    var totalQuestions: Int
    var difficulty: String
    @State var question = 0
    var body: some View {
        ZStack(alignment: .top){
            Image("star sky")
                .resizable()
                .frame(width: 400, height: 900)
                .offset(y: -50)
                VStack{
                    Image("logo 2")
                VStack{
                if(gameActive)
                {
                    Text("Who am I?")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(.all)
                }
                    VStack{
            ForEach (characters) { character in
            let characterNumber = character.characterID
            if(characterNumber == actualNumber)
            {
                if(gameActive)
                {
                    CharacterImage(character: character)
                    
                    TextField(name, text: $name)
                        .background(.white)
                        .padding(.all)
                    
                    if(!answered)
                    {
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
                                    comparisonText = character.name
                                }
                                else if (difficulty == "MEDIUM")
                                {
                                    actualNumber = Int.random(in: 1...40)
                                    comparisonText = character.name
                                }
                                else if (difficulty == "HARD")
                                {
                                    
                                    actualNumber = Int.random(in: 1...60)
                                    comparisonText = character.name
                                }
                                name = ""
                                }
                            }
                        if (question == totalQuestions)
                        {
                            gameActive = false
                        }
                    }, label: {
                        Text("Submit")
                            .padding(.all)
                            .background(.green)
                            .foregroundColor(.black)
                            .cornerRadius(50)
                    })
                    }
                }
                if (!gameActive && question < totalQuestions)
                {
                    Button(action: {
                        comparisonText = character.name
                        gameActive = true
                    }, label: {
                        if(!gameActive)
                        {
                            Text("Begin Round!")
                                .padding(.all)
                                .background(.green)
                                .foregroundColor(.black)
                                .cornerRadius(50)
                        }
                        if(!answered && gameActive)
                        {
                        Text("when does this appear")
                            .padding(.all)
                            .background(.green)
                            .foregroundColor(.black)
                            .cornerRadius(50)
                        }
                        if(answered && gameActive)
                        {
                            Text("Next Character!")
                                .padding(.all)
                                .background(.green)
                                .foregroundColor(.black)
                                .cornerRadius(50)
                        }
                })
                }
            }
        }
        if (question == totalQuestions)
        {
            let correctDisplay = "\(correctCount)"
            let incorrectDisplay = "\(incorrectCount)"
            Text("Results!")
                .font(.system(size: 35))
                .foregroundColor(.white)
            Text("You answered " + correctDisplay + " correctly")
                .font(.system(size: 30))
                .foregroundColor(.white)
            Text("You answered " + incorrectDisplay + " incorrectly")
                .foregroundColor(.white)
                .font(.system(size: 30))
            Text("If you want to play again, click the back button!")
                .padding(.all)
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(50)
            }
        }
    }
}
                .offset(y: -50)
}
}
}
