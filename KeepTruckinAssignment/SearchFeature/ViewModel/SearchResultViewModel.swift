//
//  SearchResultViewModel.swift
//  KeepTruckinAssignment
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import Foundation
import UIKit

extension SearchResultViewModel{
    fileprivate struct SearchResultVMConstants{
        static let titleFont: UIFont = UIFont.setupFont(12.0)
        static let subtitleFont: UIFont = UIFont.setupFont(14.0)
        static let desriptionFont: UIFont = UIFont.setupFont(14.0)
        
        static let titleColor = "#5a5a5a"
        static let subtitleColor = "#acacac"
        static let descriptionColor = "#acacac"

        static let initialValue: CGFloat = 0.0
        static let innerItemSpaceValue: CGFloat = 6.0
        
    }
}
class SearchResultViewModel{
    //MARK:- Properties of VM
    var componentTitle: NSAttributedString? = nil
    var componentSubtitle: NSAttributedString? = nil
    var componentDescription: NSAttributedString? = nil

    let parentPadding: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    let innerItemSpacing = SearchResultVMConstants.innerItemSpaceValue
    var widthInPts = SearchResultVMConstants.initialValue
    var titleHeight: CGFloat = SearchResultVMConstants.initialValue
    private var subtitleHeight: CGFloat = SearchResultVMConstants.initialValue
    private var descriptionHeight: CGFloat = SearchResultVMConstants.initialValue
    var footerHeight: CGFloat = SearchResultVMConstants.initialValue
    var heightInPts: CGFloat = SearchResultVMConstants.initialValue
   
    //MARK:- Initialize VM
    /// we have initialized vm and added  ui properties values with height
    init(_ geoName: GeoNames?) {
        self.widthInPts = SCREENWIDTH - (self.parentPadding.left + self.parentPadding.right)
        
        if let geoName = geoName{
            if let title = geoName.getCityName(),!title.isEmpty{
                self.componentTitle =
                    Helper.getAttributedText(text: title, color: SearchResultVMConstants.titleColor, alignment: .left, font: SearchResultVMConstants.titleFont)
            }
            
            if let subtitle = geoName.getStateName(),!subtitle.isEmpty{
                self.componentSubtitle =
                    Helper.getAttributedText(text: subtitle, color: SearchResultVMConstants.subtitleColor, alignment: .left, font: SearchResultVMConstants.subtitleFont)
            }
            
            if let description = geoName.getCountryName(),!description.isEmpty{
                    self.componentDescription =
                        Helper.getAttributedText(text: description + "%", color: SearchResultVMConstants.descriptionColor, alignment: .right, font: SearchResultVMConstants.desriptionFont)
                }
            }
            
            self.calculateHeight()
    }
    
    //MARK:- Calculate Complete Height
    ///All UI elements heights are calcualted as per design doc.
    fileprivate func calculateHeight(){
        self.titleHeight = ceil(Helper.getTextHeight(string: self.componentTitle, width: self.widthInPts))

        let subWidth = CGFloat(ceil((self.widthInPts - innerItemSpacing) / 2))
        self.subtitleHeight = ceil(Helper.getTextHeight(string: self.componentSubtitle, width: subWidth))
        
        self.descriptionHeight = ceil(Helper.getTextHeight(string: self.componentDescription, width: subWidth))

        var innerItemArray = [CGFloat]()
        if titleHeight != 0{
            innerItemArray.append(titleHeight)
        }
        
        //calculate inner text heights
        var innerTextHeights = [CGFloat]()
        innerTextHeights.append(subtitleHeight)
        innerTextHeights.append(descriptionHeight)
        footerHeight = ceil(innerTextHeights.max() ?? 0)
        
        if innerTextHeights.count > 0{
            innerItemArray.append(footerHeight)
        }
        
        if innerItemArray.count > 0{
            let spacing = (CGFloat(innerItemArray.count - 1) * innerItemSpacing)
            let sum = ceil(innerItemArray.reduce(0, +))
            self.heightInPts = ceil(sum + spacing + self.parentPadding.top + self.parentPadding.bottom)
        }
    }
}

