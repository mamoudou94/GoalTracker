//
//  GoalController.swift
//  GoalTracker
//
//  Created by Mamoudou Barry on 6/2/24.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate
class GoalController: UIViewController {

    @IBOutlet var tableView: UITableView!
    private var goalList: [Goal] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchGoal { complete in
            if complete {
                if goalList.count >= 1 {
                    tableView.isHidden = false
                } else {
                    tableView.isHidden = true
                }
            }
        }
        self.tableView.reloadData()
    }

    @IBAction func addButtonTapped(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "createGoalVC") else { return }
        presentDetail(createGoalVC)
    }
    
    func fetchGoal(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        do{
            goalList = try managedContext.fetch(fetchRequest)
            completion(true)
            self.tableView.reloadData()
            print("Successfully fetched")
        } catch {
            debugPrint("COuld not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}

extension GoalController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCellView else {
            return GoalCellView()
        }
        let goal = goalList[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
    
    
}

