//
//  ViewController.swift
//  TTProgressView
//
//  Created by Matías Spinelli on 30/6/17.
//  Copyright © 2017 Dalmunc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var circularProgress: TTCircularProgressViewWithLabel!
    @IBOutlet weak var linearProgress: TTLinearProgressView!
    
    @IBOutlet weak var loadingProgress: TTCircularProgressView!
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Actions
    
    @IBAction func minusFifteen(_ sender: Any) {
        circularProgress.set(progress: -0.15)
        linearProgress.set(progress: -0.15)
    }
    
    @IBAction func minusTwentyfive(_ sender: Any) {
        circularProgress.set(progress: -0.25)
        linearProgress.set(progress: -0.25)
    }
    
    @IBAction func minusFifty(_ sender: Any) {
        circularProgress.set(progress: -0.50)
        linearProgress.set(progress: -0.50)
    }
    
    @IBAction func minusEighty(_ sender: Any) {
        circularProgress.set(progress: -0.80)
        linearProgress.set(progress: -0.80)
    }
    
    @IBAction func plusFifteen(_ sender: Any) {
        circularProgress.set(progress: 0.15)
        linearProgress.set(progress: 0.15)
    }
    
    @IBAction func plusTwentyFive(_ sender: Any) {
        circularProgress.set(progress: 0.25)
        linearProgress.set(progress: 0.25)
    }
    
    @IBAction func plusFifty(_ sender: Any) {
        circularProgress.set(progress: 0.50)
        linearProgress.set(progress: 0.50)
    }
    
    @IBAction func plusEighty(_ sender: Any) {
        circularProgress.set(progress: 0.80)
        linearProgress.set(progress: 0.80)
    }
    
    @IBAction func startTimer(_ sender: Any) {
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(increaseProgressForSecond), userInfo: nil, repeats: true)
        
        loadingProgress.startRotation()
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        guard timer != nil else { return }
        timer?.invalidate()
        timer = nil
        
        loadingProgress.stopRotation()
    }
    
    @objc func increaseProgressForSecond() {
        circularProgress.set(progress: 0.01)
        linearProgress.set(progress: 0.01)
    }
}

