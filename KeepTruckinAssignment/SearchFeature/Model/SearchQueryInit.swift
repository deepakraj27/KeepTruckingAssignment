//
//  SearchQueryInit.swift
//  KeepTruckinAssignment
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import Foundation

class SearchQueryInit: Codable{
    var name_startsWith: String?
    var maxRows: String?
    var username: String?
    
    init(name_startsWith: String?) {
        self.name_startsWith = name_startsWith
        self.maxRows = "10"
        self.username = "keep_truckin"
    }
}

extension SearchQueryInit{
    var dictionary: [String: AnyObject]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: AnyObject] }
    }
}
