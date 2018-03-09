//
//  WishlistTests.swift
//  iOS-MS-ClientTests
//
//  Created by Nazar Gorobets on 1/11/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import XCTest

class WishlistTests: XCTestCase {
    
    var client: SMClient!
    
    override func setUp() {
        super.setUp()
        client = SMClient(gatewayUrl: BASE_URL,
                          clientId: "api_demo_user",
                          secretKey: "demo_pass")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
//    func testAdd() {
//        let exp = self.expectation(description: "testAddToWishList")
//        self.client.wishlist.addToWishList(userId: "5", objectId: "6457", entity: "products") { (item, error) in
//            XCTAssertNil(error)
//            XCTAssertNotNil(item?.data?.first?.id)
//            exp.fulfill()
//        }
//
//        wait(for: [exp], timeout: 15)
//    }
//
    func testAddToWishList() {
        
        let exp = self.expectation(description: "testAddToWishList")
        
        let predicate = Predicate(field: "id", op: .equal, value: "6457")
        self.client.products.filter(predicate: predicate).first { (product, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(product!.data!.first!.id)
            let id = product!.data!.first!.id!
            self.client.wishlist.addToWishList(userId: "5", objectId: id, entity: "products") { (item, error) in
                XCTAssertNil(error)
                self.client.wishlist.removeFromWishList(objectId: "6457", entity: "products") { (isSuccess, error) in
                    XCTAssertNil(error)
                    XCTAssertNotNil(isSuccess)
                    XCTAssertTrue(isSuccess ?? false)
                    exp.fulfill()
                }
            }
        }
        
        wait(for: [exp], timeout: 15)
    }
    
    func testGetWishList() {
        let exp = self.expectation(description: "testGetWishList")
        client.wishlist.getWishList(userId: "5", limit: 100, offset: 0) { (items, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(items)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 10)
    }
//
//    func testDelete() {
//        let exp = self.expectation(description: "testDeleteFromWishList")
//        client.wishlist.removeFromWishList(wishlistId: "573") { (issuccess, error) in
//            XCTAssertNotNil(issuccess)
//            XCTAssertTrue(issuccess ?? false)
//            exp.fulfill()
//        }
//
//        wait(for: [exp], timeout: 10)
//    }
    
//    func testDeleteFromWishList() {
//
//        let exp = self.expectation(description: "testDeleteFromWishList")
//        client.wishlist.removeFromWishList(objectId: "6457", entity: "products") { (isSuccess, error) in
//            XCTAssertNil(error)
//            XCTAssertNotNil(isSuccess)
//            XCTAssertTrue(isSuccess ?? false)
//            exp.fulfill()
//        }
//
//        wait(for: [exp], timeout: 10)
//    }
}
