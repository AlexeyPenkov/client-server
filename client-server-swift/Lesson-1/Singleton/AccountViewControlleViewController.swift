//
//  AccountViewControlleViewController.swift
//  client-server-swift
//
//  Created by Алексей Пеньков on 24.05.2021.
//

import UIKit

class AccountViewControlleViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  
    
    @IBAction func transferAction(_ sender: Any) {
        
        guard let name = nameTextField.text,
              let cashString = cashTextField.text,
              let cash = Int(cashString)
        else {
            return
        }
        
        AccountService.shared.name = name
        AccountService.shared.cash = cash
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
