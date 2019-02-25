//
//  MessageTableViewCell.swift
//  TnkMessanger
//
//  Created by Никита on 24/02/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

protocol MessgageCellConf {
    var message: String? {get set}
}

class MessageTableViewCell: UITableViewCell, MessgageCellConf {
    var message: String?
    var itIsMyMsg = true
    
    @IBOutlet weak var myMsg: UILabel!
    @IBOutlet weak var anotherUsrMsg: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(){
        if(itIsMyMsg){
            myMsg.text = message
            anotherUsrMsg.text = ""
        }
        else{
            myMsg.text = ""
            anotherUsrMsg.text = message
        }
    }
    

}
