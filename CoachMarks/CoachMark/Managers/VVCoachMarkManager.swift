//
//  VVCoachMarkManager.swift
//  CoachMarks
//
//  Created by Valiantsin Vasiliavitski on 11/5/19.
//  Copyright © 2019 Valiantsin Vasiliavitski. All rights reserved.
//

import Foundation
import UIKit

public class VVCoachMarkManager {
    
    var delegate: VVCoachMarkManagerDelegate?
    
    private let window = UIApplication.shared.windows.first!
    
    private var gotItButton = UIButton(type: .system)
    private var coverView: VVCoachMarkCoverView!
    private var coachMarkView: VVCoachMarkView!
    private var coachMark: VVCoachMark!
    private var preferences: VVCoachMarkPreferences!
    var isGotItButtonHidden = true
    
    static let shared = VVCoachMarkManager()
    
    private init() {}
    
    func showCoachMark(_ coachMark: VVCoachMark, preferences: VVCoachMarkPreferences = VVCoachMarkPreferences.defaultPreferences) {
        if coachMark.message == "" {
            return
        }
        
        self.coachMark = coachMark
        self.preferences = preferences
        
        addCoverViewForAnchorView(coachMark.anchorView, in: coachMark.viewToShow)
        addCoachMarkForAnchorView(coachMark.anchorView, arrowPosition: coachMark.arrowPosition, message: coachMark.message, preferences: preferences, customCoachMarkBody: delegate?.viewForCoachMarkBody(), customCoachMarkArrow: delegate?.viewForCoachMarkArrow())
        if !isGotItButtonHidden {
            addGotItButton()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeOrientation), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    @objc private func didChangeOrientation() {
        NotificationCenter.default.removeObserver(self)
        if let coachMark = coachMark {
            removeCoachMark(sender: nil)
            showCoachMark(coachMark, preferences: preferences)
        }
    }
    
    private func addCoverViewForAnchorView(_ anchorView: UIView, in view: UIView) {
        coverView = VVCoachMarkCoverView(frame: window.frame)
        coverView.setMask(with: view.convert(anchorView.frame, from: anchorView.superview))
        let gesture = UITapGestureRecognizer(target: self, action: #selector(removeCoachMark(sender:)))
        coverView.addGestureRecognizer(gesture)
        window.addSubview(coverView)
        
        coverView.translatesAutoresizingMaskIntoConstraints = false
        coverView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
        coverView.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        coverView.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        coverView.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
    }
    
    private func addGotItButton() {
        gotItButton.frame = CGRect(x: coverView.frame.midX - 45, y: coverView.frame.height - 75, width: 90, height: 40)
        gotItButton.setTitle("Got it!", for: .normal)
        gotItButton.addTarget(self, action: #selector(removeCoachMark(sender:)), for: .touchUpInside)
        gotItButton.backgroundColor = .systemBlue
        gotItButton.setTitleColor(.white, for: .normal)
        window.addSubview(gotItButton)
    }
    
    private func addCoachMarkForAnchorView(_ anchorView: UIView, arrowPosition: VVCoachMarkArrowPosition, message: String, preferences: VVCoachMarkPreferences, customCoachMarkBody: UIView? = nil, customCoachMarkArrow: UIView? = nil) {
        coachMarkView = VVCoachMarkView()
        coachMarkView.initialize(message: message, anchorView: anchorView, arrowPosition: arrowPosition, preferences: preferences, customBody: customCoachMarkBody, customArrow: customCoachMarkArrow)
        window.addSubview(coachMarkView)
    }
    
    @objc private func removeCoachMark(sender: Any?) {
        coachMarkView.removeFromSuperview()
        coverView.removeFromSuperview()
        gotItButton.removeFromSuperview()
        if let _ = sender {
            coachMark = nil
        }
    }
    
}
