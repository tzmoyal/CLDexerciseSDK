//
//  SubtitlesModel.swift
//  CLDexerciseSDK
//
//  Created by tzahi moyal on 09/02/2020.
//  Copyright © 2020 TZAHIMOYAL. All rights reserved.
//

import Foundation

struct SubtitlesModel: Codable {
  let subtitles:[Subtitle]
  
  struct Subtitle: Codable {
    let startTime,endTime,text: String
    
    private enum CodingKeys : String, CodingKey {
        case startTime = "start-timing", endTime = "end-timing", text
    }
  }
}
