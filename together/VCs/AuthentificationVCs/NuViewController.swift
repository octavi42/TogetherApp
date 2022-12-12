//
//  NuViewController.swift
//  together
//
//  Created by Cristea Octavian on 21/04/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import UIKit

class NuViewController: UIViewController {
    
    internal lazy var screenTitle: UILabel = {
        var label = UILabel()
        label.text = "Nu"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 30)
        label.textColor = UIColor(red: 0.84, green: 0.45, blue: 0.45, alpha: 1.00)
        
        return label
    }()
    
    internal lazy var screenContent: UILabel = {
        let label = UILabel()
        label.text = "Ne pare rau dar nu te putem lasa sa folosesti aplicatia daca nu ne poti oferi accesul la locatie.\nDupa cum se intelege din numele aplicatiei 'together', (tradus 'impreuna') trebuie sa lucram impreuna pentru a combati aceasta problema iar aplicatia functioneaza cu atat mai bine cu cat numarul utilizatorilor creste, te rugam, daca vrei sa contribui la rezolvarea unei probleme care ne dicteaza in mod drastic modul de viata, alatura-te noua si accepta conditiile impuse de noi."
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
