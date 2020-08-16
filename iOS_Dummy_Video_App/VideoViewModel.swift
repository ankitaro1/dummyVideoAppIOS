//
//  VideoViewModel.swift
//  iOS_Dummy_Video_App
//
//  Created by Ankit Sharma on 8/15/20.
//  Copyright © 2020 com.dummy. All rights reserved.
//

import Foundation

public protocol VideoFlowDelegate{
    func setVideoDetails(data : VideoUIModel)
}

public class VideoViewModel {
    var videoDataSource: VideoDataSource
    var delegate: VideoFlowDelegate?
    
    init(delegate: VideoFlowDelegate){
        self.delegate = delegate
        self.videoDataSource = VideoDataSource()
    }
    
    public func performVideoJsonParsingAcition(){
       let reponseObj =  self.videoDataSource.parseJson()
        var data: [DataDetails] = []
        for item in reponseObj!.videoResponse{
            var urlStrings: [String] = []
            for value in item.nodes {
                urlStrings.append(value.video.encodeUrl)
            }
            data.append(DataDetails(title: item.title, urlArray: urlStrings))
        }
        let uiModel = VideoUIModel(data: data)
        self.delegate?.setVideoDetails(data: uiModel)
    }
    
}
