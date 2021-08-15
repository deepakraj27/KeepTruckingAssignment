//
//  GeoNamesTest.swift
//  KeepTruckinAssignmentTests
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import Foundation
@testable import KeepTruckinAssignment
import XCTest

class SongsTests: XCTestCase {
  
  var sut: [GeoNames]!
  
  override func setUpWithError() throws {
    super.setUp()
    let data = try getData(fromJSON: "GeoNames")
    sut = try JSONDecoder().decode([GeoNames].self, from: data)
  }
  
  override func tearDownWithError() throws {
    sut = nil
    super.tearDown()
  }
  
  func testFirstSongJSONMapping() {
    let firstGeo = sut.first!
    XCTAssertEqual(firstGeo.toponymName, "Chennai")
    XCTAssertEqual(firstGeo.countryName, "India")
    XCTAssertEqual(firstGeo.geonameId, 1264527)
    XCTAssertEqual(firstGeo.countryCode, "IN")
  }
  
  func testSecondSongJSONMapping() {
    let secondSong = sut[1]
    XCTAssertEqual(secondSong.toponymName, "Chennai")
    XCTAssertEqual(secondSong.countryName, "India")
    XCTAssertEqual(secondSong.geonameId, 7646145)
    XCTAssertEqual(secondSong.countryCode, "IN")
  }
}
