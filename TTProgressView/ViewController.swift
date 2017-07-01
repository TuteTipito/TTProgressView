//
//  ViewController.swift
//  TTProgressView
//
//  Created by Matías Spinelli on 30/6/17.
//  Copyright © 2017 Dalmunc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var circularProgress: TTCircularProgressView!
    @IBOutlet weak var linearProgress: TTLinearProgressView!
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func buttonOne(_ sender: Any) {
        circularProgress.set(progress: 0.25)
        linearProgress.set(progress: 0.25)
    }
    
    @IBAction func buttonTwo(_ sender: Any) {
        circularProgress.set(progress: -0.25)
        linearProgress.set(progress: -0.25)
    }
    
    @IBAction func buttonThree(_ sender: Any) {
        circularProgress.set(progress: 0.50)
        linearProgress.set(progress: 0.50)
    }
    
    @IBAction func butonFour(_ sender: Any) {
        circularProgress.set(progress: 0.15)
        linearProgress.set(progress: 0.15)
    }
    
    @IBAction func butonFive(_ sender: Any) {
        circularProgress.set(progress: -0.50)
        linearProgress.set(progress: -0.50)
    }
    
    @IBAction func butonSix(_ sender: Any) {
        circularProgress.set(progress: 0.80)
        linearProgress.set(progress: 0.80)
    }
    
    @IBAction func startTimer(_ sender: Any) {
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(increaseProgressForSecond), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        guard timer != nil else { return }
        timer?.invalidate()
        timer = nil
    }
    
    func increaseProgressForSecond() {
        circularProgress.set(progress: 0.01)
        linearProgress.set(progress: 0.01)
    }
}

