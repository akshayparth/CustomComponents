//
//  UIImage+ModelUtilities.swift
// Copyright - Devarshi Kulshreshtha (devarshi.kulshreshtha@gmail.com)
//

import UIKit
import AVFoundation

public extension UIImage {
    func compressedImageData(compressionQuality: CGFloat = 0.2) -> Data? {
        let compressedData = self.jpegData(compressionQuality: compressionQuality)
        return compressedData
    }
    
    func base64EncodedCompressedImageString(compressionQuality: CGFloat = 0.2) -> String? {
        return compressedImageData(compressionQuality: compressionQuality)?.base64EncodedString(options: .lineLength64Characters)
    }
    
    func rescaledTo(width: CGFloat = 200.0, height: CGFloat = 200.0) -> UIImage {
        let scaledRect = AVMakeRect(aspectRatio: self.size, insideRect: CGRect(x: 0, y: 0, width: width, height: height))
        UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), false, 0.0);
        self.draw(in: scaledRect)
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func rescaledCompressedImageWithString(compressionQuality: CGFloat = 0.2, width: CGFloat = 100.0, height: CGFloat = 100.0) -> (UIImage?, String?) {
        //1. Rescale the image
        let rescaledImage = rescaledTo(width: width, height: height)
        
        //2. Compress the image
        if let compressedImageData = rescaledImage.compressedImageData(compressionQuality: compressionQuality), let image = UIImage(data: compressedImageData) {
            let base64Image = compressedImageData.base64EncodedString()
            return (image, base64Image)
        } else {
            return (nil, nil)
        }
    }
}
