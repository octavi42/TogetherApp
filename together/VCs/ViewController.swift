//
//  ViewController.swift
//  together
//
//  Created by Cristea Octavian on 18/04/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import UIKit
import MapKit
import Macaw
import Charts

protocol externalFunctions {
    func changeCountry()
}

var daTap = false

var settingsUrl = URL(string: UIApplication.openSettingsURLString)

let defaults = UserDefaults.standard

var countrysData = [CountrysData]()
var locationData = [GetLocation]()
var statsData: QuickStats!

let dataLabels = [UILabel(), UILabel(), UILabel()]

var previousLocationTrack: CLLocation?

//var countrys: [Countrys] = []

var countrys: [String] = [
    "alba",
    "arad",
    "arges",
    "bacau",
    "bihor",
    "bistrita-nasaud",
    "botosani",
    "brasov",
    "braila",
    "buzau",
    "caras-severin",
    "calarasi",
    "cluj",
    "constanta",
    "covasna",
    "dambovita",
    "dolj",
    "galati",
    "giurgiu",
    "gorj",
    "harghita",
    "hunedoara",
    "ialomita",
    "iasi",
    "ilfov",
    "maramures",
    "mehedinti",
    "mures",
    "neamt",
    "olt",
    "prahova",
    "satu-mare",
    "salaj",
    "sibiu",
    "suceava",
    "teleorman",
    "timis",
    "tulcea",
    "vaslui",
    "valcea",
    "vrancea",
    "bucuresti"
]

class ViewController: UIViewController, MKMapViewDelegate {
    
    internal lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .light
        
