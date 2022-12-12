//
//  AuthorizationViewController.swift
//  together
//
//  Created by Cristea Octavian on 20/04/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import UIKit
import MapKit

internal var contentText: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.text = "Ofara-ne accesul la locatie"
    label.numberOfLines = 0
    label.font = UIFont(name: "AvenirNext-Medium", size: 17)
    label.textColor = .black
    
    return label
}()

class AuthorizationViewController: UIViewController, MKMapViewDelegate {
    
    internal lazy var bigLogo: UIImageView = {
        let image = UIImage(named: "togetherBigLogo")
        let imageView = UIImageView(image: image!)
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.4
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 15
        
        return imageView
    }()
    
    internal lazy var togetherTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Together"
        label.font = UIFont(name: "AvenirNext-Medium", size: 30)
        label.textColor = UIColor(red: 0.69, green: 0.16, blue: 0.16, alpha: 1.00)
        
        return label
    }()

    internal lazy var contentTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Avem nevoie de accesul la locatie"
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
        label.textColor = .black
        
        return label
    }()
    
    internal lazy var buttonsView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    internal lazy var slideBurger: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "slideBurgerImage")!
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(burgerAction), for: .touchUpInside)
        
        return button
    }()
    
    internal lazy var deceButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.45, green: 0.49, blue: 0.84, alpha: 1.00)
        button.setTitle("De ce?", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(deceAction), for: .touchUpInside)
        button.addTarget(self, action: #selector(deceTouchDown), for: .touchDown)
        
        return button
    }()
    
    internal lazy var nuButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.84, green: 0.45, blue: 0.45, alpha: 1.00)
        button.setTitle("Nu", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(nuAction), for: .touchUpInside)
        button.addTarget(self, action: #selector(nuTouchDown), for: .touchDown)
        
        return button
    }()
    
    internal lazy var daButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.53, green: 0.85, blue: 0.65, alpha: 1.00)
        button.setTitle("Da", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(daAction), for: .touchUpInside)
        button.addTarget(self, action: #selector(daTouchDown), for: .touchDown)
        
        return button
    }()
    
    var shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        
        return view
    }()

    internal var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()

    internal var menuTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Together"
        label.font = UIFont(name: "AvenirNext-Medium", size: 30)
        label.textColor = UIColor(red: 0.69, green: 0.16, blue: 0.16, alpha: 1.00)
        
        return label
    }()

    internal lazy var menuLogo: UIImageView = {
        let image = UIImage(named: "togetherBigLogo")
        let imageView = UIImageView(image: image!)
        
        return imageView
    }()

    var menuButtons = [UIButton]()

    internal lazy var appButton:UIButton = {
        var button = UIButton()
        button.setTitle("App", for: .normal)
        button.addTarget(self, action: #selector(appButtonAction), for: .touchUpInside)
        setButtons(button: button)
        
        return button
    }()

    internal lazy var dezvoltatorButton:UIButton = {
        var button = UIButton()
        button.setTitle("Dezvoltator", for: .normal)
        button.addTarget(self, action: #selector(dezvoltatorButtonAction), for: .touchUpInside)
        setButtons(button: button)
        
        return button
    }()

    internal lazy var ajutaButton:UIButton = {
        var button = UIButton()
        button.setTitle("Ajutor", for: .normal)
        button.addTarget(self, action: #selector(ajutorButtonAction), for: .touchUpInside)
        setButtons(button: button)
        
        return button
    }()

    internal lazy var raporteazaButton:UIButton = {
        var button = UIButton()
        button.setTitle("Raporteaza", for: .normal)
        button.addTarget(self, action: #selector(raporteazButtonAction), for: .touchUpInside)
        setButtons(button: button)
        
        return button
    }()

    func setButtons(button: UIButton){
        button.backgroundColor = UIColor(red: 0.79, green: 0.78, blue: 0.78, alpha: 1.00)
        button.setTitleColor(UIColor(red: 0.70, green: 0.16, blue: 0.16, alpha: 1.00), for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 20)
    }
    
    @objc func deceTouchDown(){
        deceButton.backgroundColor = UIColor(red: 0.29, green: 0.33, blue: 0.60, alpha: 1.00)
    }
    
    @objc func deceAction(sender: UIButton) {
        deceButton.backgroundColor = UIColor(red: 0.45, green: 0.49, blue: 0.84, alpha: 1.00)
        present(deceVC, animated: true)
    }
    
    @objc func nuTouchDown() {
        nuButton.backgroundColor = UIColor(red: 0.60, green: 0.29, blue: 0.29, alpha: 1.00)
    }
    
    @objc func nuAction(sender: UIButton) {
        nuButton.backgroundColor = UIColor(red: 0.84, green: 0.45, blue: 0.45, alpha: 1.00)
        present(nuVC, animated: true)
    }
    
    @objc func daTouchDown() {
        daButton.backgroundColor = UIColor(red: 0.29, green: 0.60, blue: 0.38, alpha: 1.00)
    }
    
    @objc func daAction(sender: UIButton) {
        daButton.backgroundColor = UIColor(red: 0.53, green: 0.85, blue: 0.65, alpha: 1.00)
        if settingsUrl != nil {
            UIApplication.shared.open(settingsUrl!, options: [:], completionHandler: nil)
        } else {
            daTap = true
            dismiss(animated: true)
        }
    }
    
    @objc func showCountrys(sender: UIButton) {
        present(menuCountryScreen, animated: true, completion: nil)
    }
    
    @objc func appButtonAction(sender: UIButton) {
        present(menuAppScreen, animated: true, completion: nil)
    }
    
    @objc func dezvoltatorButtonAction(sender: UIButton) {
        present(menuDezvoltatorScreen, animated: true, completion: nil)
    }
    
    @objc func ajutorButtonAction(sender: UIButton) {
        present(menuAjutorScreen, animated: true, completion: nil)
    }
    
    @objc func raporteazButtonAction(sender: UIButton) {
        showMailScreen()
    }
    
    let menuCountryScreen = CountryViewController()
    let menuAppScreen = MenuAppViewController()
    let menuDezvoltatorScreen = MenuDezvoltatorViewController()
    let menuAjutorScreen = MenuAjutorViewController()
    
    @objc func burgerAction(sender: UIButton) {
        trailingAnc.constant = 0
        
        UIView.animate(withDuration: 0.4
            , animations: {
                self.shadowView.alpha = 0.4
            self.view.layoutIfNeeded()
            }, completion: nil
        )
    }
    
    
    var deceVC = DeceViewController()
    var nuVC = NuViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        layout()
        
        pan = UIPanGestureRecognizer(target: self, action: #selector(exitMenu(sender:)))
        contentView.addGestureRecognizer(pan)
        
        blurTap = UITapGestureRecognizer(target: self, action: #selector(blurTapAction(sender:)))
        shadowView.addGestureRecognizer(blurTap)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        deAnimate()
    }
    
    var pan: UIPanGestureRecognizer!
    var blurTap: UITapGestureRecognizer!
    
    var originalPosition: CGPoint?
    var currentPositionTouched: CGPoint?
    
    @objc func exitMenu(sender: UIPanGestureRecognizer) {
        
        let translation = pan.translation(in: contentView)
        
        let velocity = pan.velocity(in: contentView)
        
        switch pan.state {
        case .began:
            originalPosition = contentView.center
            currentPositionTouched = pan.location(in: contentView)
        case .changed:
            if (trailingAnc.constant >= 0) {
                trailingAnc.constant += translation.x
            }
            sender.setTranslation(.zero, in: view)
        case .ended:

            if velocity.x > 0 {
                deAnimate()
            } else {
                trailingAnc.constant = 0
                UIView.animate(withDuration: 0.4, animations: {
                self.view.layoutIfNeeded()
              })
            }
        case .cancelled:
            deAnimate()
        default:
            break
        }
        
    }
    
    @objc func blurTapAction(sender: UITapGestureRecognizer) {
        deAnimate()
    }
    
    func deAnimate() {
        trailingAnc.constant = 230
          UIView.animate(withDuration: 0.4
          , animations: {
                self.view.layoutIfNeeded()
                self.shadowView.alpha = 0
          }, completion: nil)
    }

}
