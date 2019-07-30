//
//  StickyViewController.swift
//  ScrollViewSession
//
//  Created by Ambar Septian on 26/07/19.
//  Copyright © 2019 Ambar Septian. All rights reserved.
//

import UIKit

class StickyViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 3000)
        scrollView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return scrollView
    }()
    
    let orangeView = UIView()
    let pinkView = UIView()
    let greenView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.contentOffset = .zero
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        scrollView.delegate = self
        scrollView.clipsToBounds = false
        
        orangeView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        orangeView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 200)
        
        pinkView.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        pinkView.frame = CGRect(x: 0, y: orangeView.frame.maxY, width: view.bounds.width, height: 200)
        
        greenView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        greenView.frame = CGRect(x: 0, y: pinkView.frame.maxY, width: view.bounds.width, height: 200)
        
        scrollView.addSubview(pinkView)
        scrollView.addSubview(orangeView)
        scrollView.addSubview(greenView)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
        
    }

}

extension StickyViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        print(offsetY)
        
//        if offsetY > orangeView.frame.maxY {
//            pinkView.frame.origin.y = offsetY
//
//        } else {
//            pinkView.frame.origin.y = orangeView.frame.maxY
//        }
        
//        orangeView.frame.origin.y = offsetY
//        pinkView.frame.origin.y = max(orangeView.frame.maxY, pinkView.frame.origin.y -  offsetY)
        if offsetY > orangeView.frame.height * 0.75 {
            print(offsetY, orangeView.frame.height)
            orangeView.frame.origin.y = offsetY - orangeView.frame.height * 0.75
        } else {
//            orangeView.frame.origin.y = oran
        }
    }
}

