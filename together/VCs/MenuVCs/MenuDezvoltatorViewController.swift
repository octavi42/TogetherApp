//
//  MenuAppViewController.swift
//  together
//
//  Created by Cristea Octavian on 17/05/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import UIKit

class MenuDezvoltatorViewController: UIViewController {

    internal lazy var screenTitle: UILabel = {
        let label = UILabel()
        
        label.text = "Dezvoltotor"
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Bold", size: 30)
        
        return label
    }()
    
    internal lazy var cancelButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "cancelButton"), for: .normal)
        button.addTarget(self, action: #selector(cancelScreen), for: .touchUpInside)
        
        return button
    }()
    
    @objc func cancelScreen() {
        dismiss(animated: true, completion: nil)
    }
    
    internal lazy var screenContent: UILabel = {
        let label = UILabel()
        
        label.text = "Ma numesc Cristea Octavian, am 17 ani si dorinta mea este sa ajut prin metodele mele probleme actuale cu care omenirea se confrunta. \n Cand am auzit despre acest Coronavirus am stiut ca trebuie sa fac ceva si am decis sa construiesc aplicatia “together”, nu a fost un drum simplu, pe parcursul dezvol tarii aplicatiei am invatat o multime de lucruri noi, am pornit proiectul fara tote notiunile necesare dezvoltarii unei aplicatii si unei baze de date si pe parcurs constrangerile m-au facut sa le invat si am reusti sa duc aplicatia la un bun sfarsit. Aplicatia nu este doar o necesitate in aceste momente dar si un indemn ca toti sa ne unim fortele pentru a opri acesta pandemie si sa dedicam cat de putin posibil proiectelor si activitatilor care duc la oprirea virusului."
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Regular", size: 18)
        
        return label
    }()
    
    internal lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 800)
        scrollView.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height)
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    internal lazy var contentView: UIView  = {
        let view = UIView()
        view.frame.size = CGSize(width: self.view.frame.width, height: 1000)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        
        view.backgroundColor = .white
        
    }
    
}

extension MenuDezvoltatorViewController {
    
    func layout() {
        screenTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(screenTitle)
        screenTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        screenTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cancelButton)
        cancelButton.centerYAnchor.constraint(equalTo: screenTitle.centerYAnchor).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        screenContent.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(screenContent)
        screenContent.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -40).isActive = true
        screenContent.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        
        print(screenContent.bounds.size.height)
        
    }
    
}
