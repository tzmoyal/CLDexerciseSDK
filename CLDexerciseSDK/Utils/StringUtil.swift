//
//  StringUtil.swift
//  CLDexerciseSDK
//
//  Created by tzahi moyal on 09/02/2020.
//  Copyright © 2020 TZAHIMOYAL. All rights reserved.
//

import Foundation

internal func validateTimeString(time: String) throws -> String {
  guard time.count > 0 else {
    throw TimeError.invalidTimeString(description: "time string is empty")
  }
  guard time.split(separator: ":").count > 0 else {
    throw TimeError.invalidTimeString(description: "invalid time template")
  }
  
  guard time.split(separator: ".").count > 0 else {
    throw TimeError.invalidTimeString(description: "invalid time template")
  }
  
  var timeArray = time.split(separator: ":")
  var timeFloat:Float = 0.0
  switch timeArray.count {
  case 3:
    timeFloat += (Float(String(timeArray[0])) ?? 0)*60*60
    timeArray.remove(at: 0)
    fallthrough
  case 2:
    timeFloat += (Float(String(timeArray[0])) ?? 0)*60
    timeArray.remove(at: 0)
    fallthrough
  default:
    timeFloat += (Float(String(timeArray[0])) ?? 0)
    break
  }
  

  return String(timeFloat)
}

internal func smartEscape(str: String) -> String? {
  let customAllowedSet =  NSCharacterSet(charactersIn:"!*'\"();@&=+$,?%#[] ").inverted
  let escapedString = str.addingPercentEncoding(withAllowedCharacters: customAllowedSet)
  if let escapedString = escapedString {
    var doubleEscapedString = escapedString.replacingOccurrences(of: "%2C", with: "%252C")
    doubleEscapedString = doubleEscapedString.replacingOccurrences(of: "%", with: "%25")
    return doubleEscapedString
  }
  return nil
}

fileprivate enum TimeError: Error {
  case invalidTimeString(description: String)
}
