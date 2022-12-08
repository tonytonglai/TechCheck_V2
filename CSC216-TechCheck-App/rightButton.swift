//
//  rightButton.swift
//  CSC216-TechCheck-App
//
//  Created by Tony Lai on 7/12/2022.
//

import UIKit

protocol ScreenDelegate {
    func didHitNext(currStage:Int, problemSelection:String)
    // what things am I passing in? WTF?
}
class rightButton: UIButton {
    var delegate: ScreenDelegate?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
