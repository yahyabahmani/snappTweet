//
//  Validation_Api_service.swift
//  snappTweetTests
//
//  Created by yahya on 4/23/22.
//

import XCTest
@testable import snappTweet
class Validation_Api_service: XCTestCase {
let mockModelTweet = MockModelTweet()
let membershipApi = MembershipRepository()

func test_Model_is_Valid() {
  let expectation = XCTestExpectation(description: "ready")

  mockModelTweet.getShareList(query: "ios") { item in
    XCTAssertFalse(item.isEmpty)
      expectation.fulfill()
    } failure: { error in
      XCTFail("Error in model test")
      expectation.fulfill()

    }

  }
  func test_api_is_valid() {
    let expectation = self.expectation(description: "ready")
    membershipApi.getShareList(query: "ios") { result in
      XCTAssertFalse(result.isEmpty)
      expectation.fulfill()
    } failure: { error in
      XCTFail("Error in apo test")
      expectation.fulfill()
    }
    self.waitForExpectations(timeout: 5, handler: nil)
  }

}
