//
//  VVCoachMarkArrowView.swift
//  CoachMarks
//
//  Created by Valiantsin Vasiliavitski on 11/5/19.
//  Copyright © 2019 Valiantsin Vasiliavitski. All rights reserved.
//

import Foundation
import UIKit

class VVCoachMarkArrowView: UIView {
    
    var arrowPosition: VVCoachMarkArrowPosition!
    
    func initialize(arrowPosition: VVCoachMarkArrowPosition) {
        self.arrowPosition = arrowPosition
    }
    
    override func draw(_ rect: CGRect) {
        let trianglePath = UIBezierPath()
        
        switch arrowPosition {
        case .bottomLeft, .bottomCenter, .bottomRight:
            trianglePath.move(to: .zero)
            trianglePath.addLine(to: CGPoint(x: frame.width / 2, y: frame.height))
            trianglePath.addLine(to: CGPoint(x: frame.width, y: 0))
        case .topLeft, .topRight, .topCenter:
            trianglePath.move(to: CGPoint(x: 0, y: frame.height))
            trianglePath.addLine(to: CGPoint(x: frame.width / 2, y: 0))
            trianglePath.addLine(to: CGPoint(x: frame.width, y: frame.height))
        case .none:
            break
        }
        
        trianglePath.close()
        
        let triangleLayer = CAShapeLayer()
        triangleLayer.path = trianglePath.cgPath
        layer.mask = triangleLayer
    }
    
}
