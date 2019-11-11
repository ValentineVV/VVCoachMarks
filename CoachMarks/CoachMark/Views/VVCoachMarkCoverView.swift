//
//  VVCoachMarkCoverView.swift
//  CoachMarks
//
//  Created by Valiantsin Vasiliavitski on 11/5/19.
//  Copyright © 2019 Valiantsin Vasiliavitski. All rights reserved.
//

import Foundation
import UIKit

class VVCoachMarkCoverView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }
    
    private func configureUI() {
        backgroundColor = .darkGray
        alpha = 0.8
        guard let window = UIApplication.shared.windows.first else { return }
        frame = window.frame
    }
    
    func setMask(with hole: CGRect) {

        let mutablePath = CGMutablePath()
        mutablePath.addRect(bounds)
        mutablePath.addRect(hole)

        let mask = CAShapeLayer()
        mask.path = mutablePath
        mask.fillRule = .evenOdd

        layer.mask = mask
    }
    
}
