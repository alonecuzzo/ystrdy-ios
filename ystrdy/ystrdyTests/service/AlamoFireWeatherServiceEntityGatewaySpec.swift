//
//  WeatherServiceEntityGatewaySpec.swift
//  ystrdy
//
//  Created by Jabari Bell on 12/22/14.
//  Copyright (c) 2014 tobros. All rights reserved.
//

import Foundation
import CoreLocation
import Nimble
import Quick

class AlamoFireWeatherServiceEntityGatewaySpec: QuickSpec {
    
    
    override func spec() {
        
        class MockWeatherServiceEntityGateway: AlamoFireWeatherServiceEntityGateway {
            
            //MARK: mock functions
            func mock_requestDidComplete() {
                let data = NSData()
                super.requestDidComplete(data)
            }
            
            func mock_requestDidFail() {
                let error = NSError()
                super.requestDidFail(error)
            }
        }
        
        let mockService = MockWeatherServiceEntityGateway()
        let location = CLLocation(latitude: 1, longitude: 33)
        
        describe("when fetching a weather result") {
            
            it("should call the completion block on success") {
                var completionWasCalled = false
                mockService.fetchData(location, completionBlock: { (json) -> () in
                    completionWasCalled = true
                }, errorBlock: { (error) -> () in
                    //nothing
                })
                mockService.mock_requestDidComplete()
                expect(completionWasCalled).to(equal(true))
            }
            
            it("should call the error block on a bad response") {
                var errorWasCalled = false
                mockService.fetchData(location, completionBlock: { (json) -> () in
                    //nothing
                }, errorBlock: { (error) -> () in
                   errorWasCalled = true
                })
                mockService.mock_requestDidFail()
                expect(errorWasCalled).to(equal(true))
            }
        }
        
        
    }
}
