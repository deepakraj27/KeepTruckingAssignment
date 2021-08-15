//
//  SearchResponseResult.swift
//  KeepTruckinAssignment
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import Foundation

class SearchResponseResult: Codable{
    var totalResultsCount: Double?
    var geonames: [GeoNames]?
}


