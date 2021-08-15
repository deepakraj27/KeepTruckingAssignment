//
//  PageViewModel.swift
//  KeepTruckinAssignment
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import Foundation
import UIKit

extension PageViewModel{
    fileprivate struct PageViewModelConstants{
        static let titleFont: UIFont = UIFont.setupFont(14.0)
        static let subTitleFont: UIFont = UIFont.setupFont(18.0)

        static let placeHolderText = "Enter search terms here"
        static let noSearchResults = "Please start your search to show the results here."
        static let searchText = "Search"
        
        static let titleColor = "#adadad"
        static let noSearchTextColor = "#000000"
        static let searchButtonColor = "#7da9d3"
    }
}

class PageViewModel{
    //MARK:- Properties of VM
    var searchButtonText: NSAttributedString? = nil
    var componentPlaceholderText: NSAttributedString? = nil
    var componentNoSearchText: NSAttributedString? = nil

    //MARK:- Initialize VM
    init(){
        //set the titleValue and set the initialview value here
        if !PageViewModelConstants.searchText.isEmpty{
            self.searchButtonText =
                Helper.getAttributedText(text: PageViewModelConstants.searchText, color: PageViewModelConstants.searchButtonColor, alignment: .center, font: PageViewModelConstants.titleFont)
        }
        
        if !PageViewModelConstants.placeHolderText.isEmpty{
            self.componentPlaceholderText =
                Helper.getAttributedText(text: PageViewModelConstants.placeHolderText, color: PageViewModelConstants.titleColor, alignment: .left, font: PageViewModelConstants.titleFont)
        }
        
        if !PageViewModelConstants.noSearchResults.isEmpty{
            self.componentNoSearchText =
                Helper.getAttributedText(text: PageViewModelConstants.noSearchResults, color: PageViewModelConstants.noSearchTextColor, alignment: .center, font: PageViewModelConstants.subTitleFont)
        }
        
    }
    
    //MARK:- API call for Search Term
    /// Get search results api with query - searchTerm, max rows and username = "keeptruckin"
    func getSearchResults(_ searchTerm: String?, _ completion: @escaping(_ viewModels: [SearchResultViewModel]?, _ error: NSError?) -> ()){
        
        guard let queryParams = SearchQueryInit(name_startsWith: searchTerm).dictionary else {return}
        
        NetworkManager.sharedInstance.requestData(url: SearchRouter.getSearchResults(queryParams: queryParams)){
            (result: Result<SearchResponseResult,Error>) in
            switch result{
            case .success(let searchResponse):
                if let count = searchResponse.totalResultsCount, count > 0, let geonames = searchResponse.geonames{
                    var resultsVMs = [SearchResultViewModel]()
                    for each in geonames{
                        resultsVMs.append(SearchResultViewModel(each))
                    }
                    completion(resultsVMs, nil)
                }
            case .failure(let error):
                completion(nil, error as NSError)
            }
        }
    }
    
}
