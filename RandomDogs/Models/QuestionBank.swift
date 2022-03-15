//
//  QuestionBank.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 01.02.2022.
//

import Foundation

class QuestionBank {
    var list = [QuestionModel]()
    
    init() {
        list.append(QuestionModel(ImageName: "Affenpinscher", question: "", optionOne: "Affenpinscher", optionTwo: "Greek Harehound", optionThree: "Croatian Sheepdog", optionFour: "Blue Picardy Spanie", correctAnswer: 2))
        list.append(QuestionModel(ImageName: "Afghan Hound", question: "", optionOne: "Pudelpointer", optionTwo: "Maltese", optionThree: "Newfoundland", optionFour: "Afghan Hound", correctAnswer: 4))
        list.append(QuestionModel(ImageName: "Beagle", question: "Samoyed", optionOne: "Schweizer Laufhund", optionTwo: "Taiwan Dog", optionThree: "Old English Bulldog", optionFour: "Beagle", correctAnswer: 4))
        list.append(QuestionModel(ImageName: "Black Russian Terrier", question: "", optionOne: "Black Russian Terrier", optionTwo: "Beagle", optionThree: "Chow Chow", optionFour: "Rottweiler", correctAnswer: 1))
        list.append(QuestionModel(ImageName: "Border Collie", question: "", optionOne: "Samoyed", optionTwo: "Border Collie", optionThree: "Beagle", optionFour: "Old English Terrier", correctAnswer: 2))
        list.append(QuestionModel(ImageName: "Chow Chow", question: "", optionOne: "Maltese", optionTwo: "Otterhound", optionThree: "Chow Chow", optionFour: "Manchester Terrier", correctAnswer: 3))
        list.append(QuestionModel(ImageName: "Danish Spitz", question: "", optionOne: "Samoyed", optionTwo: "Maltese", optionThree: "Toy Bulldog", optionFour: "Danish Spitz", correctAnswer: 4))
        
    }
}
