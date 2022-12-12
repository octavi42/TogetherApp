//
//  MenuAppViewController.swift
//  together
//
//  Created by Cristea Octavian on 17/05/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import UIKit

class MenuAjutorViewController: UIViewController {

    internal lazy var screenTitle: UILabel = {
        let label = UILabel()
        
        label.text = "Ajutor"
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
    
    var labelFont = UIFont(name: "AvenirNext-Regular", size: 16)
    
    internal lazy var refresh: UIView = {
        let view = UIView()
        
        let titleText = "Actualizeaza locatile"
        
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 24)
        
        var containerView: UIView = {
            let view = UIView()
            
            return view
        }()
        
        let contentLabel = UILabel()
        
        let labelText = "Apasa cerculetul rosu din partea stanga de sus pentru a actualiza locatile si datele"
        
        contentLabel.text = labelText
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .black
        contentLabel.font = labelFont
        
        let containerViewHeight: CGFloat = DynamicLabelSize.height(text: labelText, font: labelFont!, width: self.view.frame.width)
        
        let imageName = "refresh"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        
        
        let ratio = (image?.size.width)!/(image?.size.height)!
        
        imageView.contentMode = .scaleAspectFill
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: containerViewHeight).isActive = true
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentLabel)
        contentLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width / ratio )
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
        ])
        
        let titleHeight = DynamicLabelSize.height(text: titleText, font: labelFont!, width: self.view.frame.width)
        
        view.heightAnchor.constraint(equalToConstant: titleHeight + containerViewHeight + imageView.frame.height + 36).isActive = true
        
        return view
    }()
    
    internal lazy var county: UIView = {
        
        let view = UIView()
        
        let titleText = "Selecteaza un judet"
        
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 24)
        
        var containerView: UIView = {
            let view = UIView()
            
            return view
        }()
        
        let contentLabel = UILabel()
        
        let labelText = "Apasa pe butonul albastru de sus, pozitionat pe mijlocul ecranului"
        
        contentLabel.text = labelText
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .black
        contentLabel.font = labelFont
        
        let containerViewHeight: CGFloat = DynamicLabelSize.height(text: labelText, font: labelFont!, width: self.view.frame.width)
        
        let imageName = "county"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        
        
        let ratio = (image?.size.width)!/(image?.size.height)!
        
        imageView.contentMode = .scaleAspectFill
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: containerViewHeight).isActive = true
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentLabel)
        contentLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width / ratio )
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
        ])
        
        let titleHeight = DynamicLabelSize.height(text: titleText, font: labelFont!, width: self.view.frame.width)
        
        view.heightAnchor.constraint(equalToConstant: titleHeight + containerViewHeight + imageView.frame.height + 36).isActive = true
        
        return view
        
    }()
    
    internal lazy var bottom: UIView = {
        
        let view = UIView()
        
        let titleText = "Deschide fereastra cu date"
        
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 24)
        
        var containerView: UIView = {
            let view = UIView()
            
            return view
        }()
        
        let contentLabel = UILabel()
        
        let labelText = "Apasa pe bara de jos cu datele despre panidemie in judet si se va deschide fereastra cu datele in toata tara"
        
        contentLabel.text = labelText
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .black
        contentLabel.font = labelFont
        
        let containerViewHeight: CGFloat = DynamicLabelSize.height(text: labelText, font: labelFont!, width: self.view.frame.width)
        
        let imageName = "popup"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        
        
        let ratio = (image?.size.width)!/(image?.size.height)!
        
        imageView.contentMode = .scaleAspectFill
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: containerViewHeight).isActive = true
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentLabel)
        contentLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width / ratio )
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
        ])
        
        let titleHeight = DynamicLabelSize.height(text: titleText, font: labelFont!, width: self.view.frame.width)
        
        view.heightAnchor.constraint(equalToConstant: titleHeight + containerViewHeight + imageView.frame.height + 36).isActive = true
        
        return view
        
    }()
    
    internal lazy var top: UIView = {
        
        let view = UIView()
        
        let titleText = "Inchide fereastra cu date"
        
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 24)
        
        var containerView: UIView = {
            let view = UIView()
            
            return view
        }()
        
        let contentLabel = UILabel()
        
        let labelText = "Apasa pe butonul rosu din partea dreapta de sus pentru a inchide fereastra cu datele pandemiei in Romania"
        
        contentLabel.text = labelText
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .black
        contentLabel.font = labelFont
        
        let containerViewHeight: CGFloat = DynamicLabelSize.height(text: labelText, font: labelFont!, width: self.view.frame.width)
        
        let imageName = "popdown"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        
        
        let ratio = (image?.size.width)!/(image?.size.height)!
        
        imageView.contentMode = .scaleAspectFill
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: containerViewHeight).isActive = true
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentLabel)
        contentLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width / ratio )
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
        ])
        
        let titleHeight = DynamicLabelSize.height(text: titleText, font: labelFont!, width: self.view.frame.width)
        
        view.heightAnchor.constraint(equalToConstant: titleHeight + containerViewHeight + imageView.frame.height + 36).isActive = true
        
        return view
        
    }()
    
    internal lazy var graph: UIView = {
        
        let view = UIView()
        
        let titleText = "Interactioneaza cu graficul"
        
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 24)
        
        var containerView: UIView = {
            let view = UIView()
            
            return view
        }()
        
        let contentLabel = UILabel()
        
        let labelText = "Apasa pe grafic pentru a vedea fiecare caz la o data specifica"
        
        contentLabel.text = labelText
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .black
        contentLabel.font = labelFont
        
        let containerViewHeight: CGFloat = DynamicLabelSize.height(text: labelText, font: labelFont!, width: self.view.frame.width)
        
        let imageName = "graph"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        
        
        let ratio = (image?.size.width)!/(image?.size.height)!
        
        imageView.contentMode = .scaleAspectFill
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: containerViewHeight).isActive = true
        
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentLabel)
        contentLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width / ratio )
        
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 20),
        ])
        
        let titleHeight = DynamicLabelSize.height(text: titleText, font: labelFont!, width: self.view.frame.width)
        
        view.heightAnchor.constraint(equalToConstant: titleHeight + containerViewHeight + imageView.frame.height + 36).isActive = true
        
        return view
        
    }()
    
    internal lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 2000)
        scrollView.frame = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height)
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    internal lazy var contentView: UIView  = {
        let view = UIView()
        view.frame.size = CGSize(width: self.view.frame.width, height: 5000)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        
        view.backgroundColor = .white
        
    }
    
}

extension MenuAjutorViewController {
    
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
        //contentView.topAnchor.constraint(equalTo: screenTitle.bottomAnchor, constant: 20).isActive = true
        
        refresh.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(refresh)
        refresh.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        refresh.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        refresh.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        county.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(county)
        county.topAnchor.constraint(equalTo: refresh.bottomAnchor, constant: 50).isActive = true
        county.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        county.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        bottom.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bottom)
        bottom.topAnchor.constraint(equalTo: county.bottomAnchor, constant: 50).isActive = true
        bottom.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        bottom.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        top.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(top)
        top.topAnchor.constraint(equalTo: bottom.bottomAnchor, constant: 50).isActive = true
        top.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        top.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        graph.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(graph)
        graph.topAnchor.constraint(equalTo: top.bottomAnchor, constant: 50).isActive = true
        graph.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        graph.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        print(contentView.bounds.height)
        
    }
    
}

extension UIImage {
    func getCropRatio() -> CGFloat {
        let widthRatio = CGFloat(self.size.width / self.size.height)
        return widthRatio
    }
}
