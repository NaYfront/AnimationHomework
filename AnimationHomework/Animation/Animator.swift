//
//  Animator.swift
//  AnimationHomework
//
//  Created by NaYfront on 08.04.2022.
//

import UIKit

final class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    private let firstViewController: UIViewController
    private let secondViewController: UIViewController
    
    init(firstViewController: UIViewController, secondViewController: UIViewController) {
        
        self.firstViewController = firstViewController
        self.secondViewController = secondViewController
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        guard let transitionView = secondViewController.view else {
            transitionContext.completeTransition(false)
            return
        }
        
        guard let firstViewController = firstViewController as? InitialViewController else {
                  transitionContext.completeTransition(false)
                  return
              }
        
        transitionView.alpha = 0
        containerView.addSubview(transitionView)
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeLinear) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0) {
                firstViewController.transitionLabel.alpha = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2) {
                firstViewController.transitionView.frame.origin.y = -5
                firstViewController.transitionView.transform = .init(scaleX: 2, y: 1.2)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 1) {
                transitionView.alpha = 1
            }
            
        } completion: { _ in
            transitionContext.completeTransition(true)
            firstViewController.transitionView.transform = .identity
            firstViewController.transitionLabel.alpha = 1
            
            return
        }
    }
}
