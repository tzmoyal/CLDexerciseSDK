//
//  CLDexerciseSDKTests.swift
//  CLDexerciseSDKTests
//
//  Created by tzahi moyal on 06/02/2020.
//  Copyright © 2020 TZAHIMOYAL. All rights reserved.
//

import XCTest
@testable import CLDexerciseSDK

class CLDexerciseSDKTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func testTimeParsing() {
    XCTAssertEqual(try validateTimeString(time: "3:5:46.2"), "11146.2")
  }

  func testSubtitleParsing() {
    XCTAssertEqual(try transitionSubtitlesFromSubtitlesJSON(subtitles: "{\"subtitles\": [{\"start-timing\": \"0:24.8\",\"end-timing\": \"0:27.2\",\"text\": \"Test parsing, OK\"}]}"), "l_text:arial_30:Test%2520parsing%25252C%2520OK,g_south,y_40,so_24.8,eo_27.2,co_rgb:FFFFFF/")
  }
  


}
