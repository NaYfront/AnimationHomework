//
//  AnimationViewController.swift
//  AnimationHomework
//
//  Created by NaYfront on 08.04.2022.
//

import UIKit

class AnimationViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    // MARK: - Properties
    private var animator: UIViewPropertyAnimator!
    var data: UIView!
    
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = data.backgroundColor
        
        let cross = #imageLiteral(resourceName: "cross").withRenderingMode(.alwaysTemplate)
        closeButton.setImage(cross, for: .normal)
        closeButton.tintColor = .black
        
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: {
            self.animationView.transform = .init(rotationAngle: .pi)
            self.animationView.layer.cornerRadius = self.animationView.frame.height / 2
        })
    }
    
    // MARK: - IBAction
    @IBAction func sliderDidChange(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
    }
    
    @IBAction func close(_ sender: Any) {
        animator.stopAnimation(true)
        dismiss(animated: true)
    }
}
