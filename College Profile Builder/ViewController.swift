//
//  ViewController.swift
//  College Profile Builder
//
//  Created by Maddy Sutton on 1/20/16.
//  Copyright © 2016 Maddy Sutton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    var colleges = ["University of Southern California", "University of Washington", "New York University"] 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

