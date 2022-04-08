//
//  TransitioningDelegate.swift
//  AnimationHomework
//
//  Created by NaYfront on 08.04.2022.
//

import UIKit

extension InitialViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // B2 - 16
        guard let firstViewController = presenting as? InitialViewController,
            let secondViewController = presented as? AnimationViewController else { return nil }

        animator = Animator(firstViewController: firstViewController, secondViewController: secondViewController)
        return animator
    }
}
