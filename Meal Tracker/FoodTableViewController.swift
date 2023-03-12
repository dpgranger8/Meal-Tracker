//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by David Granger on 3/9/23.
//

import UIKit

var meals: [Meal] {
    var breakfast = Meal(name: "Breakfast", food: [])
    var lunch = Meal(name: "Lunch", food: [])
    var dinner = Meal(name: "Dinner", food: [])
    
    // Set their food values
            breakfast.food = [
                Food(name: "Eggs", description: "Scrambled eggs with cheese and spinach"),
                Food(name: "Toast", description: "Whole wheat toast with avocado"),
                Food(name: "Fruit", description: "Mixed berries and banana")
            ]
            
            lunch.food = [
                Food(name: "Sandwich", description: "Turkey and cheese on whole grain bread"),
                Food(name: "Chips", description: "Baked potato chips"),
                Food(name: "Carrots", description: "Baby carrots with hummus")
            ]
            
            dinner.food = [
                Food(name: "Salmon", description: "Grilled salmon with lemon and herbs"),
                Food(name: "Rice", description: "Brown rice with diced vegetables"),
                Food(name: "Green Beans", description: "Steamed green beans with garlic and olive oil")
            ]
    
    return [breakfast, lunch, dinner]
}

class FoodTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)

        var content = cell.defaultContentConfiguration()
        content.text = meals[indexPath.section].food[indexPath.row].name
        content.secondaryText = meals[indexPath.section].food[indexPath.row].description
        cell.contentConfiguration = content

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}
