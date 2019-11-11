//
//  VVCoachMarkView.swift
//  CoachMarks
//
//  Created by Valiantsin Vasiliavitski on 11/5/19.
//  Copyright © 2019 Valiantsin Vasiliavitski. All rights reserved.
//

import Foundation
import UIKit

class VVCoachMarkView: UIView {
    
    var label: UILabel!
    
    var message: String!
    var anchorView: UIView?
    var preferences: VVCoachMarkPreferences!
    var arrowTopPoint: CGPoint!
    var arrowPosition: VVCoachMarkArrowPosition!
    
    var customBody: UIView?
    var customArrow:UIView?
    
    func initialize(message: String, anchorView: UIView, arrowPosition: VVCoachMarkArrowPosition, preferences: VVCoachMarkPreferences, customBody: UIView? = nil, customArrow: UIView? = nil) {
        self.message = message
        self.anchorView = anchorView
        self.preferences = preferences
        self.customBody = customBody
        self.customArrow = customArrow
        self.arrowPosition = arrowPosition
        self.configureUI()
    }
    
    private func configureUI() {
        backgroundColor = .clear
        addLabel()
        frame.size = calculateCoachMarkSize()
        frame.origin = evaluateOrigin()
        addBody()
        addArrow()
        bringSubviewToFront(label)
    }
    
    private func calculateCoachMarkSize() -> CGSize {

        let sizeToFit = CGSize(width: preferences.coachMarkWidth - 2 * Constant.inset, height: CGFloat.greatestFiniteMagnitude)
        let textSize = label.sizeThatFits(sizeToFit)
        
        return CGSize(width: textSize.width + 2 * Constant.inset, height: textSize.height + 2 * Constant.inset)
    }
    
    private func addBody() {
        let body: UIView
        if let customBody = customBody {
            body = customBody
            body.layer.cornerRadius = preferences.cornerRadius ?? 0
        } else {
            let coachMarkBody = VVCoachMarkBodyView()
            coachMarkBody.initialize(cornerRadius: preferences.cornerRadius)
            coachMarkBody.backgroundColor = preferences.coachMarkColor ?? .purple
            body = coachMarkBody
        }
        body.clipsToBounds = true
        body.frame.size = frame.size
        addSubview(body)
    }
    
    private func addArrow() {
        let arrow: UIView
        if let customArrow = customArrow {
            arrow = customArrow
        } else {
            let coachMarkArrow = VVCoachMarkArrowView()
            coachMarkArrow.initialize(arrowPosition: arrowPosition)
            coachMarkArrow.backgroundColor = preferences.coachMarkColor ?? .purple
            arrow = coachMarkArrow
        }
        arrow.frame.size = CGSize(width: preferences.arrowWidth, height: preferences.arrowHeight)
        
        switch arrowPosition {
        case .bottomCenter:
            arrow.frame.origin = CGPoint(x: frame.width / 2 - arrow.frame.width / 2, y: frame.height)
        case .topLeft, .topRight:
            arrow.frame.origin = CGPoint(x: arrowTopPoint.x - arrow.frame.width / 2, y: -arrow.frame.height)
        case .topCenter:
            arrow.frame.origin = CGPoint(x: frame.width / 2 - arrow.frame.width / 2, y: -arrow.frame.height)
        case .bottomRight, .bottomLeft:
            arrow.frame.origin = CGPoint(x: arrowTopPoint.x - arrow.frame.width / 2, y: frame.height)
        case .none:
            fatalError("Arrow position must be set!!!")
        }

        addSubview(arrow)
    }
    
    private func addLabel() {
        label = UILabel()
        label.text = message
        label.font = preferences.textFont ?? UIFont.systemFont(ofSize: 12)
        label.textColor = preferences.textColor ?? .white
        label.numberOfLines = 0
        
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.inset).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.inset).isActive = true
    }
    
    private func evaluateOrigin() -> CGPoint {
        guard let rect = anchorView?.superview?.convert(anchorView!.frame, to: nil) else {
            return .zero
        }
        let anchorViewCenterX = rect.midX
        let anchorViewCenterY = rect.midY
        var yPosition: CGFloat = 0
        var xPosition: CGFloat = 0
        switch arrowPosition {
        case .bottomCenter:
            arrowTopPoint = CGPoint(x: frame.width / 2, y: frame.height + preferences.arrowHeight)
            xPosition = anchorViewCenterX - frame.width / 2
            yPosition = anchorViewCenterY - arrowTopPoint.y - anchorView!.frame.height / 2
        case .topLeft:
            arrowTopPoint = CGPoint(x: 2 * Constant.inset, y: -preferences.arrowHeight)
            yPosition = anchorViewCenterY - arrowTopPoint.y + anchorView!.frame.height / 2
            xPosition = anchorViewCenterX - arrowTopPoint.x
        case .topCenter:
            arrowTopPoint = CGPoint(x: frame.width / 2, y: -preferences.arrowHeight)
            xPosition = anchorViewCenterX - frame.width / 2
            yPosition = anchorViewCenterY - arrowTopPoint.y + anchorView!.frame.height / 2
        case .topRight:
            arrowTopPoint = CGPoint(x: frame.width - 2 * Constant.inset, y: -preferences.arrowHeight)
            yPosition = anchorViewCenterY - arrowTopPoint.y + anchorView!.frame.height / 2
            xPosition = anchorViewCenterX - arrowTopPoint.x
        case .bottomRight:
            arrowTopPoint = CGPoint(x: frame.width - 2 * Constant.inset, y: frame.height + preferences.arrowHeight)
            xPosition = anchorViewCenterX - arrowTopPoint.x
            yPosition = anchorViewCenterY - arrowTopPoint.y - anchorView!.frame.height / 2
        case .bottomLeft:
            arrowTopPoint = CGPoint(x: 2 * Constant.inset, y: frame.height + preferences.arrowHeight)
            xPosition = anchorViewCenterX - arrowTopPoint.x
            yPosition = anchorViewCenterY - arrowTopPoint.y - anchorView!.frame.height / 2
        case .none:
            fatalError("Arrow position must be set!!!")
        }
        
        return CGPoint(x: xPosition, y: yPosition)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return false
    }

}
