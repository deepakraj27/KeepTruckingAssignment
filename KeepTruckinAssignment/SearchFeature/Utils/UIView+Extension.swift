//
//  UIView+Extension.swift
//  KeepTruckinAssignment
//
//  Created by Deepakraj Murugesan on 15/08/21.
//

import Foundation
import UIKit

//MARK:- Show loader for UIVIEW
extension UIView{
    func showLoader(){
        self.isUserInteractionEnabled = false
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.tag = 12345
        activityIndicator.frame = CGRect(x: self.frame.origin.x + self.frame.size.width/2,y: self.frame.origin.y +  self.frame.size.height/2, width: 26, height: 26)
        self.addSubview(activityIndicator)
        activityIndicator.color = Helper.hexString("#808080")
        activityIndicator.startAnimating()
    }
    
    func removeloader(){
        self.isUserInteractionEnabled = true
        if let  activityIndicator = self.viewWithTag(12345) as? UIActivityIndicatorView{
            activityIndicator.removeFromSuperview()
        }
    }
}
