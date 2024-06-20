//
//  CreateGoalViewController.swift
//  GoalTracker
//
//  Created by Mamoudou Barry on 6/7/24.
//

import UIKit

class CreateGoalViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var goalTextView: UITextView!
    
    @IBOutlet var shortermBtn: UIButton!
    
    @IBOutlet var longTermBtn: UIButton!
    
    @IBOutlet var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.goalTextView.delegate = self
        nextBtn.bindToKeyboard()
        shortermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.goalTextView.text = ""
        self.goalTextView.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
    
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
        if goalTextView.text != "What is your goal?" && goalTextView.hasText {
            guard let finishGoalVC = storyboard?.instantiateViewController(identifier: "finishGoal") as? FInishGoalViewController else { return }
            finishGoalVC.initData(goalDescription: goalTextView.text, goalType: goalType)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
    }
    
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        goalType = .shortTerm
        shortermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortermBtn.setDeselectedColor()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
