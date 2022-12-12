//
//  DynamicLabels.swift
//  together
//
//  Created by Cristea Octavian on 21/05/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation
import UIKit

class DynamicLabelSize {
    
    static func height(text: String?, font: UIFont, width: CGFloat) -> CGFloat {
        var height: CGFloat!
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.text = text
        label.font = font
        label.numberOfLines = 0
        label.sizeToFit()
        label.lineBreakMode = .byWordWrapping
        
        height = label.frame.height
        print("h \(height)")
        label.removeFromSuperview()
        
        return height
    }
    
}