        return map
    }()
    
    internal lazy var menuButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "togetherButtonLogo")!
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(burgerAction), for: .touchUpInside)
        
        return button
    }()
    
    internal lazy var topContent: UIView = {
        let view = UIView()
        
        return view
    }()
    
    internal lazy var countryDropdown: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.80, green: 0.89, blue: 0.88, alpha: 1.00)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(showCountrys), for: .touchUpInside)
        button.setTitle("Selecteaza un oras", for: .normal)
        button.setTitleColor(UIColor(red: 0.24, green: 0.24, blue: 0.24, alpha: 1.00), for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        
        return button
    }()
    
    internal lazy var romaniaTitle: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Romania"
        label.font = UIFont(name: "AvenirNext-Medium", size: 30)
        
        return label
    }()
    
    internal lazy var downButton: UIImageView = {
        let image = UIImage(named: "buttonImage")!
        let imageView = UIImageView(image: image)
        
        return imageView
    }()
    
    internal lazy var tapBottomView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    internal lazy var centerLocationButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    internal lazy var bottomArea: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.80, green: 0.89, blue: 0.88, alpha: 1.00)
        
        return view
    }()
    
    internal lazy var bottomContentArea: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        
        return view
    }()
    
    internal lazy var bottomTitle: UILabel = {
        let label = UILabel()
        label.text = "select country"
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        
        return label
    }()
    
    internal lazy var shadowView2: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        
        return view
    }()

    internal var contentView2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()

    internal var menuTitle2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Together"
        label.font = UIFont(name: "AvenirNext-Medium", size: 30)
        label.textColor = UIColor(red: 0.69, green: 0.16, blue: 0.16, alpha: 1.00)
        
        return label
    }()

    internal lazy var menuLogo2: UIImageView = {
        let image = UIImage(named: "togetherBigLogo")
        let imageView = UIImageView(image: image!)
        
        return imageView
    }()
    
    internal lazy var centerDataView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    var todayTexts = [UILabel(), UILabel(), UILabel()]
    var totalTexts = [UILabel(), UILabel(), UILabel()]
    var titleSpace = NSLayoutYAxisAnchor()
    var mostWide = CGSize()
    
    internal lazy var dataView: UIView = {
        let view = UIView()
        
        let title: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: "AvenirNext-Bold", size: 25)
            label.textColor = .black
            label.text = "Date"
            
            return label
        }()
        
        let contentTitleViews: UIView = {
            let view = UIView()
            var titles = [UILabel(), UILabel(), UILabel()]
            
            titles[0].text = "cazuri confirate"
            titles[1].text = "vindecari"
            titles[2].text = "decese"
            
            for i in titles {
                i.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(i)
                i.textColor = .black
                i.font = UIFont(name: "AvenirNext-Medium", size: 20)
                i.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            }
            
            titles[0].topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            titles[1].topAnchor.constraint(equalTo: titles[0].bottomAnchor, constant: 10).isActive = true
            titles[2].topAnchor.constraint(equalTo: titles[1].bottomAnchor, constant: 10).isActive = true
            
            mostWide = titles[0].intrinsicContentSize
            
            for i in titles {
                if i != titles[0] {
                    if i.intrinsicContentSize.width > mostWide.width {
                        mostWide = i.intrinsicContentSize
                    }
                }
            }
            
            return view
        }()
        
        let statsContentViews: UIView = {
            let mainView = UIView()
            
            let view1: UIView = {
                let view = UIView()
                
                let marginsView = UIView()
                
                let title = UILabel()
                title.text = "Astazi"
                title.textColor = .black
                title.font = UIFont(name: "AvenirNext-Bold", size: 20)
                
                title.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(title)
                title.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                title.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
                
                for i in todayTexts {
                    i.translatesAutoresizingMaskIntoConstraints = false
                    view.addSubview(i)
                    i.textColor = .black
                    i.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
                    i.centerXAnchor.constraint(equalTo: title.centerXAnchor).isActive = true
                }
                
                todayTexts[0].topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
                todayTexts[1].topAnchor.constraint(equalTo: todayTexts[0].bottomAnchor, constant: 10).isActive = true
                todayTexts[2].topAnchor.constraint(equalTo: todayTexts[1].bottomAnchor, constant: 10).isActive = true
                
                todayTexts[0].text = "-"
                todayTexts[1].text = "-"
                todayTexts[2].text = "-"
                
                titleSpace = todayTexts[0].topAnchor
                
                return view
            }()
            
            let view2: UIView = {
                let view = UIView()

                let marginsView = UIView()

                let title = UILabel()
                title.text = "Total"
                title.textColor = .black
                title.font = UIFont(name: "AvenirNext-Bold", size: 20)

                title.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(title)
                title.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                title.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

                for i in totalTexts {
                    i.translatesAutoresizingMaskIntoConstraints = false
                    view.addSubview(i)
                    i.textColor = .black
                    i.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
                    i.centerXAnchor.constraint(equalTo: title.centerXAnchor).isActive = true
                }

                totalTexts[0].topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10).isActive = true
                totalTexts[1].topAnchor.constraint(equalTo: totalTexts[0].bottomAnchor, constant: 10).isActive = true
                totalTexts[2].topAnchor.constraint(equalTo: totalTexts[1].bottomAnchor, constant: 10).isActive = true

                totalTexts[0].text = "-"
                totalTexts[1].text = "-"
                totalTexts[2].text = "-"

                titleSpace = totalTexts[0].topAnchor

                return view
            }()
            
            view1.translatesAutoresizingMaskIntoConstraints = false
            mainView.addSubview(view1)
            view1.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
            view1.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
            
            view2.translatesAutoresizingMaskIntoConstraints = false
            mainView.addSubview(view2)
            view2.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
            view2.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
            
            return mainView
        }()
        
        let centerStatsView: UIView = {
            let view = UIView()
            
            return view
        }()
        
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        title.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        contentTitleViews.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentTitleViews)
        contentTitleViews.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentTitleViews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26).isActive = true
        contentTitleViews.widthAnchor.constraint(equalToConstant: mostWide.width).isActive = true
        
        centerStatsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerStatsView)
        centerStatsView.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        centerStatsView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        centerStatsView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        centerStatsView.leadingAnchor.constraint(equalTo: contentTitleViews.trailingAnchor).isActive = true
        
        statsContentViews.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(statsContentViews)
        statsContentViews.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        statsContentViews.widthAnchor.constraint(equalToConstant: 150).isActive = true
        statsContentViews.centerXAnchor.constraint(equalTo: centerStatsView.centerXAnchor).isActive = true
        
        contentTitleViews.topAnchor.constraint(equalTo: titleSpace).isActive = true
        
        return view
    }()
    
    var dataText = UILabel()
    var cazuriText = UILabel()
    
    internal lazy var chartView: UIView = {
        let view = UIView()
        let title: UILabel = {
            let label = UILabel()

            label.text = "Gradic"
            label.textColor = .black
            label.font = UIFont(name: "AvenirNext-Bold", size: 25)
            
            return label
        }()
        
        let view1: UIView = {
            let view = UIView()
            
            let contentView: UIView = {
                let view = UIView()
                
                let title: UILabel = {
                    let label = UILabel()
                    
                    label.text = "data"
                    label.textColor = .black
                    label.font = UIFont(name: "AvenirNext-Medium", size: 15)
                    
                    return label
                }()
                
                dataText.text = "selecteaza"
                dataText.textColor = .black
                dataText.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
                
                title.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(title)
                title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                title.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                
                dataText.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(dataText)
                dataText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                dataText.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
                
                return view
            }()
            
            contentView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(contentView)
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            contentView.heightAnchor.constraint(equalToConstant: 45).isActive = true
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
            return view
        }()
        
        let view2: UIView = {
            let view = UIView()
            
            let contentView: UIView = {
                let view = UIView()
                
                let title: UILabel = {
                    let label = UILabel()
                    
                    label.text = "cazuri"
                    label.textColor = .black
                    label.font = UIFont(name: "AvenirNext-Medium", size: 15)
                    
                    return label
                }()
                
                cazuriText.text = "pe grafic"
                cazuriText.textColor = .black
                cazuriText.font = UIFont(name: "AvenirNext-DemiBold", size: 20)
                
                title.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(title)
                title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                title.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
                
                cazuriText.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(cazuriText)
                cazuriText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                cazuriText.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
                
                return view
            }()
            
            contentView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(contentView)
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            contentView.heightAnchor.constraint(equalToConstant: 45).isActive = true
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
            return view
        }()
        
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        title.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view1)
        view1.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        view1.widthAnchor.constraint(equalToConstant: self.view.bounds.width / 2).isActive = true
        view1.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        view1.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        
        view2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view2)
        view2.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        view2.widthAnchor.constraint(equalToConstant: self.view.bounds.width / 2).isActive = true
        view2.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        view2.topAnchor.constraint(equalTo: title.bottomAnchor).isActive = true
        
        return view
    }()
    
    var enteries = [ChartDataEntry]()
    var set = LineChartDataSet(entries: nil)
    
    internal lazy var chartI: LineChartView = {
        let chart = LineChartView()
        let xAx = XAxis()
        let yAx = YAxis()
        chart.delegate = self
        
        chart.rightAxis.enabled = false
        chart.xAxis.labelPosition = .bottom
        
        let xAxis = chart.leftAxis
        let yAxis = chart.rightAxis
        
        chart.backgroundColor = UIColor(red: 0.63, green: 0.79, blue: 0.77, alpha: 1.00)
        
        set.highlightColor = .red
        
        let data = LineChartData(dataSet: set)
        data.setDrawValues(false)
        
        chart.data = data
        
        return chart
    }()

    var menuButtons2 = [UIButton]()
    
    let images = [UIImage(named: "circleDataI"), UIImage(named: "circleDataII"), UIImage(named: "circleDataIII")]
    let dataStructHeight: CGFloat = 78
    
    internal lazy var bottomDataViewI: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: dataStructHeight).isActive = true
        view.widthAnchor.constraint(equalToConstant: 54).isActive = true
        
        let image = UIImageView(image: images[0]!)
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let label = UILabel()
        label.text = "cazuri"
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        dataLabels[0].text = "-"
        dataLabels[0].textColor = .black
        dataLabels[0].font = UIFont(name: "AvenirNext-DemiBold", size: 15)
        dataLabels[0].translatesAutoresizingMaskIntoConstraints = false
        image.addSubview(dataLabels[0])
        dataLabels[0].centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        dataLabels[0].centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
        
        return view
    }()
    
    internal lazy var bottomDataViewII: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: dataStructHeight).isActive = true
        view.widthAnchor.constraint(equalToConstant: 54).isActive = true
        
        let image = UIImageView(image: images[1]!)
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let label = UILabel()
        label.text = "populatie"
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        dataLabels[1].text = "-k"
        dataLabels[1].textColor = .black
        dataLabels[1].font = UIFont(name: "AvenirNext-DemiBold", size: 15)
        dataLabels[1].translatesAutoresizingMaskIntoConstraints = false
        image.addSubview(dataLabels[1])
        dataLabels[1].centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        dataLabels[1].centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
        
        return view
    }()
    
    internal lazy var bottomDataViewIII: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: dataStructHeight).isActive = true
        view.widthAnchor.constraint(equalToConstant: 54).isActive = true
        
        let image = UIImageView(image: images[2]!)
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let label = UILabel()
        label.text = "procentaj"
        label.textColor = .black
        label.font = UIFont(name: "AvenirNext-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        dataLabels[2].text = "-%"
        dataLabels[2].textColor = .black
        dataLabels[2].font = UIFont(name: "AvenirNext-DemiBold", size: 15)
        dataLabels[2].translatesAutoresizingMaskIntoConstraints = false
        image.addSubview(dataLabels[2])
        dataLabels[2].centerYAnchor.constraint(equalTo: image.centerYAnchor).isActive = true
        dataLabels[2].centerXAnchor.constraint(equalTo: image.centerXAnchor).isActive = true
        
        return view
    }()
    
    internal lazy var bottomDataView: UIView = {
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: self.view.bounds.width / 1.7).isActive = true
        view.heightAnchor.constraint(equalToConstant: dataStructHeight).isActive = true
        
        bottomDataViewI.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomDataViewI)
        bottomDataViewI.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomDataViewI.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        bottomDataViewII.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomDataViewII)
        bottomDataViewII.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomDataViewII.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        bottomDataViewIII.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomDataViewIII)
        bottomDataViewIII.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomDataViewIII.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }()

    internal lazy var appButton2:UIButton = {
        var button = UIButton()
        button.setTitle("App", for: .normal)
        button.addTarget(self, action: #selector(appButtonAction), for: .touchUpInside)
        setButtons2(button: button)
        
        return button
    }()

    internal lazy var dezvoltatorButton2:UIButton = {
        var button = UIButton()
        button.setTitle("Dezvoltator", for: .normal)
        button.addTarget(self, action: #selector(dezvoltatorButtonAction), for: .touchUpInside)
        setButtons2(button: button)
        
        return button
    }()

    internal lazy var ajutaButton2:UIButton = {
        var button = UIButton()
        button.setTitle("Ajutor", for: .normal)
        button.addTarget(self, action: #selector(ajutorButtonAction), for: .touchUpInside)
        setButtons2(button: button)
        
        return button
    }()

    internal lazy var raporteazaButton2:UIButton = {
        var button = UIButton()
        button.setTitle("Raporteaza", for: .normal)
        button.addTarget(self, action: #selector(raporteazButtonAction), for: .touchUpInside)
        setButtons2(button: button)
        
        return button
    }()
    
    internal lazy var refreshButton: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        
        indicator.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        indicator.color = UIColor(red: 0.70, green: 0.16, blue: 0.16, alpha: 1.00)
        indicator.hidesWhenStopped = false
        
        return indicator
    }()

    func setButtons2(button: UIButton){
        button.backgroundColor = UIColor(red: 0.79, green: 0.78, blue: 0.78, alpha: 1.00)
        button.setTitleColor(UIColor(red: 0.70, green: 0.16, blue: 0.16, alpha: 1.00), for: .normal)
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 20)
    }
    
    @objc func burgerAction(sender: UIButton) {
        trailingAnc2.constant = 0
        
        UIView.animate(withDuration: 0.4
            , animations: {
                self.shadowView2.alpha = 0.4
            self.view.layoutIfNeeded()
            }, completion: nil
        )
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
    
    let locationManager = CLLocationManager()
    let authorisationScreen = AuthorizationViewController()
//    let menuScreen = MenuViewController()
    let menuCountryScreen = CountryViewController()
    let menuAppScreen = MenuAppViewController()
    let menuDezvoltatorScreen = MenuDezvoltatorViewController()
    let menuAjutorScreen = MenuAjutorViewController()
    
    let countryDQ = DispatchGroup()
    let statsDQ = DispatchGroup()
    let countyDQ = DispatchGroup()
    let annotationDQ = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        
        gestures()
        
        mapView.showsCompass = false
        mapView.delegate = self
        
        setScreens()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    var bottomContentTap: UITapGestureRecognizer!
    
    var loadingTap: UITapGestureRecognizer!
    var blurTap: UITapGestureRecognizer!
    
    var pan2: UIPanGestureRecognizer!
    var originalPosition2: CGPoint?
    var currentPositionTouched2: CGPoint?
    
    var once = true
    
    override func viewDidAppear(_ animated: Bool) {
        
        print("1234")
        
        setLoadingCountrys()
        
        if once {
            deviceLocationServices()
            once = false
        }
        
        if daTap {
            locationManager.requestWhenInUseAuthorization()
            daTap = false
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        deAnimate2()
        
    }
    
    var presented = false
    
    @objc func loadingTapAction(sender: UITapGestureRecognizer) {
        setLoadingCountrys()
    }
    
    @objc func blurTapAction(sender: UITapGestureRecognizer) {
        deAnimate2()
    }
    
    var isUp = false
    
    func gestures() {
        pan2 = UIPanGestureRecognizer(target: self, action: #selector(exitMenu(sender:)))
        contentView2.addGestureRecognizer(pan2)
        
        bottomContentTap = UITapGestureRecognizer(target: self, action: #selector(bottomContentTapAction(sender:)))
        tapBottomView.addGestureRecognizer(bottomContentTap)
        
        loadingTap = UITapGestureRecognizer(target: self, action: #selector(loadingTapAction(sender:)))
        refreshButton.addGestureRecognizer(loadingTap)
        
        blurTap = UITapGestureRecognizer(target: self, action: #selector(blurTapAction(sender:)))
        shadowView2.addGestureRecognizer(blurTap)
    }
    
    func setScreens() {
        authorisationScreen.modalPresentationStyle = .fullScreen
        authorisationScreen.modalTransitionStyle = .crossDissolve
        
        menuCountryScreen.modalPresentationStyle = .fullScreen
        menuCountryScreen.modalTransitionStyle = .crossDissolve
    }
    
    func openView() {
        print("tapped")
        bottomPopup.isActive = false
        bottomPopup = bottomContentArea.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height+100)
        bottomPopup.isActive = true
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            
            for view in zeroAlpha {
                view.alpha = 0
            }
            
            self.downButton.alpha = 1
            self.romaniaTitle.alpha = 1
            
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.isUp = true
            self.setLoadingQuickStats()
        })
    }
    
    func closeView() {
        print("tapped2")
        bottomPopup.isActive = false
        bottomPopup = bottomContentArea.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        bottomPopup.isActive = true
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            
            for view in zeroAlpha {
                view.alpha = 1
            }
            
            self.downButton.alpha = 0
            self.romaniaTitle.alpha = 0
            
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.isUp = false
        })
    }
    
    @objc func buttonDissmissAction(sender: UIButton) {
            print("tapped")
            bottomPopup.isActive = false
            bottomPopup = bottomContentArea.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height+100)
            bottomPopup.isActive = true
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                
                for view in zeroAlpha {
                    view.alpha = 0
                }
                
                self.downButton.alpha = 1
                
                self.romaniaTitle.alpha = 1
                self.view.layoutIfNeeded()
            }, completion: { _ in
                self.isUp = true
            })
    }
    
    @objc func bottomContentTapAction(sender: UITapGestureRecognizer) {
        if isUp {
            closeView()
        } else {
            openView()
        }
    }
    
    @objc func exitMenu(sender: UIPanGestureRecognizer) {
        
        let translation = pan2.translation(in: contentView2)
        
        let velocity = pan2.velocity(in: contentView2)
        
        switch pan2.state {
        case .began:
            originalPosition2 = contentView2.center
            currentPositionTouched2 = pan2.location(in: contentView2)
        case .changed:
            if (trailingAnc2.constant >= 0) {
                trailingAnc2.constant += translation.x
            }
            sender.setTranslation(.zero, in: view)
        case .ended:

            if velocity.x > 0 {
                deAnimate2()
            } else {
                animate2()
            }
        case .cancelled:
            deAnimate2()
        default:
            break
        }
        
    }
    
    var isError = false
    
    func setLoadingCountrys() {
        countrysData = []
        countryDQ.enter()
        refreshButton.isUserInteractionEnabled = false
        refreshButton.startAnimating()
        getCountrysData()
        countryDQ.notify(queue: .main) {
            if !self.isError {
                dataLabels[0].text = "\(countrysData[(defaults.integer(forKey: Keys.selectedCity))].numberInfected)"
                dataLabels[1].text = "\(countrysData[(defaults.integer(forKey: Keys.selectedCity))].totalPopulation / 1000)k"
                let nr = Double(countrysData[(defaults.integer(forKey: Keys.selectedCity))].infectionPercentage)
                let shortNr = String(format: "%0.2f", nr)
                dataLabels[2].text = "\(shortNr)%"
            }
            
            self.annotationDQ.enter()
            self.changeCountry()
        
            self.annotationDQ.notify(queue: .main) {
                print("ugabuga")
                self.refreshButton.stopAnimating()
                self.refreshButton.isUserInteractionEnabled = true
            }
        }
    }
    
    func getLocationData(county: String) {
        let locationRequest = LocationRequest(county: county)
        locationRequest.getLocations { [weak self] result in
            switch result {
            case .failure(let err):
                self!.annotationDQ.leave()
                print(err)
            case .success(let locations):
                locationData = locations
                self!.setLocations(locations: locationData)
                print("niau")
                self!.annotationDQ.leave()
            }
        }
    }
    
    var someLocs = [CLLocationCoordinate2D(latitude: 45.6343, longitude: 25.4792),  CLLocationCoordinate2D(latitude: 45.9357, longitude: 24.4590),
                    CLLocationCoordinate2D(latitude: 46.2601, longitude: 24.4428),
                    CLLocationCoordinate2D(latitude: 45.6992, longitude: 25.4890), CLLocationCoordinate2D(latitude: 46.3003, longitude: 24.9912),
                    CLLocationCoordinate2D(latitude: 45.7814, longitude: 25.4303), CLLocationCoordinate2D(latitude: 46.2521, longitude: 24.7611),
                    CLLocationCoordinate2D(latitude: 45.7539, longitude: 24.5351), CLLocationCoordinate2D(latitude: 45.6983, longitude: 24.7749),
                    CLLocationCoordinate2D(latitude: 46.1250, longitude: 24.8149), CLLocationCoordinate2D(latitude: 46.3347, longitude: 24.5489),
                    CLLocationCoordinate2D(latitude: 46.1375, longitude: 24.5658)]
    
    func setLocations(locations: [GetLocation]) {
        
//        var anotationArr = [MKAnnotation]()
        
        DispatchQueue.main.async {
            
            self.mapView.removeAnnotations(self.mapView.annotations)
            
//        annotationDQ.notify(queue: .main) {
            for location in locationData {
                let annotation = MKPointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
                annotation.title = location.stringDate
                
                //anotationArr.append(annotation)
//            }
            
            self.mapView.addAnnotation(annotation)
            
//            self.mapView.showAnnotations(self.mapView.annotations, animated: false)
            }
        
        }
            
    }
    
    func getCountrysData() {
        getCountryData { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
                self!.isError = true
                self!.countryDQ.leave()
            case .success(let coutrysD):
                countrysData =  coutrysD
                self!.isError = false
                self!.countryDQ.leave()
            }
        }
    }
    
    func setLoadingQuickStats() {
        statsDQ.enter()
        getQuickStatsData()
        statsDQ.notify(queue: .main) {
            var labels = [String]()
            if !self.isError {
                for data in stride(from: 0, to: statsData.history.count, by: 1) {
                    self.enteries.append(ChartDataEntry(x: Double(data), y: Double(statsData.history[data].confirmed)))
                    labels.append(statsData.history[data].date_string)
                }
                
                if let text = statsData.history.last?.confirmed {
                    self.totalTexts[0].text = "\(text)"
                }
                
                if let text = statsData.history.last?.cured {
                    self.totalTexts[1].text = "\(text)"
                }
                
                if let text = statsData.history.last?.deaths {
                    self.totalTexts[2].text = "\(text)"
                }
                
                self.todayTexts[0].text = "\(statsData.history[statsData.history.count - 1].confirmed - statsData.history[statsData.history.count - 2].confirmed)"
                
                self.todayTexts[1].text = "\(statsData.history[statsData.history.count - 1].cured - statsData.history[statsData.history.count - 2].cured)"
                
                self.todayTexts[2].text = "\(statsData.history[statsData.history.count - 1].deaths - statsData.history[statsData.history.count - 2].deaths)"
                
                self.set = LineChartDataSet(entries: self.enteries, label: nil)
                
                self.setSet()
                
                let chartData = LineChartData(dataSet: self.set)
                chartData.setDrawValues(false)
                
                self.chartI.data = chartData
                
                self.chartI.xAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
                
                self.chartI.xAxis.setLabelCount(3, force: false)
                
            } else {
                print("error")
            }
        }
    }
    
    func getQuickStatsData() {
        getDayCountryData { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
                self!.statsDQ.leave()
            case .success(let quickStats):
                print(type(of: quickStats))
                statsData = quickStats
                self!.statsDQ.leave()
            }
        }
    }
    
    func setSet() {
        set = LineChartDataSet(entries: enteries)
        set.circleRadius = 4.0
        set.setCircleColor(UIColor.black)
        set.drawCirclesEnabled = false
        set.setColor(.white)
        set.highlightColor = .systemRed
        set.label = nil
    }
    
    func changeCountry() {
        bottomTitle.text = "\(countrys[defaults.integer(forKey: Keys.selectedCity)])"
        getLocationData(county: "\(countrys[defaults.integer(forKey: Keys.selectedCity)])")
    }
    
    var county: String!
    
    func getCounty(location: CLLocation) {
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location) { [weak self] (placemark, error) in
            guard let self = self else { return }
            
            if let _ = error {
                self.countyDQ.leave()
                return
            }
            
            if let placemark = placemark?.first {
                self.county = placemark.administrativeArea ?? ""
                if self.county == "Maros" {
                    self.county = "Mures"
                }
                
                self.countyDQ.leave()
                
            } else {
                print("err")
                
                self.countyDQ.leave()
            }
            
        }
        
    }
    
    func fromRoConvert(textParam: String) -> String {
        var text = textParam
        
        text = text.folding(options: .diacriticInsensitive, locale: .current)
        
        return text
        
    }
    
    func sendData(latitude: Double, longitude: Double, county: String) {
        guard let uuid = UIDevice.current.identifierForVendor?.uuidString else { return }
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        
        let timeInterval = date.timeIntervalSince(Date(timeIntervalSinceReferenceDate: 600000000))
        let dateInt = Int(timeInterval)
        
        let locationToSend = Location(phoneId: uuid, latitude: latitude, longitude: longitude, stringDate: result, intDate: dateInt)
        
        print("county = \(county)")
        
        let postRequest = APIRequest(endpoint: county)
        
        postRequest.save(locationToSend, completion: { result in
            switch result {
            case .success(let locationToSend):
                print("the data has been sent: \(locationToSend.longitude)")
            case .failure(let error):
                print("an error: \(error)")
            }
        })

    }
    
    func animate2() {
        trailingAnc2.constant = 0
        UIView.animate(withDuration: 0.4, animations: {
            self.view.layoutIfNeeded()
        })
        presented = true
    }
    
    func deAnimate2() {
        trailingAnc2.constant = 230
          UIView.animate(withDuration: 0.4
          , animations: {
                self.view.layoutIfNeeded()
                self.shadowView2.alpha = 0
          }, completion: { (isCompleted) in
            if isCompleted {
                
            }
        })
        presented = false
    }
    
    func displayBlockVc() {
        if !authorisationScreen.isBeingPresented {
            dismiss(animated: false, completion: {
                print("cpm")
                self.present(self.authorisationScreen, animated: true)
            })
        }
        
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func deviceLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorisation()
        } else {
            print("not")
            settingsUrl = URL(string: "App-prefs:Privacy")
            displayBlockVc()
            contentText.text = "Asigura-te ca Location Services este activat in Setari -> Privacy -> Location Services \n Apasa Da, vei fi directionat in setari apoi apasa Location si While Using the App sau  Always \n sau \n Intra in Setari -> Privacy -> Location Services -> together -> Allow While Using the App sau Always"
        }
    }
    
    var lastLocation: CLLocation? = nil
    
    func getLocation() {
        if let location = locationManager.location {
            let distanceInMeters = lastLocation?.distance(from: location)
            if lastLocation == nil {
                lastLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                print("starts")
            } else if Int(distanceInMeters ?? 1) > 50 {
                lastLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                
                self.countyDQ.enter()
                
                getCounty(location: location)
                
                countyDQ.notify(queue: .main) {
                    
                    self.county = self.fromRoConvert(textParam: self.county)
                    
                    print(" 2 = \(self.county)")
                    
                    self.sendData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, county: self.county)
                    
                }
                
                print("location \(type(of: location))")
            }
            
        }
    }
    
    func checkLocationAuthorisation() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            
        case .denied:
            settingsUrl = URL(string: UIApplication.openSettingsURLString)
            displayBlockVc()
            contentText.text = "Asigura-te ca Location Services este activat in Setari -> Privacy -> Location Services \n Apasa Da, vei fi directionat in setari apoi apasa Location si While Using the App sau  Always \n sau \n Intra in Setari -> Privacy -> Location Services -> together -> Allow While Using the App sau Always"
            
        case .notDetermined:
            print("dnd")
            print("diss")
            settingsUrl = nil
            
            displayBlockVc()
            
            contentText.text = "Asigura-te ca Location Services este activat in Setari -> Privacy -> Location Services \n Apasa Da, va aparea pe ecran o imagine care cere accesul la locatie apoi apasa Allow While Using App \n sau \n Intra in Setari -> Privacy -> Location Services -> together -> While Using the App sau Always"
        
        default:
            break
        }
    }

}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        getLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        dismiss(animated: false, completion: nil)
        deviceLocationServices()
    }
}

extension ViewController: ChartViewDelegate {

    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
        dataText.text = "\(statsData.history[Int(highlight.x)].date_string)"
        
        cazuriText.text = "\(statsData.history[Int(highlight.x)].confirmed)"
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation)
        annotationView.clusteringIdentifier = "identifier"
        return annotationView
    }
    
}
