//
//  DeceViewController.swift
//  together
//
//  Created by Cristea Octavian on 21/04/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import UIKit

class DeceViewController: UIViewController {
    
    internal lazy var screenTitle: UILabel = {
        var label = UILabel()
        label.text = "De ce?"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 30)
        label.textColor = UIColor(red: 0.45, green: 0.49, blue: 0.84, alpha: 1.00)
        
        return label
    }()

    internal lazy var screenContent: UILabel = {
        let label = UILabel()
        label.text = "Aplicatia aduna locatia fiecarei persoane care o foloseste si o afiseaza. Datele sunt in perfecta siguranta deoarece nimeni (nici noi) nu stie a cui e locatia, e o locatie oarecare, a unei persoane anonime."
        label.numberOfLines = 0
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        label.textColor = .black
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        layout()
        
    }

}
