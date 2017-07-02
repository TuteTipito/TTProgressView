//
//  TTCircularProgressView.swift
//  TTProgressView
//
//  Created by Matías Spinelli on 30/6/17.
//  Copyright © 2017 Dalmunc. All rights reserved.
//

import UIKit

class TTCircularProgressView: TTProgressView {

    private var startAngle : CGFloat = 0//CGFloat(Double.pi)
    private var endAngle : CGFloat = CGFloat(2 * Double.pi)//CGFloat(Double.pi + (2 * Double.pi))
    
    private var centerLayer : CGPoint = CGPoint(x: 0, y: 0)
    private var radiusLayer : CGFloat = 0.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        centerLayer = CGPoint(x: bounds.midX, y: bounds.midY)
        radiusLayer = min(bounds.width, bounds.height) / 2 - progressLayer.lineWidth / 2
        
        let arcPath = UIBezierPath(arcCenter: CGPoint.zero, radius: radiusLayer, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        progressLayer.position = centerLayer
        progressLayer.path = arcPath.cgPath
        
        progressLayer.strokeStart = 0.0
        progressLayer.strokeEnd = CGFloat(self.progress)
        
        backgroundLayer.position = centerLayer
        backgroundLayer.path = arcPath.cgPath
        
        backgroundLayer.strokeStart = 0.0
        backgroundLayer.strokeEnd = 1.0
    }
    
    
    /* --------------------------
     0.5π = 90  = 0.25
     1 π  = 180 = 0.5
     1.5π = 270 = 0.75
     2 π  = 360 = 1
     
     x = numero * π / 0.5
     -------------------------- */
    
}
