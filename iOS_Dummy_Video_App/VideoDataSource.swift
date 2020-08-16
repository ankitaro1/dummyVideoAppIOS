//
//  VideoDataSource.swift
//  iOS_Dummy_Video_App
//
//  Created by Ankit Sharma on 8/15/20.
//  Copyright © 2020 com.dummy. All rights reserved.
//

import Foundation


class VideoDataSource {
    
    func parseJson() -> VideoResponseDao? {
        var videoResponseObj: VideoResponseDao?
        var jsonData: Data?
        do {
            let bundle = Constants.sdkBundle
            let path = bundle.path(forResource: Constants.jsonFileName, ofType: "json")
            jsonData = try Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
            if jsonData != nil {
                let decoder = JSONDecoder()
                videoResponseObj = try decoder.decode(VideoResponseDao.self, from: jsonData ?? Data())
            }
            return videoResponseObj
        } catch {
            return nil
        }
    }
}
