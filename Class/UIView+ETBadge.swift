//
//  UIView+ETBadge.swift
//  ETBadge
//
//  Created by Volley on 2017/4/18.
//  Copyright © 2017年 Elegant Team. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

public struct ETBadgeConfigure {
    var badgeFont: UIFont = UIFont.boldSystemFont(ofSize: 10)
    var badgeBgColor: UIColor = UIColor.red
    var badgeTextColor: UIColor = UIColor.white
    var aniType: ETBadgeAnimType = .none
    var badgeCenterOffset: CGPoint = CGPoint.zero
    var badgeStyle: ETBadgeStyle = .redDot
    var badgeMaximumBadgeNumber: Int = 99
    
    var badgeRedDotWidth: CGFloat = 8
    var badgeTextMargin: CGFloat = 6
    var badgeBounds: CGSize = CGSize(width: 16, height: 16)
}

extension UIView {
    
    fileprivate struct BadgeAssociatedKeys {
        static var et_badgeLabelKey = "et_badgeLabelKey"
        static var et_badgeConfigKey = "et_badgeConfigKey"
        static var et_badgeCustomSuperViewKey = "et_badgeCustomSuperViewKey"
        
        static var kBadgeBreatheAniKey = "breathe"
        static var kBadgeShakeAniKey = "shake"
        static var kBadgeScaleAniKey = "scale"
        static var kBadgeBounceAniKey = "bounce"
    }
    
    public var badge: UILabel {
        
        get {
            guard let label = objc_getAssociatedObject(self, &BadgeAssociatedKeys.et_badgeLabelKey) as? UILabel else {
                
                let origin = UILabel()
                objc_setAssociatedObject(self, &BadgeAssociatedKeys.et_badgeLabelKey, origin, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return origin
            }
            
            return label
        }

        set(label) {
            objc_setAssociatedObject(self, &BadgeAssociatedKeys.et_badgeLabelKey, label, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public var badgeConfig: ETBadgeConfigure {
        
        get {
            guard let config = objc_getAssociatedObject(self, &BadgeAssociatedKeys.et_badgeConfigKey) as? ETBadgeConfigure else {
                
                let origin = ETBadgeConfigure()
                objc_setAssociatedObject(self, &BadgeAssociatedKeys.et_badgeConfigKey, origin, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return origin
            }
            
            return config
        }
        
        set(config) {
            objc_setAssociatedObject(self, &BadgeAssociatedKeys.et_badgeConfigKey, config, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate func badgeSetup() {
        
        badge.textAlignment = .center
        badge.backgroundColor = badgeConfig.badgeBgColor
        badge.textColor = badgeConfig.badgeTextColor
        badge.font = badgeConfig.badgeFont
        badge.isHidden = false
        
        badge.layer.cornerRadius = badgeConfig.badgeRedDotWidth/2.0
        badge.layer.masksToBounds = true
        
        badge.layer.shouldRasterize = true
        badge.layer.rasterizationScale = UIScreen.main.scale
        
        guard badge.superview == nil else {
            return
        }
        
        let super_view: UIView = self
        super_view.addSubview(badge)
        super_view.bringSubview(toFront: badge)
        
        badge.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(badgeConfig.badgeRedDotWidth/2.0 + badgeConfig.badgeCenterOffset.x)
            make.top.equalTo(self).offset(-badgeConfig.badgeRedDotWidth/2.0 + badgeConfig.badgeCenterOffset.y)
            make.width.equalTo(badgeConfig.badgeRedDotWidth)
            make.height.equalTo(badgeConfig.badgeRedDotWidth)
        }
    }
    
    fileprivate func adjustBadgeWidth() {
        
        let str = NSString(string: badge.text ?? "")
        let font = badge.font!
        
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = .byWordWrapping
        
        let size = str.boundingRect(with: CGSize(width: 100, height: 100),
                                    options: [.usesLineFragmentOrigin, .usesFontLeading],
                                    attributes: [NSFontAttributeName: font,
                                                 NSParagraphStyleAttributeName: style],
                                    context: nil)
        
        let width = max(badgeConfig.badgeBounds.width, badgeConfig.badgeTextMargin + size.width)
        let height = max(badgeConfig.badgeBounds.height, 2.0+size.height)
        
        badge.layer.cornerRadius = height/2.0
        
        badge.snp.updateConstraints { (update) in
            update.width.equalTo(width)
            update.height.equalTo(height)
            update.right.equalTo(self).offset(width/2.0 + badgeConfig.badgeCenterOffset.x)
            update.top.equalTo(self).offset(-height/2.0 + badgeConfig.badgeCenterOffset.y)
        }
    }
    
    fileprivate func beginAnimation() {
        
        switch badgeConfig.aniType {
        case .breathe:
            badge.layer.add(CAAnimation.opacityForever_Animation(time: 1.4), forKey: BadgeAssociatedKeys.kBadgeBreatheAniKey)
            
        case .scale:
            badge.layer.add(CAAnimation.scale(fromScale: 1.4, toScale: 0.6, durTime: 1, repeatCount: FLT_MAX), forKey: BadgeAssociatedKeys.kBadgeScaleAniKey)
            
        case .none:
            break
        }
        
    }
    
    fileprivate func removeAnimation() {
        
        badge.layer.removeAllAnimations()
    }
    
    fileprivate func showRedDotBadge() {
        
        badgeSetup()
        badge.isHidden = false
    }
    
    fileprivate func showNewBadge() {
        
        badgeSetup()
        badge.text = "new"
        adjustBadgeWidth()
        badge.isHidden = false
    }
    
    fileprivate func showBadge(withValue value: Int) {
        
        guard value > 0 else {
            return
        }
        
        badgeSetup()
        badge.text = value > badgeConfig.badgeMaximumBadgeNumber ? "\(badgeConfig.badgeMaximumBadgeNumber)+" : "\(value)"
        adjustBadgeWidth()
        badge.isHidden = false
    }
    
    
    open func showBadge(withStyle style: ETBadgeStyle, value: Int, aniType: ETBadgeAnimType) {
        
        badgeConfig.aniType = aniType
        badgeConfig.badgeStyle = style
        
        switch style {
        case .redDot:
            showRedDotBadge()
            
        case .new:
            showNewBadge()
            
        case .number:
            showBadge(withValue: value)
        }
        
        print(badge.frame)
        
        removeAnimation()
        beginAnimation()
    }
    
    open func showBadge() {
        showBadge(withStyle: .redDot, value: 0, aniType: .none)
    }
    
    open func clearBadge() {
        badge.isHidden = true
    }
    
    open func resumeBadge() {
        badge.isHidden = false
    }
}

extension UIView: ETBadgeProtocol {}
