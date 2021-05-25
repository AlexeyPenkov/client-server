//
//  FruitsViewController.swift
//  client-server-swift
//
//  Created by Алексей Пеньков on 24.05.2021.
//

import UIKit

protocol FruitViewControllerDelegate: AnyObject {
    
    func fruitDidSelect(_ fruit: String)
}

// Делегирующий объект
class FruitsViewController: UITableViewController {

    weak var delegate: FruitViewControllerDelegate?
    
    let fruits = ["Яблоко", "Банан", "Киви", "Авокадо"]
        
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "AppleCell")
    }
    
    // MARK: - UITableViewDatasource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "AppleCell", for: indexPath)
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDatasource
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fruit = fruits[indexPath.row]
        
        delegate?.fruitDidSelect(fruit)
        self.navigationController?.popViewController(animated: true)
    }
    
}
