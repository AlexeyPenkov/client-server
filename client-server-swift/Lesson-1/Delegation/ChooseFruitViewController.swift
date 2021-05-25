//
//  MainViewController.swift
//  client-server-swift
//
//  Created by Алексей Пеньков on 24.05.2021.
//

import UIKit

class ChooseFruitViewController: UIViewController, FruitViewControllerDelegate {
  
    
    @IBOutlet weak var fruitLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - FruitViewControllerDelegate
    
    func fruitDidSelect(_ fruit: String) {
        self.fruitLabel.text = fruit
    }
    
    @IBAction func showFruitsViewController(_ sender: Any) {
        
        let fruitsController = FruitsViewController()
        
        //Обозначаем делегатом текущий контроллер - т.е. ChooseFruitViewController
        //Делегирующий объект - FruitsViewController
        fruitsController.delegate = self
        
        self.navigationController?.pushViewController(fruitsController, animated: true)
    }
    
}
