//
//  ScheduleViewController.swift
//  PizzaFM
//
//  Created by Andrew Breckenridge on 4/28/15.
//  Copyright (c) 2015 asb. All rights reserved.
//

import UIKit
import Alamofire

class ScheduleViewController: UIViewController {
    @IBOutlet weak var scheduleTableView: UITableView!
    
    var selectedFilter = 0
    let filters = ["Date"]
    let filterDictionary: [String: [String]] = ["Date": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Sunday"]]
    
    var collapsed = [true,true,true,true,true,true,true]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = true
    }
}

extension ScheduleViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return filterDictionary[filters[0]]!.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collapsed[section] ? 0 : 5
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 33))
        
        let viewLabel = UILabel(frame: CGRect(x: 11, y: 3, width: 80, height: 22))
        viewLabel.text = "idufh"
        
        view.addSubview(viewLabel)
        
        return view
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellID") as! UITableViewCell
        cell.textLabel?.text = "lol"
        
        return cell
    }
}