//
//  URLS.swift
//  KeepTruckinAssignment
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import Foundation

///This contains the base URL and the corresponding feature URLs
struct URLS{
    struct Domains {
        static let PROD = "https://secure.geonames.org/"
    }
    static var BASE_URL = Domains.PROD
    
    struct SearchFeature {
        static let getSearchResult = "searchJSON"
    }
}
