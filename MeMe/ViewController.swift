//
//  ViewController.swift
//  MeMe1.0
//
//  Created by Mark Greenberg on 9/17/19.
//  Copyright © 2019 MarkStar Technologies. All rights reserved.
//  Added comment for source code control test


import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var imageViewPicker: UIImageView!
    
    @IBOutlet weak var cancel: UIBarButtonItem!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageViewPicker.image = image
        }
        else {
            print("there was a problem selecting a photo from the album!")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Disable pickCameraImage button if camera not available
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            cameraButton.isEnabled = false
        }
    }
    
    
    @IBAction func pickImageUsingCamera(_ sender: Any) {
       
        pickAnImage(UIImagePickerController.SourceType.camera)
        
    }
    
    
    @IBAction func pickImageFromAlbum(_ sender: UIBarButtonItem) {
        pickAnImage(UIImagePickerController.SourceType.photoLibrary)
    }
    
    func pickAnImage(_ source: UIImagePickerController.SourceType)
    {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = source
        //imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func shareMeme(_ sender: Any) {
      
        let vc = UIActivityViewController(activityItems: [imageViewPicker.image!], applicationActivities: [])
        present(vc, animated: true)
    }
    
    @IBAction func cancel(_ sender: Any) {
        imageViewPicker.image = nil
        cancel.isEnabled = false
        
    }
}

