//
//  WeatherServiceEntityGateway.swift
//  ystrdy
//
//  Created by Jabari Bell on 12/22/14.
//  Copyright (c) 2014 tobros. All rights reserved.
//

import CoreLocation

typealias CompletionBlock = (json: String) -> ()
typealias ErrorBlock = (error: NSError) -> ()

protocol WeatherServiceEntityGateway {
    
    var completionBlock: CompletionBlock? { get }
    var errorBlock: ErrorBlock? { get }
    
    func fetchData(location: CLLocation, completionBlock:CompletionBlock, errorBlock:ErrorBlock)
}
