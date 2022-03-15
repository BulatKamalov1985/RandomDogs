//
//  BreedBank.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 05.02.2022.
//

final class CommonsData {
    static let breeds = [
        "affenpinscher", "african", "airedale", "akita", "appenzeller",
        "australian", "shepherd", "basenji", "beagle", "bluetick", "borzoi",
        "bouvier", "boxer", "brabancon", "briard", "buhund", "norwegian",
        "bulldog", "bullterrier", "cattledog", "chihuahua", "chow", "clumber",
        "cockapoo", "collie", "coonhound", "corgi", "cotondetulear",
        "dachshund", "dalmatian", "dane dog", "dhole", "dingo", "doberman",
        "elkhound", "entlebucher", "eskimo", "finnish", "husky", "keeshond",
        "kelpie", "komondor", "kuvasz", "labradoodle", "labrador",
        "tervuren", "vizsla","waterdog", "labradoodle", "leonberg", "lhasa",
        "malamute", "malinois", "maltese", "mastiff", "mix", "mountain", "newfoundland",
        "otterhound", "ovcharka", "pug", "puggle", "papillon","pekinese",
        "pembroke", "pinscher", "otterhound", "ovcharka", "mexicanhairless",
        "mountain"
    ]

    static let questions: [QuestionModel] = [
        QuestionModel(ImageName: "Affenpinscher", question: "", optionOne: "Affenpinscher", optionTwo: "Greek Harehound", optionThree: "Croatian Sheepdog", optionFour: "Blue Picardy Spanie", correctAnswer: 2),
        QuestionModel(ImageName: "Afghan Hound", question: "", optionOne: "Pudelpointer", optionTwo: "Maltese", optionThree: "Newfoundland", optionFour: "Afghan Hound", correctAnswer: 4),
        QuestionModel(ImageName: "Beagle", question: "Samoyed", optionOne: "Schweizer Laufhund", optionTwo: "Taiwan Dog", optionThree: "Old English Bulldog", optionFour: "Beagle", correctAnswer: 4),
        QuestionModel(ImageName: "Black Russian Terrier", question: "", optionOne: "Black Russian Terrier", optionTwo: "Beagle", optionThree: "Chow Chow", optionFour: "Rottweiler", correctAnswer: 1),
        QuestionModel(ImageName: "Border Collie", question: "", optionOne: "Samoyed", optionTwo: "Border Collie", optionThree: "Beagle", optionFour: "Old English Terrier", correctAnswer: 2),
        QuestionModel(ImageName: "Chow Chow", question: "", optionOne: "Maltese", optionTwo: "Otterhound", optionThree: "Chow Chow", optionFour: "Manchester Terrier", correctAnswer: 3),
        QuestionModel(ImageName: "Danish Spitz", question: "", optionOne: "Samoyed", optionTwo: "Maltese", optionThree: "Toy Bulldog", optionFour: "Danish Spitz", correctAnswer: 4)
    ]

    static let descriptions: [String] = ["Aктивный", "Aмбициозный", "Жаждущий внимания", "Жизнерадостный", "Творческий", "Любопытный", "Решительный", "Устремленный", "Энергичный", "Дружелюбный", "Тудолюбивый", "Полезный", "Скромный", "Терпеливый", "Застенчивый", "Серьезный", "Хвастливый", "Непредсказуемый", "Осторожный", "Приветливый", "Скучный", "Уравновешенный", "Непокорный", "Послушный", "Неряха"]
}

struct BreedBank {
    
    var breedList = ["affenpinscher", "african", "airedale", "akita", "appenzeller", "australian", "basenji", "beagle", "bluetick", "borzoi", "bouvier", "boxer", "brabancon", "briard", "buhund", "norwegian", "bulldog", "bullterrier", "cattledog", "chihuahua", "chow", "clumber", "cockapoo", "collie", "coonhound", "corgi", "cotondetulear", "dachshund", "dalmatian", "dane dog", "dhole", "dingo", "doberman", "elkhound", "entlebucher", "eskimo", "finnish", "husky", "keeshond", "kelpie", "komondor", "kuvasz", "labradoodle", "labrador", "tervuren", "vizsla","waterdog", "leonberg", "lhasa", "malamute", "malinois", "maltese", "mastiff", "mix", "mountain", "newfoundland", "otterhound", "ovcharka", "pug", "puggle", "papillon","pekinese", "pembroke", "pinscher", "otterhound", "ovcharka", "mexicanhairless", "mountain"]
}
