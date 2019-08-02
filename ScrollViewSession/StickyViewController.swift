//
//  StickyViewController.swift
//  ScrollViewSession
//
//  Created by Ambar Septian on 26/07/19.
//  Copyright © 2019 Ambar Septian. All rights reserved.
//

import UIKit

class StickyViewController: UIViewController {
    let scrollView = UIScrollView()
    let orangeView = UIView()
    let pinkView = UIView()
    let greenView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView: do {
            scrollView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            scrollView.delegate = self
            
            scrollView.addSubview(orangeView)
            scrollView.addSubview(pinkView)
            scrollView.addSubview(greenView)
            
            view.addSubview(scrollView)
        }

        orangeView: do {
            orangeView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            orangeView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 200)
        }
        
        greenView: do {
            greenView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            greenView.frame = CGRect(x: 0, y: orangeView.frame.maxY, width: view.bounds.width, height: 200)
        }
        
        pinkView: do {
            pinkView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            pinkView.frame = CGRect(x: 0, y: greenView.frame.maxY, width: view.bounds.width, height: 300)
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let contentHeight: CGFloat = 2000 // use dummy value so that the scrollview can scroll far enough
        scrollView.contentSize = CGSize(width: view.bounds.width, height: contentHeight)
    }
}

extension StickyViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
     
        if offsetY > orangeView.frame.maxY {
            greenView.frame.origin.y = offsetY

        } else {
            greenView.frame.origin.y = orangeView.frame.maxY
        }
    }
}

