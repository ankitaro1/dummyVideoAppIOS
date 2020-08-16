//
//  VideoUIModel.swift
//  iOS_Dummy_Video_App
//
//  Created by Ankit Sharma on 8/15/20.
//  Copyright © 2020 com.dummy. All rights reserved.
//

import Foundation
import UIKit


public class VideoUIModel {
    public let data: [DataDetails]
    public init(data: [DataDetails]){
        self.data = data
    }
}


public class DataDetails {
    public let title: String
    public let urlArray: [String]
    
    public init(title: String , urlArray: [String] ){
        self.title = title
        self.urlArray = urlArray
    }
}
