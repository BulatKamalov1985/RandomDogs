//
//  QuestionBank.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 01.02.2022.
//

import Foundation

class QuestionBank {
    var list = [Question]()
    
    init() {
        list.append(Question(questionImage: "Affenpinscher", question: "", optionOne: "Affenpinscher", optionTwo: "Greek Harehound", optionThree: "Croatian Sheepdog", optionFour: "Blue Picardy Spanie", correctAnswer: 2))
        list.append(Question(questionImage: "Afghan Hound", question: "", optionOne: "Pudelpointer", optionTwo: "Maltese", optionThree: "Newfoundland", optionFour: "Afghan Hound", correctAnswer: 4))
        list.append(Question(questionImage: "Beagle", question: "Samoyed", optionOne: "Schweizer Laufhund", optionTwo: "Taiwan Dog", optionThree: "Old English Bulldog", optionFour: "Beagle", correctAnswer: 4))
        list.append(Question(questionImage: "Black Russian Terrier", question: "", optionOne: "Black Russian Terrier", optionTwo: "Beagle", optionThree: "Chow Chow", optionFour: "Rottweiler", correctAnswer: 1))
        list.append(Question(questionImage: "Border Collie", question: "", optionOne: "Samoyed", optionTwo: "Border Collie", optionThree: "Beagle", optionFour: "Old English Terrier", correctAnswer: 2))
        list.append(Question(questionImage: "Chow Chow", question: "", optionOne: "Maltese", optionTwo: "Otterhound", optionThree: "Chow Chow", optionFour: "Manchester Terrier", correctAnswer: 3))
        list.append(Question(questionImage: "Danish Spitz", question: "", optionOne: "Samoyed", optionTwo: "Maltese", optionThree: "Toy Bulldog", optionFour: "Danish Spitz", correctAnswer: 4))
        
    }
}
