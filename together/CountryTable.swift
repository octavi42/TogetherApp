//
//  CountryTable.swift
//  together
//
//  Created by Cristea Octavian on 29/04/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.43, green: 0.52, blue: 0.51, alpha: 1.00)
        view.layer.cornerRadius = 5
        
        return view
    }()
    
    let cellTitle: UILabel = {
        let label = UILabel()
        label.text = "dsajn"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        layout()
        
        backgroundColor = UIColor(red: 0.59, green: 0.67, blue: 0.67, alpha: 1.00)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCountry(country: String) {
        cellTitle.text = country
    }
    
    func selection() {
        cellView.backgroundColor = .red
    }
    
    func layout() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cellView)
        cellView.widthAnchor.constraint(equalToConstant: 324).isActive = true
        cellView.heightAnchor.constraint(equalToConstant: 58).isActive = true
        cellView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        cellView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        cellView.addSubview(cellTitle)
        cellTitle.centerYAnchor.constraint(equalTo: cellView.centerYAnchor).isActive = true
        cellTitle.centerXAnchor.constraint(equalTo: cellView.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

var isScrolling = true

var nr = 3

var mainScreen = ViewController()

struct Keys {
    static let selectedCity = "selectedCity"
    static let test = "test"
}

extension CountryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countrys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = countrys[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        cell.setCountry(country: title)
        
        return cell
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        isScrolling = false
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            dismiss(animated: true, completion: nil)
            saveItem(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didTap indexPath: IndexPath) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y >= -144) && (scrollView.contentOffset.y <= 1994) {
            isScrolling = true
        } else {
            isScrolling = false
        }
        if scrollView.contentOffset.y > -view.bounds.height / 6 {
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                self.topBlur.alpha = 1
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                self.topBlur.alpha = 0
            }, completion: nil)
        }
    }
    
    func saveItem(indexPath: IndexPath) {
        defaults.set(indexPath.row, forKey: Keys.selectedCity)
    }
    
}
