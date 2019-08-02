//
//  ScrollViewController.swift
//  ScrollViewSession
//
//  Created by Ambar Septian on 30/07/19.
//  Copyright © 2019 Ambar Septian. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let orangeView = UIView()
    let greenView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView: do {
            scrollView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            scrollView.addSubview(orangeView)
            scrollView.addSubview(greenView)
            view.addSubview(scrollView)
        }
        
        orangeView: do {
            orangeView.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            orangeView.frame = CGRect(x: 20, y: 20, width: 300, height: 300)
        }
        
        greenView: do {
            greenView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
            greenView.frame = CGRect(x: 20, y: 700, width: 300, height: 500)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let contentSize = CGSize(width: view.bounds.width,
                                 height: greenView.frame.maxY)
        scrollView.contentSize = contentSize
    }

}
