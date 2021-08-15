//
//  ViewSearchResultLayout.swift
//  KeepTruckinAssignment
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import UIKit

class ViewSearchResultLayout: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var titleLabelHeightConstraints: NSLayoutConstraint!
    @IBOutlet weak var subtitleLabelHeightConstraints: NSLayoutConstraint!    
    
    @IBOutlet weak var viewtopConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewRightConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var spacingBetweenTitleSubtitle: NSLayoutConstraint!
    @IBOutlet weak var spacingBetweenSubtitleDescription: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initialize(_ viewModel : SearchResultViewModel?){
        if let viewModel = viewModel{
            self.titleLabel.attributedText = viewModel.componentTitle
            self.subTitleLabel.attributedText = viewModel.componentSubtitle
            self.descriptionLabel.attributedText = viewModel.componentDescription
            
            self.titleLabelHeightConstraints.constant = viewModel.titleHeight
            self.subtitleLabelHeightConstraints.constant = viewModel.footerHeight
            
            self.viewLeftConstraint.constant = viewModel.parentPadding.left
            self.viewRightConstraint.constant = viewModel.parentPadding.right
            self.viewtopConstraint.constant = viewModel.parentPadding.top
            self.viewBottomConstraint.constant = viewModel.parentPadding.bottom
            
            self.spacingBetweenTitleSubtitle.constant = viewModel.innerItemSpacing
            self.spacingBetweenSubtitleDescription.constant = viewModel.innerItemSpacing
        }
    }
}
