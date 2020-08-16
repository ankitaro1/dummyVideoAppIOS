//
//  MainViewControlerViewController.swift
//  iOS_Dummy_Video_App
//
//  Created by Ankit Sharma on 8/16/20.
//  Copyright © 2020 com.dummy. All rights reserved.
//

import UIKit

class MainViewControlerViewController: UIViewController , VideoFlowDelegate , UITableViewDelegate , UITableViewDataSource{
    
     @IBOutlet public var videoTableView: UITableView?
     
     var viewModel: VideoViewModel?
     var uiModel: VideoUIModel?
     
     override open func viewDidLoad() {
         super.viewDidLoad()
         self.videoTableView?.delegate = self
         self.videoTableView?.dataSource = self
         self.videoTableView?.register(UINib(nibName: Constants.videoCellNibName, bundle: Constants.sdkBundle), forCellReuseIdentifier: Constants.videoCellNibName)
         self.viewModel = VideoViewModel(delegate: self)
         self.viewModel?.performVideoJsonParsingAcition()
     }
     
     public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         self.uiModel?.data.count ?? 0
     }
     
     public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: Constants.videoCellNibName) as? VideoTableViewCell
         cell?.cellData = self.uiModel?.data[indexPath.row]
         cell?.setData()
         return cell ?? UITableViewCell()
     }
     
     public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return CGFloat(330.0)
     }
     
     
     public func setVideoDetails(data: VideoUIModel) {
         self.uiModel = data
     }
}
