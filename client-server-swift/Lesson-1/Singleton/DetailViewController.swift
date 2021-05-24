//
//  DetailViewController.swift
//  client-server-swift
//
//  Created by Алексей Пеньков on 24.05.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cashLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = AccountService.shared.name
        cashLabel.text = String(AccountService.shared.cash)
    }
    


}
