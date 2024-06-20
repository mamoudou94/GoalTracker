//
//  FInishGoalViewController.swift
//  GoalTracker
//
//  Created by Mamoudou Barry on 6/9/24.
//

import UIKit
import CoreData

class FInishGoalViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var createGoalBtn: UIButton!
    @IBOutlet var pointsTextField: UITextField!
    var goalDescription = String()
    var goalType: GoalType!
    
    func initData(goalDescription: String, goalType: GoalType) {
        self.goalDescription = goalDescription
        self.goalType = goalType
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pointsTextField.delegate = self
        self.createGoalBtn.bindToKeyboard()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createGoalBtnPressed(_ sender: Any) {
        save { finished in
            if finished {
                dismiss(animated: true)
            }
        }
    }
    
    func save(completion:(_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        goal.goalType = goalType.rawValue
        goal.goalDescription = goalDescription
        goal.goalProgress = Int32(0)
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        guard managedContext.hasChanges else { return }
        do {
            try managedContext.save()
            completion(true)
            
        } catch {
            debugPrint("Couldn't save: \(error.localizedDescription)")
            completion(false)
        }
        
    }

}
