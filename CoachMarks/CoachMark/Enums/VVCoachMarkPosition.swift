//
//  VVCoachMarkPosition.swift
//  CoachMarks
//
//  Created by Valiantsin Vasiliavitski on 11/5/19.
//  Copyright © 2019 Valiantsin Vasiliavitski. All rights reserved.
//

import Foundation

enum VVCoachMarkPosition {
    case topLeft
    case topCenter
    case topRight
    case bottomRight
    case bottomCenter
    case bottomLeft
}

enum VVCoachMarkArrowPosition {
    case topLeft
    case topCenter
    case topRight
    case bottomRight
    case bottomCenter
    case bottomLeft

    static func arrowPositionByCoachMarkPosition(_ coachMarkPosition: VVCoachMarkPosition) -> VVCoachMarkArrowPosition {
        switch coachMarkPosition {
            
        case .topLeft:
            return .bottomRight
        case .topCenter:
            return .bottomCenter
        case .topRight:
            return .bottomLeft
        case .bottomRight:
            return .topLeft
        case .bottomCenter:
            return .topCenter
        case .bottomLeft:
            return .topRight
        }
    }

}
