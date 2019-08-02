
//
//  CustomTableView.swift
//  ScrollViewSession
//
//  Created by Ambar Septian on 29/07/19.
//  Copyright © 2019 Ambar Septian. All rights reserved.
//

import UIKit


class CustomTableView: UITableView {
    let cellColor: UIColor
    
    init(cellColor: UIColor) {
        self.cellColor = cellColor
        super.init(frame: .zero, style: .plain)
        
        isScrollEnabled = false
        dataSource = self
        
        register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension CustomTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.contentView.backgroundColor = cellColor
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
        
    }
}
