//
//  SearchRouter.swift
//  KeepTruckinAssignment
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import Foundation
import Alamofire

//MARK:- SearchRouter
///This is mainly used for search feature and it contains all the urls with corresponding properties linked to it.
enum SearchRouter: URLRequestConvertible {
    case getSearchResults(queryParams: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .getSearchResults:
            return .get
        }
    }
    
    var path : String{
        switch self {
        case .getSearchResults:
            return URLS.SearchFeature.getSearchResult
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try URLS.BASE_URL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = 60
        
        switch self {
        case .getSearchResults(let queryParams):
            //if auth is present pls add it here...
            urlRequest = try URLEncoding.queryString.encode(urlRequest, with: queryParams)
        default:
            break
        }
        return urlRequest
    }
}
