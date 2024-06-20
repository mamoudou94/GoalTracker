//
//  GoalCellView.swift
//  GoalTracker
//
//  Created by Mamoudou Barry on 6/3/24.
//

import UIKit

class GoalCellView: UITableViewCell {
    
    @IBOutlet var goalDescriptionLabel: UILabel!
    
    @IBOutlet var goalTypeLabel: UILabel!
    
    @IBOutlet var goalProgress: UILabel!
    
    func configureCell(goal: Goal) {
        self.goalDescriptionLabel.text = goal.goalDescription
        self.goalTypeLabel.text = goal.goalType
        self.goalProgress.text = String(describing: goal.goalProgress)
    }
}
