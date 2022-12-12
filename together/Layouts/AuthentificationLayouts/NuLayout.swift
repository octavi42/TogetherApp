//
//  NuLayout.swift
//  together
//
//  Created by Cristea Octavian on 21/04/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation

extension NuViewController {
    func layout() {
        
        screenTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(screenTitle)
        screenTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        screenTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
        screenContent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(screenContent)
        screenContent.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        screenContent.topAnchor.constraint(equalTo: screenTitle.bottomAnchor, constant: 50).isActive = true
        screenContent.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        
    }
}
