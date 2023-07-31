//
//  ImageSaver.swift
//  ChallengeDay77
//
//  Created by Justin on 7/31/23.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToDisk(image: UIImage) {
        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: FileManager.documentsDirectory, options: [.atomic, .completeFileProtection])
        } else {
            print("Couldn't Save Image to Disk")
        }
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
