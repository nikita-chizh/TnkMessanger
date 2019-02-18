//
//  ViewController.swift
//  TnkMessanger
//
//  Created by Никита on 09/02/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userPhotoView: UIImageView!
    
    @IBOutlet weak var editButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        userPhotoView.layer.cornerRadius = userPhotoView.frame.size.width/2
        userPhotoView.clipsToBounds = true
        //
        editButton.backgroundColor = .clear
        editButton.layer.cornerRadius = 20
        editButton.layer.borderWidth = 1
        editButton.layer.borderColor = UIColor.black.cgColor
        //
        Logger.printDebugInfo(#function)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        Logger.printDebugInfo(#function)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Logger.printDebugInfo(#function)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        Logger.printDebugInfo(#function)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Logger.printDebugInfo(#function)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Logger.printDebugInfo(#function)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        Logger.printDebugInfo(#function)
    }
}

