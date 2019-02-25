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
    
    let msgSizeToCut = 20;
    let msgFontSize = 16
    let offlineColor =  UIColor(red: 189/255, green: 183/255, blue: 107/255, alpha: 1)
    let onlineColor =  UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func diffInDays(_ dateRangeStart: Date) -> Int{
        let dateRangeEnd = Date()
        let components = Calendar.current.dateComponents([.day], from: dateRangeStart, to: dateRangeEnd)
        return components.day ?? 0
    }
    
    func setUp(){
        if let n = name{
            nameLabel.text = n
        }
        if var m = message{
            if m.count > msgSizeToCut{
                m = String(m.prefix(msgSizeToCut))
                m+="..."
            }
            msgLabel.text = m
        }else{
            msgLabel.text = "No messages yet"
            msgLabel.font = UIFont.italicSystemFont(ofSize: CGFloat(msgFontSize))

        }
        if let d = date{
            // фича с временем сообщения
            let ndays = diffInDays(d)
            var text: String
            if ndays == 0{
                let calendar = Calendar.current
                let hour = calendar.component(.hour, from: d)
                let minutes = calendar.component(.minute, from: d)
                text = String(hour) + ":" + String(minutes)
            }
            else{
                let calendar = Calendar.current
                let day = calendar.component(.day, from: d)
                let month = calendar.component(.month, from: d)
                text = String(day) + " " + String(month)
            }
            timeLabel.text = text
        }else{
            timeLabel.text = "..."
        }
        if hasUnreadMessages{
            msgLabel.font = UIFont.boldSystemFont(ofSize: CGFloat(msgFontSize))
        }
        if !online{
            self.backgroundColor = offlineColor
        }else{
            self.backgroundColor = onlineColor
        }
    }
}
