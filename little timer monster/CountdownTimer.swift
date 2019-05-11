//
//  CountdownTimer.swift
//  Little Monster Timer
//
//  Created by Jesper Lentz on 10/05/2019.
//  Copyright © 2019 Jesper Lentz. All rights reserved.
//

import UIKit

protocol CountdownTimerDelegate:class {
    func countdownTimerDone()
    func countdownTime(totalsecondsReturn: Int)
}

class CountdownTimer {
    weak var delegate: CountdownTimerDelegate?
    
    fileprivate var totalSecond: Int = 0
    fileprivate var savedTotalSecond: Int = 0
    var totalS = 0
    
    lazy var timer: Timer = {
        let timer = Timer()
        return timer
    }()
    
    public func setTimer(seconds:Int){
        totalSecond = seconds
     
        
    }
    
    public func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(CountdownTimer.countdown), userInfo: nil, repeats: true)
        saveSeconds()
    }
    
    @objc func countdown (){
        if totalSecond < 1 {
            timer.invalidate()
            timerDone()
        } else{
            totalSecond -= 1
            delegate?.countdownTime(totalsecondsReturn: totalSecond)
        }
        
    }
    fileprivate func saveSeconds(){
        savedTotalSecond = totalSecond
    }
    
    fileprivate func timerDone() {
        timer.invalidate()
        totalSecond = savedTotalSecond
        delegate?.countdownTime(totalsecondsReturn: totalSecond)
        delegate?.countdownTimerDone()
    }
    
    fileprivate func stop() {
        timer.invalidate()
        totalSecond = savedTotalSecond
        delegate?.countdownTime(totalsecondsReturn: totalSecond)
        
    }
    public func pause() {
        timer.invalidate()
    }
    
        
    }
    
   
