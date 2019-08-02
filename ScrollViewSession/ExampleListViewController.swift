//
//  ExampleListViewController.swift
//  ScrollViewSession
//
//  Created by Ambar Septian on 01/08/19.
//  Copyright © 2019 Ambar Septian. All rights reserved.
//

import UIKit

class ExampleListViewController: UIViewController {
    let tableView = UITableView()
    enum Example {
        case simpleScroll, stickyScroll, nestedScroll
        var description: String {
            switch self {
            case .simpleScroll:
                return "Simple Scroll"
            case .stickyScroll:
                return "Sticky Scroll"
            case .nestedScroll:
                return "Nested Scroll"
            }
        }
    }

    let exampleList:[Example] = [.simpleScroll, .stickyScroll, .nestedScroll]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView: do {
            view.addSubview(tableView)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension ExampleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = exampleList[indexPath.row].description
        return cell
    }
}

extension ExampleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let example = exampleList[indexPath.row]
        let viewController: UIViewController
        
        switch example {
        case .simpleScroll:
            viewController = ScrollViewController()
        case .stickyScroll:
            viewController = StickyViewController()
        case .nestedScroll:
            viewController = NestedScrollViewController()
        }
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
