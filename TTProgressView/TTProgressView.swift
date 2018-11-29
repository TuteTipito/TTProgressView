//
//  TTProgressView.swift
//  TTProgressView
//
//  Created by Matías Spinelli on 30/6/17.
//  Copyright © 2017 Dalmunc. All rights reserved.
//

import UIKit

@IBDesignable
class TTProgressView: UIView {
    
    @IBInspectable public private(set) var lineWidth : CGFloat = 4.0
    
    @IBInspectable public private(set) var backgroundPathColor : UIColor = UIColor.lightGray
    @IBInspectable public private(set) var pathColor : UIColor = UIColor.blue
    
    @IBInspectable public private(set) var progress : Double = 0.0
    
    public private(set) var progressLayer = CAShapeLayer()
    public private(set) var backgroundLayer = CAShapeLayer()
    
    override init(frame : CGRect) {
        super.init(frame : frame)
        commonInit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder : aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundLayer.lineWidth = lineWidth
        progressLayer.lineWidth = lineWidth
        backgroundLayer.strokeColor = backgroundPathColor.cgColor
        progressLayer.strokeColor = pathColor.cgColor
        backgroundLayer.fillColor = nil
        progressLayer.fillColor = nil
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(progressLayer)
    }
    
    //MARK: - Setters
    
    func set(pathColor : UIColor) {
        self.pathColor = pathColor
        progressLayer.strokeColor = pathColor.cgColor
    }
    
    func set(backgroundPathColor : UIColor) {
        self.backgroundPathColor = backgroundPathColor
        backgroundLayer.strokeColor = backgroundPathColor.cgColor
    }
    
    func set(lineWidth : CGFloat) {
        self.lineWidth = lineWidth
        progressLayer.lineWidth = lineWidth
        backgroundLayer.lineWidth = lineWidth
    }
    
    
    func startRotation() {
        progressLayer.add(rotate360(), forKey: "rotation")
    }

    func stopRotation() {
        progressLayer.removeAnimation(forKey: "rotation")
    }
    
    
    func set(progress : Double) {
        
        progressLayer.removeAnimation(forKey: "strokeAnimation")
        
        if self.progress+progress <= 1.0  && self.progress+progress >= 0.0 {
            
            progressLayer.strokeStart = 0.0
            
            self.progress = self.progress+progress
            
            progressLayer.strokeEnd = CGFloat(self.progress)
            
            progressLayer.add(strokeAnimation(animation: StrokeAnimation.end, from: CGFloat(self.progress-progress), to: progressLayer.strokeEnd, duration: 0.5), forKey: "strokeAnimation")
            
        } else {
            
            if self.progress+progress < 0.0 {
                
                let newProgress = self.progress+progress
                
                progressLayer.strokeStart = 0.0
                progressLayer.strokeEnd = 0.0
                
                progressLayer.add(strokeAnimation(animation: StrokeAnimation.end, from: CGFloat(self.progress), to: progressLayer.strokeEnd, duration: 0.5), forKey: "strokeAnimation")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    self.progress = 1.0
                    self.set(progress: newProgress)
                })
                
            } else {
                
                let newProgress = (self.progress+progress)-1.0
                
                progressLayer.strokeStart = 0.0
                progressLayer.strokeEnd = 1.0
                
                progressLayer.add(strokeAnimation(animation: StrokeAnimation.end, from: CGFloat(self.progress), to: progressLayer.strokeEnd, duration: 0.5), forKey: "strokeAnimation")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                    
                    self.progressLayer.strokeStart = 1.0
                    
                    self.progressLayer.removeAnimation(forKey: "strokeAnimation")
                    
                    self.progress = 0.0
                    
                    self.progressLayer.add(self.strokeAnimation(animation: StrokeAnimation.start, from: 0.0, to: 1.0, duration: 0.5), forKey: "strokeAnimation")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        self.set(progress: newProgress)
                    })
                })
                
            }
        }
    }
}

extension TTProgressView {
    
    enum StrokeAnimation : String {
        case start = "strokeStart"
        case end = "strokeEnd"
    }
    
    enum TransformAnimation : String {
        case rotation = "transform.rotation"
    }
    
    func strokeAnimation(animation keyPathValue: StrokeAnimation, from fromValue: CGFloat, to toValue: CGFloat, duration durationValue: Double) -> CAAnimation {
        
        let animation = CABasicAnimation(keyPath: keyPathValue.rawValue)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = durationValue
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        
        return animation
    }

    func rotate360() -> CAAnimation {
        
        let rotation : CABasicAnimation = CABasicAnimation(keyPath:TransformAnimation.rotation.rawValue)
        
        rotation.duration = 0.5
//        rotation.isRemovedOnCompletion = false
//        rotation.repeatCount = HUGE
//        rotation.fillMode = kCAFillModeForwards
        rotation.fromValue = 0.0
        rotation.toValue =
            CGFloat.pi * 2
//        rotation.duration = 0.5
        rotation.repeatCount = 50000
//        rotation.isCumulative = true
//        rotation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        rotation.autoreverses = true
//        rotation.repeatCount = 5
        rotation.fillMode = CAMediaTimingFillMode.forwards
        
        return rotation
    }
    
}
