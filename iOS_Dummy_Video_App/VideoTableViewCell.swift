//
//  VideoTableViewCell.swift
//  iOS_Dummy_Video_App
//
//  Created by Ankit Sharma on 8/15/20.
//  Copyright © 2020 com.dummy. All rights reserved.
//

import UIKit

open class VideoTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet public var categoryLabel: UILabel?
    
    @IBOutlet public var videoCollectionView: UICollectionView?
    
    public var cellData: DataDetails?
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        videoCollectionView?.delegate = self
        videoCollectionView?.dataSource = self
        self.videoCollectionView?.register(UINib(nibName: Constants.primaryCellNibName, bundle: Constants.sdkBundle), forCellWithReuseIdentifier: Constants.primaryCellNibName)
        self.categoryLabel?.font = UIFont(name: Constants.fontFaimly, size: CGFloat(16.0))
        self.layoutIfNeeded()
    }
    
    func setData(){
           self.categoryLabel?.text = self.cellData?.title
           self.videoCollectionView?.reloadData()
       }
       
       public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           self.cellData?.urlArray.count ?? 0
        }
        
       public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.primaryCellNibName, for: indexPath) as? PrimaryCollectionViewCell
        cell?.imageView?.image = UIImage(named: "defaultImage")
           cell?.videoURL = self.cellData?.urlArray[indexPath.row] ?? String.empty
           cell?.setData()
           return cell ?? UICollectionViewCell()
        }
    
   public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let collectionViewWidth = collectionView.frame.width
    return CGSize(width: collectionViewWidth / 3, height: collectionView.frame.height)
   }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let targetVC = VideoPlayViewController(nibName: "VideoPlayViewController", bundle: Constants.sdkBundle)
        targetVC.urlStrings = self.cellData?.urlArray
        targetVC.selectedIndex = indexPath.row
    UIApplication.shared.delegate?.window??.rootViewController?.children.last?.navigationController?.pushViewController(targetVC, animated: true)
    }
    
}
