//
//  VideoPlayViewController.swift
//  iOS_Dummy_Video_App
//
//  Created by Ankit Sharma on 8/15/20.
//  Copyright © 2020 com.dummy. All rights reserved.
//

import UIKit

open class VideoPlayViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet public var videoPlayCollectionView: UICollectionView?
    
    var urlStrings: [String]?
    var selectedIndex: Int?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        videoPlayCollectionView?.delegate = self
        videoPlayCollectionView?.dataSource = self
        videoPlayCollectionView?.register(UINib(nibName: Constants.videoPlayerCellNibName, bundle: Constants.sdkBundle), forCellWithReuseIdentifier: Constants.videoPlayerCellNibName)
        self.addRightSwipeGesture()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)

        videoPlayCollectionView?.setNeedsLayout()
       videoPlayCollectionView?.layoutIfNeeded()

        videoPlayCollectionView?.scrollToItem(at: IndexPath(row: selectedIndex ?? 0, section: 0), at: .centeredVertically, animated: false)
    }
    
    
    func addRightSwipeGesture(){
       let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(rightSwiped))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.videoPlayCollectionView?.addGestureRecognizer(swipeRight)
    }
    
    @objc func rightSwiped(){
        self.navigationController?.popViewController(animated: true)
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.urlStrings?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.videoPlayerCellNibName, for: indexPath) as? VideoPlayCollectionCell
        cell?.urlString = self.urlStrings?[indexPath.row]
        cell?.playerView?.removeFromSuperlayer()
        cell?.setData()
        return cell ?? UICollectionViewCell()
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? VideoPlayCollectionCell)?.player?.play()
        (cell as? VideoPlayCollectionCell)?.player?.volume = 5
    }

    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? VideoPlayCollectionCell)?.player?.pause()
        (cell as? VideoPlayCollectionCell)?.player?.volume = 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let collectionViewWidth = collectionView.frame.width
     return CGSize(width: collectionViewWidth , height: collectionView.frame.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10.0)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
