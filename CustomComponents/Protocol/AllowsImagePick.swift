//
//  AllowsImagePick.swift
//  Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import UIKit

public protocol AllowsImagePick {
    var imagePickerController: UIImagePickerController { get }
    func presentImagePickOptions(sender: UIView)
    func openCamera()
    func openGallery()
}

public extension AllowsImagePick where Self: UIViewController {
    func presentImagePickOptions(sender: UIView) {
        let imagePickOptionsController = UIAlertController(title: NSLocalizedString("Choose Image", comment: ""), message: nil, preferredStyle: .actionSheet)
        imagePickOptionsController.addAction(UIAlertAction(title: NSLocalizedString("Camera", comment: ""), style: .default, handler: { _ in
            self.openCamera()
        }))
        
        imagePickOptionsController.addAction(UIAlertAction(title: NSLocalizedString("Gallery", comment: ""), style: .default, handler: { _ in
            self.openGallery()
        }))
        imagePickOptionsController.addAction(UIAlertAction.init(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil))
        /*If you want work actionsheet on ipad
         then you have to use popoverPresentationController to present the actionsheet,
         otherwise app will crash on iPad */
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            imagePickOptionsController.popoverPresentationController?.sourceView = sender
            imagePickOptionsController.popoverPresentationController?.sourceRect = sender.bounds
            imagePickOptionsController.popoverPresentationController?.permittedArrowDirections = .up
        default:
            break
        }
        
        self.present(imagePickOptionsController, animated: true, completion: nil)
    }
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
        {
            imagePickerController.sourceType = UIImagePickerController.SourceType.camera
            imagePickerController.allowsEditing = true
            self.present(imagePickerController, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: NSLocalizedString("Warning", comment: ""), message: NSLocalizedString("You don't have camera", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery()
    {
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.allowsEditing = true
        self.present(imagePickerController, animated: true, completion: nil)
    }
}
