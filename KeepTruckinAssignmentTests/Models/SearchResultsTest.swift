//
//  SearchResultsTest.swift
//  KeepTruckinAssignmentTests
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import Foundation
@testable import KeepTruckinAssignment
import XCTest

class SearchResultTests: XCTestCase {
  
  var sut: SearchResponseResult!
  
  override func setUpWithError() throws {
    super.setUp()
    let data = try getData(fromJSON: "SearchResult")
    sut = try JSONDecoder().decode(SearchResponseResult.self, from: data)
  }
  
  override func tearDownWithError() throws {
    sut = nil
    super.tearDown()
  }
  
  func testJSONMapping() {
    XCTAssertEqual(sut.totalResultsCount, 8)
    XCTAssertEqual(sut.geonames?.count, 8)
  }
}


