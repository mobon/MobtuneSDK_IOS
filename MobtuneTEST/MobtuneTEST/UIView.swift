//
//  UIView.swift
//  MobtuneTEST
//
//  Created by DoHyoung Kim on 2021/12/20.
//

import Foundation
import UIKit

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    func getPosition(space : CGFloat) -> CGPoint {
        var point = CGPoint.zero
        
        point.x = frame.origin.x + frame.size.width + space
        point.y = frame.origin.y + frame.size.height + space
        
        return point
    }
}

