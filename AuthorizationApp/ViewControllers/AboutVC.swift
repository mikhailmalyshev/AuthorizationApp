//
//  AboutVC.swift
//  AuthorizationApp
//
//  Created by Михаил Малышев on 08/03/2020.
//  Copyright © 2020 Mikhail Malyshev. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {
    

    @IBOutlet weak var aboutMeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMeLabel.text = "Меня зовут Михаил Малышев. Мне 25 лет. Живу в столице нашей необъятной Родины уже 7,5 лет. Люблю ходить кататься на сноуборде, смотреть сериалы и фильмы, посещать новые места. По образованию инженер-менеджер. В данный момент изучаю язык программирования Swift. Надеюсь, что это поможет мне сменить сферу деятельности и найти свое дело."
        
    }
    
    
}
