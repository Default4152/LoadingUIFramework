//
//  ViewController.swift
//  LoadingUITest
//
//  Created by Conner on 9/19/18.
//  Copyright © 2018 Conner. All rights reserved.
//

import UIKit
import LoadingUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loadingView = LoadingViewController()
        loadingView.startAnimation()
        add(loadingView)
    }
    
}

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
}
