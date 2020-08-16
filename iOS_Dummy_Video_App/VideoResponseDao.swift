//
//  VideoResponseDao.swift
//  iOS_Dummy_Video_App
//
//  Created by Ankit Sharma on 8/15/20.
//  Copyright © 2020 com.dummy. All rights reserved.
//

import Foundation


class VideoResponseDao: Decodable {
    
    var videoResponse: [NodesDao]
    
    enum CodingKeys: String, CodingKey {
      case videoResponse = "videoResponse"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.videoResponse = try container.decode([NodesDao].self, forKey: .videoResponse)
       }
}

class NodesDao: Decodable{
    var nodes: [VideoDao]
    var title: String
    
    enum CodingKeys: String, CodingKey {
      case nodes = "nodes"
      case title = "title"
    }
    
    public required init(from decoder: Decoder) throws {
     let container = try decoder.container(keyedBy: CodingKeys.self)
    self.nodes = try container.decode([VideoDao].self, forKey: .nodes)
     self.title = try container.decode(String.self, forKey: .title)
    }
}

class VideoDao:Decodable{
    var video: UrlDao
    enum CodingKeys: String, CodingKey {
      case video = "video"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.video = try container.decode(UrlDao.self, forKey: .video)
       }
}

class UrlDao: Decodable {
    var encodeUrl: String
    
    enum CodingKeys: String, CodingKey {
      case encodeUrl = "encodeUrl"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.encodeUrl = try container.decode(String.self, forKey: .encodeUrl)
       }
}
