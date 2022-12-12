//
//  CountryLayout.swift
//  together
//
//  Created by Cristea Octavian on 29/04/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation
import UIKit

extension CountryViewController {
    
    func layout() {
        selectorTable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(selectorTable)
        selectorTable.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        selectorTable.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        selectorTable.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        selectorTable.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        topBlur.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topBlur)
        topBlur.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topBlur.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topBlur.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topBlur.heightAnchor.constraint(equalToConstant: view.bounds.height / 6.5).isActive = true
        topBlur.alpha = 0
        
        blurContentArea.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurContentArea)
        blurContentArea.widthAnchor.constraint(equalToConstant: 324).isActive = true
        blurContentArea.heightAnchor.constraint(equalToConstant: 75).isActive = true
        blurContentArea.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blurContentArea.bottomAnchor.constraint(equalTo: topBlur.bottomAnchor).isActive = true
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        blurContentArea.addSubview(cancelButton)
        cancelButton.trailingAnchor.constraint(equalTo: blurContentArea.trailingAnchor, constant: -10).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: blurContentArea.centerYAnchor, constant: 5).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        blurContentArea.addSubview(titleLabel)
        titleLabel.centerYAnchor.constraint(equalTo: blurContentArea.centerYAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: blurContentArea.leadingAnchor, constant: 10).isActive = true
    }
    
}
