//
//  ViewController.swift
//  CoachMarks
//
//  Created by Valiantsin Vasiliavitski on 11/5/19.
//  Copyright © 2019 Valiantsin Vasiliavitski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var customBodyButton: UIButton!
    @IBOutlet weak var roundedCornersButton: UIButton!
    @IBOutlet weak var customArrowButton: UIButton!
    
    private var isCustomBody = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
        }

    @IBAction func didTapButton(_ sender: Any) {
        let coachMarkManager = VVCoachMarkManager.shared
        coachMarkManager.delegate = nil
        let coachMark = VVCoachMark(for: button, in: view, coachMarkPosition: .topCenter, message: "Default coah mark.")
        coachMarkManager.showCoachMark(coachMark)
    }
    
    @IBAction func didTapYellowButton(_ sender: Any) {
        let coachMarkManager = VVCoachMarkManager.shared
        coachMarkManager.delegate = nil
        let coachMark = VVCoachMark(for: yellowButton, in: view, coachMarkPosition: .topRight, message: "Coach mark with yellow background.")
        let preferences = VVCoachMarkPreferences(textColor: .black, textFont: nil, coachMarkColor: .yellow)
        coachMarkManager.showCoachMark(coachMark, preferences: preferences)
    }
    
    @IBAction func didTapCustomBodyButton(_ sender: Any) {
        isCustomBody = true
        let coachMarkManager = VVCoachMarkManager.shared
        coachMarkManager.delegate = self
        let coachMark = VVCoachMark(for: customBodyButton, in: view, coachMarkPosition: .topLeft, message: "Coach mark with custom body.")
        coachMarkManager.showCoachMark(coachMark)
    }
    
    @IBAction func didTapRoundedCornersButton(_ sender: Any) {
        let coachMarkManager = VVCoachMarkManager.shared
        coachMarkManager.delegate = nil
        let coachMark = VVCoachMark(for: roundedCornersButton, in: view, coachMarkPosition: .bottomLeft, message: "Coach mark with rounded corners.")
        let preferences = VVCoachMarkPreferences(cornerRadius: 12, textColor: nil, textFont: nil, coachMarkColor: .purple)
        coachMarkManager.showCoachMark(coachMark, preferences: preferences)
    }
    
    @IBAction func didTapCustomArrowButton(_ sender: Any) {
        isCustomBody = false
        let coachMarkManager = VVCoachMarkManager.shared
        coachMarkManager.delegate = self
        let coachMark = VVCoachMark(for: customArrowButton, in: view, coachMarkPosition: .bottomRight, message: "Coach mark with custom arrow.")
        coachMarkManager.showCoachMark(coachMark)
    }
    
}

extension ViewController: VVCoachMarkManagerDelegate {

    func viewForCoachMarkBody() -> UIView? {
        return isCustomBody ? UIImageView(image: UIImage(named: "1.jpg")) : nil
    }

    func viewForCoachMarkArrow() -> UIView? {
        return !isCustomBody ? UIImageView(image: #imageLiteral(resourceName: "arrow")) : nil
    }
}

