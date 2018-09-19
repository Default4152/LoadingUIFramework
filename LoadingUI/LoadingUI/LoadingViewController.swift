//
//  LoadingViewController.swift
//  LoadingUI
//
//  Created by Conner on 9/19/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit

public class LoadingViewController: UIViewController {
    private var loadingAnimation = IndeterminateLoadingView(frame: CGRect(
        origin: CGPoint(x: 50, y: 50),
        size: CGSize(width: 100, height: 100)))
    
    public override func viewDidLoad() {
        loadingAnimation.frame.origin = self.view.frame.origin
        loadingAnimation.frame.size = CGSize(width: 100, height: 100)
        loadingAnimation.translatesAutoresizingMaskIntoConstraints = false
        loadingAnimation.center = self.view.convert(self.view.center, from: loadingAnimation)
        self.view.addSubview(loadingAnimation)
        
        let button = UIButton()
        button.frame = CGRect(x: self.view.frame.size.width - 170, y: 60, width: 110, height: 50)
        button.backgroundColor = UIColor.red
        button.setTitle("STOP", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc
    func buttonAction(sender: UIButton!) {
        guard let btnLbl = sender.titleLabel?.text else { return }
        if btnLbl == "STOP" {
            UIView.animate(withDuration: 1, animations: {
                sender.setTitle("START", for: .normal)
                sender.backgroundColor = .blue
                self.stopAnimation()
                self.loadingAnimation.alpha = 0.0
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.loadingAnimation.alpha = 1.0
                sender.backgroundColor = .red
                sender.setTitle("STOP", for: .normal)
                self.startAnimation()
            }, completion: nil)
        }
    }
    
    public func startAnimation() {
        loadingAnimation.startAnimating()
    }
    
    public func stopAnimation() {
        loadingAnimation.stopAnimating()
    }
}
