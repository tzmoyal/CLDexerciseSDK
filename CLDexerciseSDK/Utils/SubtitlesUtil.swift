//
//  SubtitlesUtil.swift
//  CLDexerciseSDK
//
//  Created by tzahi moyal on 09/02/2020.
//  Copyright © 2020 TZAHIMOYAL. All rights reserved.
//

import Foundation

fileprivate let defaultFont = "arial"
fileprivate let defaultFontSize = "30"
fileprivate let defaultY = "40"
fileprivate let gravity = "south"
fileprivate let color = "FFFFFF"

fileprivate enum SubtitlesError: Error {
  case invalidSubtitleString(description: String)
}

internal func transitionSubtitlesFromSubtitlesJSON(subtitles: String) throws -> String {
  
  do {
      let subtitlesModel = try JSONDecoder().decode(SubtitlesModel.self, from: Data(subtitles.utf8))
      var subtitlesString = ""
      for subtitle in subtitlesModel.subtitles {
      let escapedString = smartEscape(str: subtitle.text)
      if let escapedString = escapedString {
      subtitlesString.append("l_text:\(defaultFont)_\(defaultFontSize):\(escapedString),g_\(gravity),y_\(defaultY),so_\(try validateTimeString(time: subtitle.startTime)),eo_\(try validateTimeString(time: subtitle.endTime)),co_rgb:\(color)/")
      } else {
        throw SubtitlesError.invalidSubtitleString(description: "inavlid subtitle string: \(subtitle.text)")
        }
    }
    return subtitlesString
      
  } catch {
    print(error)
    throw SubtitlesError.invalidSubtitleString(description: "inavlid subtitle JSON string")
  }
  
  
}


