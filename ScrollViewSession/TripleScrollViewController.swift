

//
//  TripleScrollViewController.swift
//  ScrollViewSession
//
//  Created by Ambar Septian on 29/07/19.
//  Copyright © 2019 Ambar Septian. All rights reserved.
//

import UIKit

class TripleScrollViewController: UIViewController {
    let upperScrollView = CustomTableView(cellColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))
    let bottomScrollView = CustomTableView(cellColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
    let parentScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parentScrollView.delegate = self
        view.addSubview(parentScrollView)
        parentScrollView.addSubview(upperScrollView)
        parentScrollView.addSubview(bottomScrollView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        parentScrollView.frame = view.bounds
        upperScrollView.frame = view.bounds
        bottomScrollView.frame = CGRect(x: 0,
                                        y: upperScrollView.frame.maxY,
                                        width: view.bounds.width,
                                        height: view.bounds.height)
        
        let contentHeight = upperScrollView.contentSize.height + bottomScrollView.contentSize.height
        parentScrollView.contentSize = CGSize(width: parentScrollView.frame.width,
                                              height: contentHeight)
    }
    
    func handleScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        
        if scrollView.contentOffset.y + upperScrollView.frame.height < upperScrollView.contentSize.height {
            
            upperScrollView.contentOffset.y = y
            upperScrollView.frame.origin.y = y
            bottomScrollView.frame.origin.y = upperScrollView.frame.maxY
            
            print("TOP - \(bottomScrollView.frame.origin.y) - \(y)")
        } else if scrollView.contentOffset.y < upperScrollView.contentSize.height {
            
            upperScrollView.contentOffset.y = y
//            upperScrollView.frame.origin.y = upperScrollView.contentSize.height - y
            print("MIDDLE - \(bottomScrollView.frame.origin.y) - \(y)")
            bottomScrollView.frame.origin.y = upperScrollView.frame.maxY - (upperScrollView.contentSize.height - y)
            bottomScrollView.contentOffset.y = 0
            
        } else {
            print("BOTTOM")
            bottomScrollView.frame.origin.y = y
            upperScrollView.frame.origin.y = bottomScrollView.frame.origin.y - upperScrollView.frame.height
            bottomScrollView.contentOffset.y =  y - upperScrollView.contentSize.height
        }
    }

}

extension TripleScrollViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        handleScroll(scrollView)
    }
}

