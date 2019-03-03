//
//  ViewController.swift
//  ExpandingTable
//
//  Created by Furkan Beyhan on 26.02.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class TableViewController: UITableViewController {
    
    var tableViewData = [cellData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [cellData(opened: false, title: "Title1", sectionData: ["cell1","cell2","cell3"]),
        cellData(opened: false, title: "Title2", sectionData: ["cell1","cell2","cell3"]),
        cellData(opened: false, title: "Title3", sectionData: ["cell1","cell2","cell3"]),
        cellData(opened: false, title: "Title4", sectionData: ["cell1","cell2","cell3"])]
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true{
            
            return tableViewData[section].sectionData.count + 1
            
        }else{
            
            return 1
            
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")else{
                return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
            
        }else{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")else{
                return UITableViewCell()}
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableViewData[indexPath.section].opened == true {
           
            tableViewData[indexPath.section].opened = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .bottom)
            
        }else {
            tableViewData[indexPath.section].opened = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .fade)
        }
        
    }

}

