//
//  ConversationsListViewController.swift
//  TnkMessanger
//
//  Created by Никита on 24/02/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class ConversationsListViewController: UITableViewController {

    enum TableSection: Int {
        case online = 0, offline
    }
    
    // This is the size of our header sections that we will use later on.
    let SectionHeaderHeight: CGFloat = 25
    var testData =
            [
            TableSection.online:
            [
                ["User1", "Msg from User1", "2016-04-14T10:44:02", "false"],
                ["User3", "Msg from User3", "2017-04-14T10:44:0", "true"],
            ],
            TableSection.offline:
            [
                ["User2", "Msg from User2", "2016-04-14T10:44:02", "true"],
                ["User4", "Msg from User4", "2018-04-14T10:44:02", "false"]
            ]
            ]


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Using Swift's optional lookup we first check if there is a valid section of table.
        // Then we check that for the section there is data that goes with.
        if let tableSection = TableSection(rawValue: section) {
            return testData[tableSection]!.count
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SectionHeaderHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: SectionHeaderHeight))
        view.backgroundColor = UIColor(red: 253.0/255.0, green: 240.0/255.0, blue: 196.0/255.0, alpha: 1)
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: SectionHeaderHeight))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
        if let tableSection = TableSection(rawValue: section) {
            switch tableSection {
            case .online:
                label.text = "Online"
            case .offline:
                label.text = "Offline"
            }
        }
        view.addSubview(label)
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DialogTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DialogTableViewCell  else {
            fatalError("The dequeued cell is not an instance of " + cellIdentifier)
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        if let tableSection = TableSection(rawValue: indexPath.section),
            let dialogs = testData[tableSection] {
            let dialog = dialogs[indexPath.row]
            cell.name = dialog[0]
            cell.message = dialog[1]
            cell.date = dateFormatter.date(from: dialog[2])!
            if(dialog[3] == "false"){cell.hasUnreadMessages = false}
            if(dialog[3] == "true"){cell.hasUnreadMessages = true}
            if(tableSection == TableSection.online){ cell.online = true}
            if(tableSection == TableSection.offline){ cell.online = false}
        }
        cell.setUp()
        return cell
    }


}