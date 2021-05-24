//
//  ObserverViewController.swift
//  client-server-swift
//
//  Created by Алексей Пеньков on 24.05.2021.
//

import UIKit

//Магазин
class Shop {
    //Подписчики
    var listeners = [WeakBuyer]()
    
    //подписка
    func subscribe(buyer: Buyer) {
        let weakBuyer = WeakBuyer(buyer: buyer)
        listeners.append(weakBuyer)
    }
    
    //оповещение
    func notify() {
        listeners.forEach { $0.buyer?.takeInfo() }
    }
}

//контейнер - который хранит слабую ссылку на покупателя
struct WeakBuyer {
    weak var buyer: Buyer?
}

//Покупатель
class Buyer {
    
    
    func takeInfo() {
        print("Покупатель получает уведомление")
    }
}


class ObserverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       let shop = Shop()
        
        let buyer1 = Buyer()
        let buyer2 = Buyer()
        let buyer3 = Buyer()
        
        shop.subscribe(buyer: buyer1)
        shop.subscribe(buyer: buyer3)
        
        shop.notify()
    }
    

}
