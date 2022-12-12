//
//  AuthorisationLayout.swift
//  together
//
//  Created by Cristea Octavian on 21/04/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation
import UIKit

var trailingAnc: NSLayoutConstraint!
var buttonHight = 50
var buttonSpacing = 10
var buttonPosition = 380

extension AuthorizationViewController {
    
    func layout() {
        
        slideBurger.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(slideBurger)
        slideBurger.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        slideBurger.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        bigLogo.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bigLogo)
        bigLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bigLogo.topAnchor.constraint(equalTo: slideBurger.bottomAnchor, constant: 25).isActive = true
        bigLogo.heightAnchor.constraint(equalToConstant: 134).isActive = true
        bigLogo.widthAnchor.constraint(equalToConstant: 155).isActive = true
        
        togetherTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(togetherTitle)
        togetherTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        togetherTitle.topAnchor.constraint(equalTo: bigLogo.bottomAnchor, constant: 15).isActive = true
        
        contentTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentTitle)
        contentTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentTitle.topAnchor.constraint(equalTo: togetherTitle.bottomAnchor, constant: 50).isActive = true
        
        contentText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentText)
        contentText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentText.topAnchor.constraint(equalTo: contentTitle.bottomAnchor, constant: 14).isActive = true
        contentText.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -50).isActive = true
        
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -72).isActive = true
        buttonsView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        buttonsView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        deceButton.translatesAutoresizingMaskIntoConstraints = false
        buttonsView.addSubview(deceButton)
        deceButton.leadingAnchor.constraint(equalTo: buttonsView.leadingAnchor).isActive = true
        deceButton.bottomAnchor.constraint(equalTo: buttonsView.bottomAnchor).isActive = true
        deceButton.heightAnchor.constraint(equalTo: buttonsView.heightAnchor).isActive = true
        deceButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        nuButton.translatesAutoresizingMaskIntoConstraints = false
        buttonsView.addSubview(nuButton)
        nuButton.centerXAnchor.constraint(equalTo: buttonsView.centerXAnchor).isActive = true
        nuButton.bottomAnchor.constraint(equalTo: buttonsView.bottomAnchor).isActive = true
        nuButton.heightAnchor.constraint(equalTo: buttonsView.heightAnchor).isActive = true
        nuButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        daButton.translatesAutoresizingMaskIntoConstraints = false
        buttonsView.addSubview(daButton)
        daButton.trailingAnchor.constraint(equalTo: buttonsView.trailingAnchor).isActive = true
        daButton.bottomAnchor.constraint(equalTo: buttonsView.bottomAnchor).isActive = true
        daButton.heightAnchor.constraint(equalTo: buttonsView.heightAnchor).isActive = true
        daButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        

        shadowView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shadowView)
        shadowView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        shadowView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        shadowView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        shadowView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: 230).isActive = true
        trailingAnc = contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 230)
        trailingAnc.isActive = true
                
        menuTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuTitle)
        menuTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        menuTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 90).isActive = true
                
        menuLogo.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(menuLogo)
        menuLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        menuLogo.topAnchor.constraint(equalTo: menuTitle.bottomAnchor, constant: 30).isActive = true
        menuLogo.heightAnchor.constraint(equalToConstant: 128).isActive = true
        menuLogo.widthAnchor.constraint(equalToConstant: 145).isActive = true
                
        menuButtons.append(appButton)
        menuButtons.append(dezvoltatorButton)
        menuButtons.append(ajutaButton)
        menuButtons.append(raporteazaButton)
                
        buttonPosition = 380
                
        for button in menuButtons {
            button.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(button)
            button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            button.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
            button.heightAnchor.constraint(equalToConstant: CGFloat(buttonHight)).isActive = true
            print(buttonPosition)
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CGFloat(buttonPosition)).isActive = true
            buttonPosition = buttonPosition + buttonSpacing + buttonHight
        }
        
    }
}
