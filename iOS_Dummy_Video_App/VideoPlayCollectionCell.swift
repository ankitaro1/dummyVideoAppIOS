//
//  VideoPlayCollectionCell.swift
//  iOS_Dummy_Video_App
//
//  Created by Ankit Sharma on 8/15/20.
//  Copyright © 2020 com.dummy. All rights reserved.
//

import UIKit
import AVKit

class VideoPlayCollectionCell: UICollectionViewCell {
    
    var urlString: String?
    var player: AVPlayer?
    var playerView: AVPlayerLayer?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.clipsToBounds = true
    }
    
    func setData(){
        let asset = AVAsset(url:  URL(string: self.urlString ?? String.empty)!)
        let playerItem = AVPlayerItem(asset: asset)
        self.player = AVPlayer(playerItem: playerItem)
        self.playerView = AVPlayerLayer(player: player)
        self.playerView?.frame = self.contentView.frame
        self.playerView?.videoGravity = .resizeAspectFill
        self.contentView.layer.addSublayer(self.playerView ?? CALayer())
        self.player?.volume = 5
        self.player?.play()
    }
}
