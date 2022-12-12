//
//  CountryViewController.swift
//  together
//
//  Created by Cristea Octavian on 29/04/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import UIKit

let cells: CustomCell = selectorTable.cellForRow(at: IndexPath(row: 2, section: 0)) as! CustomCell

let selectorTable: UITableView = {
    let table = UITableView()
    
    return table
}()

class CountryViewController: UIViewController, UITableViewDelegate {

    let topInset = 100;
    
    let topBlur: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blur)
        
        return blurEffectView
    }()
    
    let blurContentArea: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 13.5
        button.backgroundColor = UIColor(red: 0.92, green: 0.43, blue: 0.43, alpha: 1.00)
        button.setTitle("inchide", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        button.addTarget(self, action: #selector(cancelScreen), for: .touchUpInside)
        button.addTarget(self, action: #selector(cancelHold), for: .touchDown)
        
        
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Alege un oras"
        label.font = UIFont(name: "AvenirNext-Medium", size: 30)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        
        selectorTable.register(CustomCell.self, forCellReuseIdentifier: "cell")
        selectorTable.dataSource = self
        selectorTable.delegate = self
        
        selectorTable.backgroundColor = UIColor(red: 0.59, green: 0.67, blue: 0.67, alpha: 1.00)
        
        selectorTable.contentInset.top = 100
        selectorTable.setContentOffset(CGPoint(x: 0, y: -144), animated: true)
        
        selectorTable.rowHeight = 66
        
        selectorTable.separatorStyle = .none
        
    }
    
    var delegate: externalFunctions?
    
    var onlyOnce = true
    
    override func viewDidAppear(_ animated: Bool) {
        if onlyOnce {
            onlyOnce = false
            
        }
    }
    
    @objc func cancelScreen() {
        dismiss(animated: true, completion: nil)
        cancelButton.backgroundColor = UIColor(red: 0.92, green: 0.43, blue: 0.43, alpha: 1.00)
    }
    
    @objc func cancelHold() {
        cancelButton.backgroundColor = UIColor(red: 0.76, green: 0.38, blue: 0.38, alpha: 1.00)
    }
    
}
