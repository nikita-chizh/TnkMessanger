//
//  ViewController.swift
//  TnkMessanger
//
//  Created by Никита on 09/02/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var editButton: EditButton!
    @IBOutlet weak var userPhotoView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //userPhotoView.layer.cornerRadius = userPhotoView.frame.size.width/2
        //userPhotoView.clipsToBounds = true
        //
        print("EditButton frame in viewDidLoad()=")
        Logger.printGeneral(editButton.frame)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("EditButton frame in viewDidAppear()=")
        Logger.printGeneral(editButton.frame)
        // реальные размеры резолвятся при отрисовке
        // X строго задан -> везде один и тот же, как и высота
        // Y и ширина меняются от размера экрана
        // (16.0, 732.0, 343.0, 30.0) X
        // (16.0, 522.0, 288.0, 30.0) SE
        // (16.0, 816.0, 382.0, 30.0) XS MAX
        // Любой другой print:
        // (16.0, 522.0, 288.0, 30.0)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

