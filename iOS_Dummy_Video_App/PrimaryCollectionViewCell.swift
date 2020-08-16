//
//  PrimaryCollectionViewCell.swift
//  iOS_Dummy_Video_App
//
//  Created by Ankit Sharma on 8/14/20.
//  Copyright © 2020 com.dummy. All rights reserved.
//

import UIKit
import AVKit

var imageCache = NSCache<NSString, UIImage>()

open class PrimaryCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet public var imageView: UIImageView?
    
    public var videoURL: String?
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        self.imageView?.layer.cornerRadius = CGFloat(13.0)
    }
    
    func setData() {
        if let cachedImage = imageCache.object(forKey: (self.videoURL ?? String.empty) as NSString) {
            self.imageView?.image = cachedImage
        } else {
        DispatchQueue.global().async {
            let asset: AVAsset = AVAsset(url: URL(string: self.videoURL ??  String.empty)!)
        let imageGenerator = AVAssetImageGenerator(asset: asset)
            imageGenerator.appliesPreferredTrackTransform = true
        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 2, timescale: 1) , actualTime: nil)
            let image = UIImage(cgImage: thumbnailImage)
            imageCache.setObject(image, forKey: (self.videoURL ?? String.empty) as NSString)
                DispatchQueue.main.async {
                                 self.imageView?.image = image
                           }
        } catch let error {
            print(error)
        }
        }
        }
    }

}
