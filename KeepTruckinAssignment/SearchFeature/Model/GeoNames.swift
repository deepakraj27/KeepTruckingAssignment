//
//  GeoNames.swift
//  KeepTruckinAssignment
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import Foundation

class GeoNames: Codable{
    var adminCode1: String?
    var lat: String?
    var lng : String?
    var geonameId : Double?
    var toponymName :String?
    var countryId: String?
    var fcl: String?
    var population: Double?
    var countryCode: String?
    var name : String?
    var fclName: String?
    var countryName : String?
    var fcodeName: String?
    var adminName1: String?
    var fcode: String?
    
    
    func getCityName() -> String?{
        return name
    }
    
    func getStateName() -> String?{
        return adminName1
    }
    
    func getCountryName() -> String?{
        return countryName
    }
}
