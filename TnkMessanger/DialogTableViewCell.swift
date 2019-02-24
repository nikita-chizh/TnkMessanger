//
//  DialogTableViewCell.swift
//  TnkMessanger
//
//  Created by Никита on 24/02/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit
protocol ConversationCellConf {
    var name: String? {get set}
    var message: String? {get set}
    var date: Date? {get set}
    var online: Bool {get set}
    var hasUnreadMessages: Bool {get set}
}

class DialogTableViewCell: UITableViewCell, ConversationCellConf {
    var name: String?
    var message: String?
    var date: Date?
    var online = false
    var hasUnreadMessages = true
    
    
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func checkDate(){
        let curdate = Date()
        let calendar = Calendar.current
        let curComponents = calendar.dateComponents([.year, .month, .day], from: curdate)
        
    }
    
    func setUp(){
        if let n = name{
            nameLabel.text = n
        }
        if let m = message{
            msgLabel.text = m
        }else{
            msgLabel.text = "No messages yet"
        }
        if let d = date{
            checkDate()
            let calendar = Calendar.current
            let hour = calendar.component(.hour, from: d)
            let minutes = calendar.component(.minute, from: d)
            timeLabel.text = String(hour) + ":" + String(minutes)
        }
        if hasUnreadMessages{
            msgLabel.font = UIFont.boldSystemFont(ofSize: 16)
        }
        
    }
}
