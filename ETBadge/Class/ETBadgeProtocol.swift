//
//  ETBadgeProtocol.swift
//  ETBadge
//
//  Created by hys on 2017/4/17.
//  Copyright © 2017年 mmc. All rights reserved.
//

import Foundation
import UIKit

public enum ETBadgeStyle {
    case redDot
    case number
    case new
}

public enum ETBadgeAnimType {
    case none
    case scale
    case breathe
}

public enum ETAxis {
    case X(String)
    case Y(String)
    case Z(String)
}

protocol ETBadgeProtocol {
    var badge: UILabel {get set}
    var badgeConfig: ETBadgeConfigure {get set}
    
    func showBadge()
    func showBadge(withStyle style: ETBadgeStyle, value: Int, aniType: ETBadgeAnimType)
    func clearBadge()
}

extension CAAnimation {
    
    open class func opacityForever_Animation(time: Double) -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.1
        animation.autoreverses = true
        animation.duration = time
        animation.repeatCount = FLT_MAX
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.fillMode = kCAFillModeForwards
        
        return animation
    }
    
    open class func opacityTimes_Animation(_ repeatTimes: Float, _ durTime: Double) -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1.0
        animation.toValue = 0.4
        animation.repeatCount = repeatTimes
        animation.duration = durTime
        animation.isRemovedOnCompletion = false
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.autoreverses = true
        
        return animation
    }
    
    open class func rotation(dur: Double, degree: Double, direction: ETAxis, repeatCount: Float) -> CABasicAnimation {
        
        var axis: String
        
        switch direction {
            
        case let .X(r_axis):
            axis = r_axis
            
        case let .Y(r_axis):
            axis = r_axis
            
        case let .Z(r_axis):
            axis = r_axis
        }
        
        let animation = CABasicAnimation(keyPath: axis)
        animation.fromValue = 0
        animation.toValue = degree
        animation.duration = dur
        animation.autoreverses = false
        animation.isCumulative = true
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.repeatCount = repeatCount
        
        return animation
    }
    
    open class func scale(fromScale: Double, toScale: Double, durTime: Double, repeatCount: Float) -> CABasicAnimation {
        
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = fromScale
        animation.toValue = toScale
        animation.duration = durTime
        animation.autoreverses = true
        animation.repeatCount = repeatCount
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        return animation
    }
    
    open class func shake_Animation(repeatTimes: Float, dur: Double, forObj obj: CALayer) -> CAKeyframeAnimation {
        
        let originPosition = obj.position
        let originSize = obj.bounds.size
        
        let offset = originSize.width / 4.0
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.repeatCount = repeatTimes
        animation.duration = dur
        animation.fillMode = kCAFillModeForwards
        animation.values = [originPosition,
                            CGPoint(x: originPosition.x - offset, y: originPosition.y),
                            originPosition,
                            CGPoint(x: originPosition.x + offset, y: originPosition.y),
                            originPosition]
        
        return animation
    }
    
    open class func bounc_Animation(repeatTimes: Float, dur: Double, forObj obj: CALayer) -> CAKeyframeAnimation {
        
        let origin_p = obj.position
        let origin_s = obj.bounds.size
        
        let offset = origin_s.height / 4.0
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.repeatCount = repeatTimes
        animation.duration = dur
        animation.fillMode = kCAFillModeForwards
        animation.values = [origin_p,
                            CGPoint(x: origin_p.x, y: origin_p.y-offset),
                            origin_p,
                            CGPoint(x: origin_p.x, y: origin_p.y+offset),
                            origin_p]
        
        return animation
    }
}
