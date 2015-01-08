//
//  AlamoFireWeatherServiceEntityGateway.swift
//  ystrdy
//
//  Created by Jabari Bell on 12/22/14.
//  Copyright (c) 2014 tobros. All rights reserved.
//

import Foundation
import CoreLocation

class AlamoFireWeatherServiceEntityGateway: WeatherServiceEntityGateway {
    
    var completionBlock: CompletionBlock?
    var errorBlock: ErrorBlock?
    
    init() {
        
    }
    
    func fetchData(location: CLLocation, completionBlock: CompletionBlock, errorBlock: ErrorBlock) {
        self.completionBlock = completionBlock
        self.errorBlock = errorBlock
        
        //call our fetching code here
        //how to invoke the request did complete though indirectly?
        //UGGGGGGH FUCK THIS SHIT
        // the fetch doesn't call this though, we should have a function that calls the request did complete doh
    }
    
    //MARK: return functions
    func requestDidComplete(data: NSData) -> () {
        let json = NSString(data: data, encoding: NSUTF8StringEncoding)
        self.completionBlock!(json: json!)
    }
    
    func requestDidFail(error: NSError) -> () {
        self.errorBlock!(error: error)
    }
}
