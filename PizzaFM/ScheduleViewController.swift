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
    @IBOutlet weak var scheduleTableView: SLExpandableTableView!
    
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

extension ScheduleViewController: SLExpandableTableViewDelegate, SLExpandableTableViewDatasource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(tableView: SLExpandableTableView!, canExpandSection section: Int) -> Bool {
        return true
    }
    
    func tableView(tableView: SLExpandableTableView!, needsToDownloadDataForExpandableSection section: Int) -> Bool {
        return false
    }
    
    func tableView(tableView: SLExpandableTableView!, expandingCellForSection section: Int) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("detailCell")!
        cell.textLabel?.text = "ds"
        return cell
    }
    
    func tableView(tableView: SLExpandableTableView!, downloadDataForExpandableSection section: Int) {}
    
    func tableView(tableView: SLExpandableTableView!, didExpandSection section: UInt, animated: Bool) {}
    
    func tableView(tableView: SLExpandableTableView!, didCollapseSection section: UInt, animated: Bool) {}
}