//
//  TTLinearProgressView.swift
//  TTProgressView
//
//  Created by Matías Spinelli on 30/6/17.
//  Copyright © 2017 Dalmunc. All rights reserved.
//

import UIKit

class TTLinearProgressView: TTProgressView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let path : UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: bounds.midY))
        path.addLine(to: CGPoint(x: bounds.size.width, y: bounds.midY))
        
        path.lineCapStyle = .round
        
        
        progressLayer.path = path.cgPath
        
        progressLayer.strokeStart = 0.0
        progressLayer.strokeEnd = CGFloat(progress)
        
        backgroundLayer.path = path.cgPath
        
        backgroundLayer.strokeStart = 0.0
        backgroundLayer.strokeEnd = 1.0
    }
    
}
