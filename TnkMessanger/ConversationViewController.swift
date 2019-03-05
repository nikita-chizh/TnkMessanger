//
//  ConversationViewController.swift
//  TnkMessanger
//
//  Created by Никита on 25/02/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Сейчас все упорядоченно, я предполагаю, что бэк тоже так отдаст))
    var testData =
        [
            [true, "Plesiorycteropus was a mammal from Madagascar that became extinct sometime after 200 BCE, as evidenced by radiocarbon dating. Upon its description in 1895 by French naturalist Henri Filhol, Plesiorycteropus was classified with the aardvark, but more recent studies have found little evidence for that linkage. Molecular evidence instead suggests that it is related to the tenrecs, in the order Afrosoricida. Two species are recognized"],
            [true, "Такая вот простыня"],
            [false, "Вот ответ"],
            [false, "P. germainepetterae; subfossil remains of both species have been found in the same site. Only limb and partial pelvis and skull bones have been recovered to date. Plesiorycteropus was probably a digging animal that fed on insects such as termites and ants. It also shows adaptations for climbing and sitting. Estimates of its mass range from 6 to 18 kilograms (13 to 40 lb). Forest destruction by humans may have contributed to its extinction. (Full article...)"]
    ]

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var chatBar: UINavigationBar!
    var userName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.rowHeight = UITableView.automaticDimension;
        chatTableView.estimatedRowHeight = 500
        chatTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        //
        self.title = userName
        //
        testData += testData
        testData += testData
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MessageTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MessageTableViewCell  else {
            fatalError("The dequeued cell is not an instance of " + cellIdentifier)
        }
        let descr = testData[indexPath.row]
        cell.itIsMyMsg = descr[0] as! Bool
        cell.message = descr[1] as? String
        
        cell.setUp()
        return cell
    }

    
    
    
    
}
