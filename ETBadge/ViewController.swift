//
//  ViewController.swift
//  ETBadge
//
//  Created by Volley on 2017/4/19.
//  Copyright © 2017年 Elegant Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var redDotBtn: UIButton!
    @IBOutlet weak var newStyleBtn: UIButton!
    
    @IBOutlet weak var rightNavBtn: UIButton!
    
    @IBOutlet weak var leftBadgeLabel: UILabel!
    
    @IBOutlet weak var rightUpCornerLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setBadge()
        
    }
    
    private func setBadge() {
        label1.badgeConfig.badgeBgColor = UIColor.yellow
        label1.badgeConfig.badgeTextColor = UIColor.brown
        label1.showBadge(withStyle: .number, value: 100, aniType: .none)
        
        
        
        redDotBtn.showBadge(withStyle: .redDot, value: 1, aniType: .scale)
        
        
        newStyleBtn.showBadge(withStyle: .new, value: 1, aniType: .breathe)
        
        
        rightNavBtn.showBadge(withStyle: .number, value: 5, aniType: .none)
        
        
        
        leftBadgeLabel.badgeConfig.badgeCenterOffset = CGPoint(x: -105, y: 0)
        leftBadgeLabel.showBadge(withStyle: .redDot, value: 1, aniType: .none)
        
        
        rightUpCornerLabel.showBadge(withStyle: .number, value: 200, aniType: .none)
    }

    @IBAction func clearBadge(_ sender: UIButton) {
        
        label1.clearBadge()
        redDotBtn.clearBadge()
        newStyleBtn.clearBadge()
        rightNavBtn.clearBadge()
        leftBadgeLabel.clearBadge()
        rightUpCornerLabel.clearBadge()
    }
    
    @IBAction func showBadge(_ sender: Any) {
        
        setBadge()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

