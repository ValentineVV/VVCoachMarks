//
//  VVCoachMarkBodyView.swift
//  CoachMarks
//
//  Created by Valiantsin Vasiliavitski on 11/5/19.
//  Copyright © 2019 Valiantsin Vasiliavitski. All rights reserved.
//

import Foundation
import UIKit

class VVCoachMarkBodyView: UIView {
    
    var cornerRadius: CGFloat?
    
    func initialize(cornerRadius: CGFloat? = .zero) {
        self.cornerRadius = cornerRadius
    }
    
    override func draw(_ rect: CGRect) {

        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: rect.width, height: rect.height), byRoundingCorners: .allCorners, cornerRadii: CGSize(width: cornerRadius ?? .zero, height: cornerRadius ?? .zero))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
        
    }
    
}
