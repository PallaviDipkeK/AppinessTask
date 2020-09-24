//
//  AppinessTaskTests.swift
//  AppinessTaskTests
//
//  Created by mobiotics1067 on 22/09/20.
//  Copyright © 2020 Private. All rights reserved.
//

import XCTest
@testable import AppinessTask

class AppinessTaskTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func getjsonData(){
        let viewModel  : HomeViewModel = HomeViewModel()
        viewModel.getDataFromJson()
    }
    func testIsleapYear(){
         let viewModel  : HomeViewModel = HomeViewModel()
       let isleap =  viewModel.isLeapYear(year: 2000)
        if isleap {
            XCTAssertTrue(isleap, "success")
       }
   }
    func testName(){
         let viewModel  : HomeViewModel = HomeViewModel()
        let inputName = "Name:- Pallavi"
        let testName = viewModel.modifyName(name: "Pallavi")
        XCTAssertEqual(inputName, testName)
    }
    func testDOB(){
         let viewModel  : HomeViewModel = HomeViewModel()
        let inputDOB = "DOB:- 1890/04/21"
        let testDOB = viewModel.modifyDob(dob: "1890/04/21")
        XCTAssertEqual(inputDOB, testDOB)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
