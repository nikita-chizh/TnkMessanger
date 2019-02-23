//
//  EditButton.swift
//  TnkMessanger
//
//  Created by Никита on 23/02/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class EditButton: UIButton {

    override init(frame: CGRect) {
        // Logger.printGeneral(self.frame) self' used in property access 'frame' before 'super.init' call
        // до super.init нельзя обращаться к средствам супер класса, потому что они инициализируются
        // как раз в super.init
        super.init(frame: frame)
        Logger.printGeneral(self.frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Logger.printGeneral(self.frame) self' used in property access 'frame' before 'super.init' call
        // до super.init нельзя обращаться к средствам супер класса, потому что они инициализируются
        // как раз в super.init
        super.init(coder: aDecoder)
        print("EditButton frame in init=")
        Logger.printGeneral(self.frame)
        self.backgroundColor = .clear
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
    
}
