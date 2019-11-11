//
//  VVCoachMark.swift
//  CoachMarks
//
//  Created by Valiantsin Vasiliavitski on 11/5/19.
//  Copyright © 2019 Valiantsin Vasiliavitski. All rights reserved.
//

import Foundation
import UIKit

struct VVCoachMark {
    
    let anchorView: UIView
    let viewToShow: UIView
    let arrowPosition: VVCoachMarkArrowPosition
    let message: String
    
    init(for anchorView: UIView, in view: UIView, coachMarkPosition: VVCoachMarkPosition, message: String) {
        self.anchorView = anchorView
        self.viewToShow = view
        self.arrowPosition = VVCoachMarkArrowPosition.arrowPositionByCoachMarkPosition(coachMarkPosition)
        self.message = message
    }
    
}
