//
//  ViewController.swift
//  GifGenerator
//
//  Created by Galileo Guzman on 2/28/19.
//  Copyright © 2019 Galileo Guzman. All rights reserved.
//

import UIKit
import PhotosUI
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,  PHLivePhotoViewDelegate{

    @IBOutlet weak var vLive: UIView!
    let imagePicker = UIImagePickerController()
    var livePhoto = PHLivePhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    @IBAction func btnLoadImagePressed(_ sender: Any) {
        livePhoto.removeFromSuperview()
        
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        imagePicker.delegate = self
        imagePicker.mediaTypes = [kUTTypeImage, kUTTypeLivePhoto] as [String]
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func btnConvertImagePressed(_ sender: Any) {
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // ----
        if let pickedImage = info[UIImagePickerController.InfoKey.livePhoto] as? PHLivePhoto {
            
            
            livePhoto = PHLivePhotoView(frame: CGRect(x: 0, y: 0, width: vLive.frame.width, height: vLive.frame.height))
            livePhoto.livePhoto = pickedImage
            livePhoto.contentMode = .scaleAspectFill
            livePhoto.startPlayback(with: .hint)
            
            vLive.addSubview(livePhoto)
            vLive.sendSubviewToBack(livePhoto)
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func livePhotoView(_ livePhotoView: PHLivePhotoView, didEndPlaybackWith playbackStyle: PHLivePhotoViewPlaybackStyle) {
        // ----
    }
    
    func livePhotoView(_ livePhotoView: PHLivePhotoView, willBeginPlaybackWith playbackStyle: PHLivePhotoViewPlaybackStyle) {
        // ---
    }
    
}

