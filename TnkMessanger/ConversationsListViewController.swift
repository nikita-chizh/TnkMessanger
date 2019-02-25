//
//  ConversationsListViewController.swift
//  TnkMessanger
//
//  Created by Никита on 24/02/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class ConversationsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    enum TableSection: Int {
        case online = 0, offline
    }
    @IBOutlet weak var navItem: UINavigationItem!
    @IBOutlet weak var msgTableView: UITableView!
    let SectionHeaderHeight: CGFloat = 25
    @IBOutlet weak var buttonItem: UIBarButtonItem!
    var testData =
            [
            TableSection.online:
            [// имя, последнее сообщение, дата, имеет непрочитанные
                ["User1", "Msg from User1", "2019-02-25T10:44:02", "false"],
                ["User2", "very loooooooooooooooooooooooooong msg", "2019-02-25T11:11:02", "true"],
                ["User3", nil, "2019-02-24T10:44:0", "true"],
                ["User4", "Msg from User4", "2018-04-14T10:44:0", "true"],
                ["User5", nil, "2018-04-14T10:44:0", "true"],
                ["User6", "Msg from User6", "2019-02-24T10:44:02", "false"],
                ["User7", "Msg from User7", "2016-04-14T10:44:02", "false"],
                ["User8", "Msg from User8", "2016-04-14T10:44:02", "false"],
                ["User9", "Msg from User9", "2016-04-14T10:44:02", "false"],
                ["User10", "Msg from User10", "2016-04-14T10:44:02", "false"]
                
            ],
            TableSection.offline:
            [
                ["User11", "Msg from User11", "2019-02-25T10:44:02", "false"],
                ["User12", "Msg from User12", "2019-02-25T10:44:0", "true"],
                ["User13", nil, "2018-04-14T10:44:0", "true"],
                ["User14", "Msg from User14", "2018-04-14T10:44:0", "true"],
                ["User15", nil, "2018-04-14T10:44:0", "true"],
                ["User16", "Msg from User16", "2016-04-14T10:44:02", "false"],
                ["User17", "Msg from User17", "2016-04-14T10:44:02", "false"],
                ["User18", "Msg from User18", "2016-04-14T10:44:02", "false"],
                ["User19", "Msg from User19", "2016-04-14T10:44:02", "false"],
                ["User20", "Msg from User20", "2016-04-14T10:44:02", "false"]
            ]
            ]


    override func viewDidLoad() {
        super.viewDidLoad()
        msgTableView.delegate = self
        msgTableView.dataSource = self
        navItem.title = "Tinkoff Messanger"
        var image = UIImage(named: "uicon4040")
        image = image?.withRenderingMode(.alwaysOriginal)
        buttonItem.image = image
        buttonItem.style = .plain
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 //TODO переписать на кол-во категорий
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Using Swift's optional lookup we first check if there is a valid section of table.
        // Then we check that for the section there is data that goes with.
        if let tableSection = TableSection(rawValue: section) {
            return testData[tableSection]!.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
            if let strd =  dialog[2], let d = dateFormatter.date(from: strd){
                cell.date = d
            }
            if(dialog[3] == "false"){cell.hasUnreadMessages = false}
            if(dialog[3] == "true"){cell.hasUnreadMessages = true}
            if(tableSection == TableSection.online){ cell.online = true}
            if(tableSection == TableSection.offline){ cell.online = false}
        }
        cell.setUp()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        if let tableSection = TableSection(rawValue: indexPath.section),
        let dialogs = testData[tableSection] {
            let stboard = UIStoryboard(name: "Main", bundle: nil)
            let dialog = dialogs[indexPath.row]
            let username = dialog[0]
            let chatController = stboard.instantiateViewController(withIdentifier: "ConversationViewController")as!ConversationViewController
            chatController.userName = username!
            navigationController?.pushViewController(chatController, animated: true)
        }
    }
    

}
