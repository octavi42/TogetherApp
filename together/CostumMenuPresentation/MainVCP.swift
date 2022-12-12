////
////  MenuPresentAnimation.swift
////  together
////
////  Created by Cristea Octavian on 22/04/2020.
////  Copyright © 2020 Cristea Octavian. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//extension ViewController:  UIViewControllerTransitioningDelegate {
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return self
//    }
//
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return self
//    }
//
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return 0.5
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        // Retrieve the view controllers participating in the current transition from the context.
//        let fromView = transitionContext.viewController(forKey: .from)!.view!
//        let toView = transitionContext.viewController(forKey: .to)!.view!
//
//        // If the view to transition from is this controller's view, the drawer is being presented.
//        let isPresentingDrawer = fromView == view
//
//        let drawerView = isPresentingDrawer ? toView : fromView
//
//        if isPresentingDrawer {
//            // Any presented views must be part of the container view's hierarchy
//            transitionContext.containerView.addSubview(drawerView)
//        }
//
//        /***** Animation *****/
//
//        let drawerSize = CGSize(
//            width: UIScreen.main.bounds.size.width * 0.6,
//            height: UIScreen.main.bounds.size.height)
//
//        // Determine the drawer frame for both on and off screen positions.
//        let offScreenDrawerFrame = CGRect(origin: CGPoint(x: UIScreen.main.bounds.size.width, y:0), size: drawerSize)
//        let onScreenDrawerFrame = CGRect(origin: CGPoint(x: UIScreen.main.bounds.size.width - drawerSize.width, y:0), size: drawerSize)
//
//        drawerView.frame = isPresentingDrawer ? offScreenDrawerFrame : onScreenDrawerFrame
//
//        let animationDuration = transitionDuration(using: transitionContext)
//
//        // Animate the drawer sliding in and out.
//        UIView.animate(withDuration: animationDuration, animations: {
//            drawerView.frame = isPresentingDrawer ? onScreenDrawerFrame : offScreenDrawerFrame
//            shadowBackground.alpha = 0.4
//        }, completion: { (success) in
//            // Cleanup view hierarchy
//            if !isPresentingDrawer {
//                drawerView.removeFromSuperview()
//            }
//
//            // IMPORTANT: Notify UIKit that the transition is complete.
//            transitionContext.completeTransition(success)
//        })
//    }
//}
