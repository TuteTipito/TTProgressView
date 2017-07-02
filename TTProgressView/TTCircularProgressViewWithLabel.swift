//
//  TTCircularProgressViewWithLabel.swift
//  TTProgressView
//
//  Created by Matías Spinelli on 2/7/17.
//  Copyright © 2017 Dalmunc. All rights reserved.
//

import UIKit

class TTCircularProgressViewWithLabel: TTCircularProgressView {

    private lazy var counterLabel: UILabel = {
        let label = UILabel()
        self.addSubview(label)
        
        label.textAlignment = .center
        label.frame = self.bounds
        label.font = UIFont(name: "Helvetica", size: 20.0)
        label.textColor = UIColor.black
        
        return label
    }()
    
    override func set(progress: Double) {
        super.set(progress: progress)
        counterLabel.text = String(format: "%.1f%%",self.progress*100)
    }
}
