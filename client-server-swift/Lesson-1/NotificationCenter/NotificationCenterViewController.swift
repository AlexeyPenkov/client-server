//
//  NotificationCenterViewController.swift
//  client-server-swift
//
//  Created by Алексей Пеньков on 24.05.2021.
//

import UIKit

class NotificationCenterViewController: UIViewController {

    let backgroundChangeColorNotification = Notification.Name("backgroudChangeColorNotification")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeColor(notification:)),
                                               name: backgroundChangeColorNotification,
                                               object: nil)
    }

    @objc func changeColor(notification: Notification) {
        guard let color = notification.userInfo?["color"] as? UIColor else { return }
        view.backgroundColor = color
    }
    
    @IBAction func changeColorAction(_ sender: Any) {
        
        let color = UIColor.green
        NotificationCenter.default.post(name: backgroundChangeColorNotification, object: nil, userInfo: ["color": color])
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: backgroundChangeColorNotification, object: nil)
    }
}
