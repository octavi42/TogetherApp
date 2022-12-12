//
//  MenuAppViewController.swift
//  together
//
//  Created by Cristea Octavian on 17/05/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import UIKit

class MenuAppViewController: UIViewController {

    internal lazy var screenTitle: UILabel = {
        let label = UILabel()
        
        label.text = "App"
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
        
        label.text = "Aplicatia e construita cu scopul de a incetini cat mai mult posibil pandemia de Covid 19 si de a tine oamenii cat mai in siguranta. \n Utilizatorii aplicatiei vor putea vedea cele mai aglomerate locatii prin adunarea locatiilor tuturor oamenilor. Locatiile utilizatorilor sunt in perfecta siguranta locatia unei persoane este luata fara numele persoanei sau niciun fel de alta informatie legata de persoana, este luata printr-un cod unic fiecarui utilizator cu care nu se poate afla persoana care o foloseste. \n Aplicatia functioneaza cu mult mai bine cu cat numarul utilizatorilor creste deoarece mai multor persoane li se afiseaza locatia si locurile aglomerate pot fi distinse cu mai mare exactitate, prin urmare poti arata aplicatia peroanelor pe care le cunosti, si impreuna putem crea o comunitate puternica in care fiecare peroana si fie eroul alteia."
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

extension MenuAppViewController {
    
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
