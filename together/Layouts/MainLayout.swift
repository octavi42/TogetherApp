//
//  File.swift
//  together
//
//  Created by Cristea Octavian on 18/04/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation
import UIKit
import MapKit

var trailingAnc2: NSLayoutConstraint!
var buttonHight2 = 50
var buttonSpacing2 = 10
var buttonPosition2 = 380
var bottomViewOffset: NSLayoutConstraint!
var bottomViewsSpacing = 34
var bottomPopup: NSLayoutConstraint!
var zeroAlpha = [UIView()]

extension ViewController {
    internal func layout() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        bottomContentArea.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomContentArea)
        bottomContentArea.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomPopup = bottomContentArea.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        bottomPopup.isActive = true
        bottomContentArea.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomContentArea.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        bottomArea.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomArea)
        bottomArea.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bottomArea.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        bottomArea.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomArea.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomArea.topAnchor.constraint(equalTo: bottomContentArea.topAnchor).isActive = true
        
        chartI.translatesAutoresizingMaskIntoConstraints = false
        bottomArea.addSubview(chartI)
        chartI.widthAnchor.constraint(equalTo: bottomArea.widthAnchor).isActive = true
        chartI.heightAnchor.constraint(equalToConstant: 250).isActive = true
        chartI.bottomAnchor.constraint(equalTo: bottomArea.bottomAnchor).isActive = true
        
        chartView.translatesAutoresizingMaskIntoConstraints = false
        bottomArea.addSubview(chartView)
        chartView.bottomAnchor.constraint(equalTo: chartI.topAnchor).isActive = true
        chartView.leadingAnchor.constraint(equalTo: chartI.leadingAnchor).isActive = true
        chartView.trailingAnchor.constraint(equalTo: chartI.trailingAnchor).isActive = true
        chartView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        centerDataView.translatesAutoresizingMaskIntoConstraints = false
        bottomArea.addSubview(centerDataView)
        centerDataView.topAnchor.constraint(equalTo: bottomArea.topAnchor).isActive = true
        centerDataView.trailingAnchor.constraint(equalTo: bottomArea.trailingAnchor).isActive = true
        centerDataView.bottomAnchor.constraint(equalTo: chartView.topAnchor).isActive = true
        centerDataView.leadingAnchor.constraint(equalTo: bottomArea.leadingAnchor).isActive = true
        
        dataView.translatesAutoresizingMaskIntoConstraints = false
        bottomArea.addSubview(dataView)
        dataView.centerYAnchor.constraint(equalTo: centerDataView.centerYAnchor, constant: -10).isActive = true
        dataView.leadingAnchor.constraint(equalTo: bottomArea.leadingAnchor).isActive = true
        dataView.trailingAnchor.constraint(equalTo: bottomArea.trailingAnchor).isActive = true
        //dataView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        bottomTitle.translatesAutoresizingMaskIntoConstraints = false
        bottomArea.addSubview(bottomTitle)
        bottomTitle.centerYAnchor.constraint(equalTo: bottomContentArea.centerYAnchor).isActive = true
        bottomTitle.leadingAnchor.constraint(equalTo: bottomContentArea.leadingAnchor, constant: 10).isActive = true
        bottomTitle.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        bottomDataView.translatesAutoresizingMaskIntoConstraints = false
        bottomArea.addSubview(bottomDataView)
        bottomDataView.centerYAnchor.constraint(equalTo: bottomContentArea.centerYAnchor).isActive = true
        bottomDataView.trailingAnchor.constraint(equalTo: bottomContentArea.trailingAnchor, constant: -28).isActive = true
        
        topContent.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topContent)
        topContent.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        topContent.widthAnchor.constraint(equalToConstant: 326).isActive = true
        topContent.heightAnchor.constraint(equalToConstant: 45).isActive = true
        topContent.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            .isActive = true
        
        countryDropdown.translatesAutoresizingMaskIntoConstraints = false
        topContent.addSubview(countryDropdown)
        countryDropdown.centerYAnchor.constraint(equalTo: topContent.centerYAnchor).isActive = true
        countryDropdown.centerXAnchor.constraint(equalTo: topContent.centerXAnchor).isActive = true
        countryDropdown.widthAnchor.constraint(equalToConstant: 215).isActive = true
        countryDropdown.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        romaniaTitle.translatesAutoresizingMaskIntoConstraints = false
        topContent.addSubview(romaniaTitle)
        romaniaTitle.centerYAnchor.constraint(equalTo: topContent.centerYAnchor).isActive = true
        romaniaTitle.centerXAnchor.constraint(equalTo: topContent.centerXAnchor).isActive = true
        romaniaTitle.alpha = 0
        
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        topContent.addSubview(refreshButton)
        refreshButton.centerYAnchor.constraint(equalTo: topContent.centerYAnchor).isActive = true
        refreshButton.leadingAnchor.constraint(equalTo: topContent.leadingAnchor, constant: 10).isActive = true
        
        downButton.translatesAutoresizingMaskIntoConstraints = false
        topContent.addSubview(downButton)
        downButton.centerYAnchor.constraint(equalTo: topContent.centerYAnchor).isActive = true
        downButton.leadingAnchor.constraint(equalTo: topContent.leadingAnchor, constant: 10).isActive = true
        downButton.alpha = 0
        
        tapBottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tapBottomView)
        tapBottomView.topAnchor.constraint(equalTo: bottomArea.topAnchor).isActive = true
        tapBottomView.trailingAnchor.constraint(equalTo: bottomArea.trailingAnchor).isActive = true
        tapBottomView.bottomAnchor.constraint(equalTo: bottomContentArea.bottomAnchor).isActive = true
        tapBottomView.leadingAnchor.constraint(equalTo: bottomArea.leadingAnchor).isActive = true
        
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuButton)
        menuButton.centerYAnchor.constraint(equalTo: topContent.centerYAnchor).isActive = true
        menuButton.trailingAnchor.constraint(equalTo: topContent.trailingAnchor).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 34.79).isActive = true
        
        shadowView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(shadowView2)
        shadowView2.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        shadowView2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        shadowView2.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        shadowView2.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                
        contentView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView2)
        contentView2.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView2.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView2.widthAnchor.constraint(equalToConstant: 230).isActive = true
        trailingAnc2 = contentView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 230)
        trailingAnc2.isActive = true
                
        menuTitle2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuTitle2)
        menuTitle2.centerXAnchor.constraint(equalTo: contentView2.centerXAnchor).isActive = true
        menuTitle2.topAnchor.constraint(equalTo: contentView2.topAnchor, constant: 90).isActive = true
                
        menuLogo2.translatesAutoresizingMaskIntoConstraints = false
        contentView2.addSubview(menuLogo2)
        menuLogo2.centerXAnchor.constraint(equalTo: contentView2.centerXAnchor).isActive = true
        menuLogo2.topAnchor.constraint(equalTo: menuTitle2.bottomAnchor, constant: 30).isActive = true
        menuLogo2.heightAnchor.constraint(equalToConstant: 128).isActive = true
        menuLogo2.widthAnchor.constraint(equalToConstant: 145).isActive = true
        
        menuButtons2.append(appButton2)
        menuButtons2.append(dezvoltatorButton2)
        menuButtons2.append(ajutaButton2)
        menuButtons2.append(raporteazaButton2)
        
        buttonPosition2 = 380
                
        for button in menuButtons2 {
            button.translatesAutoresizingMaskIntoConstraints = false
            contentView2.addSubview(button)
            button.centerXAnchor.constraint(equalTo: contentView2.centerXAnchor).isActive = true
            button.widthAnchor.constraint(equalTo: contentView2.widthAnchor).isActive = true
            button.heightAnchor.constraint(equalToConstant: CGFloat(buttonHight2)).isActive = true
            button.topAnchor.constraint(equalTo: contentView2.topAnchor, constant: CGFloat(buttonPosition2)).isActive = true
            buttonPosition2 = buttonPosition2 + buttonSpacing2 + buttonHight2
        }
        
        zeroAlpha.append(countryDropdown)
        zeroAlpha.append(bottomTitle)
        zeroAlpha.append(bottomDataView)
        zeroAlpha.append(refreshButton)
        
    }
}
