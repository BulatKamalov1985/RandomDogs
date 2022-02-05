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
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
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
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Собачий фон")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        setupNavigationBar()
        optionOneButton.layer.masksToBounds = true
        optionOneButton.layer.cornerRadius = 12
        optionTwoButton.layer.masksToBounds = true
        optionTwoButton.layer.cornerRadius = 12
        optionThreeButton.layer.masksToBounds = true
        optionThreeButton.layer.cornerRadius = 12
        optionFourButton.layer.masksToBounds = true
        optionFourButton.layer.cornerRadius = 12
        dogImageView.layer.masksToBounds = true
        dogImageView.layer.cornerRadius = 12
        updateUI()
        updateQuestion()
        
    }
    
    private func setupNavigationBar() {
        title = "Dog Quiz"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarAppearance.backgroundColor = UIColor(displayP3Red: 146/255, green: 200/255, blue: 252/255, alpha: 255/255)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.tintColor = .white
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
            dogImageView.image = UIImage(named: (allQuestions.list[questionNumber].questionImage))
            descriptionLabel.text = allQuestions.list[questionNumber].question
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
        progressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
    }
    
}
