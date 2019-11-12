//
//  VVCoachMarkManagerDelegate.swift
//  CoachMarks
//
//  Created by Valiantsin Vasiliavitski on 11/5/19.
//  Copyright © 2019 Valiantsin Vasiliavitski. All rights reserved.
//

import Foundation
import UIKit

public protocol VVCoachMarkManagerDelegate {
    func viewForCoachMarkBody() -> UIView?
    func viewForCoachMarkArrow() -> UIView?
}

public extension VVCoachMarkManagerDelegate {
    func viewForCoachMarkBody() -> UIView? {
        return nil
    }
    
    func viewForCoachMarkArrow() -> UIView? {
        return nil
    }
}
