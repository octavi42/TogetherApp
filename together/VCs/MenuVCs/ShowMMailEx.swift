//
//  ShowMMailEx.swift
//  together
//
//  Created by Cristea Octavian on 21/05/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

extension ViewController {
    
    func showMailScreen() {
        
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["together.app.dev@gmail.com"])
        composer.setSubject("Raportez o problema")
        composer.setMessageBody("Problema mea este ", isHTML: false)
        
        present(composer, animated: true)
    }
    
}

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true, completion: nil)
            
            return
        }
        
        switch result {
        case .cancelled:
            print("cancelled")
        case .failed:
            print("failed")
        case .saved:
            print("saved")
        case .sent:
            print("sent")
        @unknown default:
            print("def")
        }
        
        controller.dismiss(animated: true, completion: nil)
        
    }
}

extension AuthorizationViewController {
    
    func showMailScreen() {
        
        guard MFMailComposeViewController.canSendMail() else { return }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["together.app.dev@gmail.com"])
        composer.setSubject("Raportez o problema")
        composer.setMessageBody("Problema mea este ", isHTML: false)
        
        present(composer, animated: true)
    }
    
}

extension AuthorizationViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true, completion: nil)
            
            return
        }
        
        switch result {
        case .cancelled:
            print("cancelled")
        case .failed:
            print("failed")
        case .saved:
            print("saved")
        case .sent:
            print("sent")
        @unknown default:
            print("def")
        }
        
        controller.dismiss(animated: true, completion: nil)
        
    }
}
