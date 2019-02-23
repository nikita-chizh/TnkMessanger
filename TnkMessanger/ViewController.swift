//
//  ViewController.swift
//  TnkMessanger
//
//  Created by Никита on 09/02/2019.
//  Copyright © 2019 Никита. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var editButton: EditButton!
    @IBOutlet weak var photoButton: UIButton!
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var userPhotoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoButton.backgroundColor = UIColor(red: 63/255,
                                              green: 120/255,
                                              blue: 240/255,
                                              alpha: 1)//#3F78F0
        let cornerRadius = 50
        photoButton.layer.cornerRadius = CGFloat(cornerRadius)
        userPhotoView.layer.cornerRadius = CGFloat(cornerRadius)
        userPhotoView.clipsToBounds = true
        Logger.printDebugInfo("EditButton frame in viewDidLoad()=")
        Logger.printGeneral(editButton.frame)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Logger.printDebugInfo("EditButton frame in viewDidAppear()=")
        Logger.printGeneral(editButton.frame)
        // реальные размеры резолвятся при отрисовке
        // X строго задан -> везде один и тот же, как и высота
        // Y и ширина меняются от размера экрана
        // X: (16.0, 732.0, 343.0, 30.0)
        // SE: (16.0, 522.0, 288.0, 30.0)
        // XS MAX: (16.0, 816.0, 382.0, 30.0)
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
    
    @IBAction func choosePhoto(_ sender: Any) {
        showActionSheet()
    }
        
    func photoLibrary(){
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.sourceType = .photoLibrary
            commonPicker()
        }
    }
    
    func camera(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            commonPicker()
        }
    }
    
    func commonPicker()
    {
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        if( picker.sourceType == .photoLibrary)
        {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                userPhotoView.image = image
            }
            return
        }
        if(picker.sourceType == .camera)
        {
            if let  image = info[.editedImage] as? UIImage{
                userPhotoView.image = image
            }
            return 
        }
    }

    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: UIAlertAction.Style.default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
    }

}

