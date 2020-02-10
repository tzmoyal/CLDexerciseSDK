//
//  CLDSDK.swift
//  CLDexerciseSDK
//
//  Created by tzahi moyal on 08/02/2020.
//  Copyright © 2020 TZAHIMOYAL. All rights reserved.
//

import Foundation

@objcMembers open class CLDSDK {
  
  // MARK: CLDexerciseSDK Methods

  /**
     Add subtitles to a given video
     
      - parameter cloudName:         Your account's cloud name on Cloudinary.
      - parameter publicId:          The remote video name.
      - parameter subtitles:         String represent subtitles JSON.
        Example of the JSON format:
        {
          Subtitles:[
            {
             "start-timing":"0:10.8",
             "end-timing":"0:13.3",
             "text":"Hello World"
           },
           {
            "start-timing":"0:16.2",
            "end-timing":"0:20.6",
            "text":"This is the subtitles tool"
           }
          ]
        }
   
      - returns: A URL of video with subtitles embeded or nil.
    */
     
  open class func addSubtitlesToVideo(cloudName: String, videoPublicId: String, subtitles: String) -> URL? {
    guard cloudName.count > 0 else {
      print("cloud name is empty")
      return nil
    }
    
    guard videoPublicId.count > 0 else {
      print("video public id is empty")
      return nil
    }
    
    guard subtitles.count > 0 else {
      print("subtitles is empty")
      return nil
    }
    
    do {
      let subtitlesString =  try transitionSubtitlesFromSubtitlesJSON(subtitles: subtitles)
      let urlString = "https://res.cloudinary.com/\(cloudName)/video/upload/\(subtitlesString)\(videoPublicId).mp4"
      return URL(string: urlString)

    } catch {
      print(error)
      return nil
    }
    
  }
  
  
}
