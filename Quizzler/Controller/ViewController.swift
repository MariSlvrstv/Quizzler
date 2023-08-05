//
//  ViewController.swift
//  Quizzler
//
//  Created by Мария Селиверстова on 05.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
  var quizBrain = QuizBrain()


         

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var trueLabel: UIButton!
    @IBOutlet weak var falseLabel: UIButton!
    @IBOutlet weak var progreeBar: UIProgressView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
       let userAnswer = sender.currentTitle!
       let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)

        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
      Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
    }
    
   @objc func updateUI() {
       QuestionLabel.text = quizBrain.getQuestionText()
        trueLabel.backgroundColor = UIColor.clear
        falseLabel.backgroundColor = UIColor.clear
       scoreLabel.text = "Score: \(quizBrain.getScore())"
       progreeBar.progress = quizBrain.getProgress()
    }
    
    
}

