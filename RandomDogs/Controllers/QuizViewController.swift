//
//  QuizViewController.swift
//  RandomDogs
//
//  Created by Bulat Kamalov on 31.01.2022.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var dogImageView: UIImageView!
    
    @IBOutlet weak var optionOneButton: UIButton!
    @IBOutlet weak var optionTwoButton: UIButton!
    @IBOutlet weak var optionThreeButton: UIButton!
    @IBOutlet weak var optionFourButton: UIButton!
    
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        setupNavigationBar(navTitle: "Dog Quiz".uppercased())
        optionOneButton.roundedStyle()
        optionTwoButton.roundedStyle()
        optionThreeButton.roundedStyle()
        optionFourButton.roundedStyle()
        dogImageView.roundedStyle()
  
        updateUI()
        updateQuestion()
    }
    
    
    @IBAction func answerPassed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            print("Correct")
            score += 1
        } else {
            print("Wrong")
        }
        questionNumber += 1
        updateQuestion()
    }
    
    func updateQuestion() {
        if questionNumber <= allQuestions.list.count - 1 {
            dogImageView.image = UIImage(named: (allQuestions.list[questionNumber].ImageName))
            optionOneButton.setTitle(allQuestions.list[questionNumber].optionOne, for: .normal)
            optionTwoButton.setTitle(allQuestions.list[questionNumber].optionTwo, for: .normal)
            optionThreeButton.setTitle(allQuestions.list[questionNumber].optionThree, for: .normal)
            optionFourButton.setTitle(allQuestions.list[questionNumber].optionFour, for: .normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer
        } else {
            let alert = UIAlertController(title: "Awesome", message: "End of Quiz. Do you want to start over?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { action in
                self.restartQuiz()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        updateUI()
    }
    
    func updateUI() {
        scoreLabel.text = "\(score)"
        questionCounter.text = "\(questionNumber + 1)/\(allQuestions.list.count + 1)"
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
    }
}
