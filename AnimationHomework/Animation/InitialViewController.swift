//
//  ViewController.swift
//  AnimationHomework
//
//  Created by NaYfront on 08.04.2022.
//

import UIKit

class InitialViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var transitionView: UIView!
    @IBOutlet weak var transitionLabel: UILabel!
    
    // MARK: - Property
    var tapGesture: UITapGestureRecognizer!
    var animator: Animator?
    
    // MARK: - VC LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(isViewTapped))
        transitionView.addGestureRecognizer(tapGesture)
    }
    
    @objc func isViewTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "AVC") as? AnimationViewController else { return }
        
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .fullScreen
        vc.data = transitionView
        
        present(vc, animated: true, completion: nil)
    }
}
