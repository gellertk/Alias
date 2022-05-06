//
//  CircularProgressBarView.swift
//  Alias
//
//  Created by Полина Дусин on 04.05.2022.
//

import UIKit

protocol CircularProgressBarViewDelegate {
    func didChangeDuration(duration: UInt)
    func timerIsOver()
}

class CircularProgressBarView: UIView {
    private var progressLayer = CAShapeLayer()
    private var circleLayer = CAShapeLayer()
    private var timer = Timer()
    var duration: UInt = 60
    var delegate: CircularProgressBarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCircularPath()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createCircularPath()
    }
    
    private func createCircularPath() {
        let endPoint = -CGFloat.pi / 2
        let startPoint = 2 * CGFloat.pi + endPoint
        
        // created circularPath for circleLayer and progressLayer
        let circularPath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2),
            radius: 20,
            startAngle: startPoint,
            endAngle: endPoint,
            clockwise: false
        )
        
        // circleLayer path defined to circularPath
        circleLayer.path = circularPath.cgPath
        // ui edits
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 5.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.white.cgColor
        // added circleLayer to layer
        layer.addSublayer(circleLayer)
        
        // progressLayer path defined to circularPath
        progressLayer.path = circularPath.cgPath
        // ui edits
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 5.0
        progressLayer.strokeEnd = 1.0
        progressLayer.strokeColor = UIColor.green.cgColor
        // added progressLayer to layer
        layer.addSublayer(progressLayer)
    }
    
    func circleAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(self.duration)
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = true
        progressLayer.add(basicAnimation, forKey: "progressAnimation")
    }
    
    func stopTimer() {
        timer.invalidate()
    }
    
    func startTimer() {
        self.delegate?.didChangeDuration(duration: self.duration)
        self.circleAnimation()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction() {
        self.duration -= 1
        self.delegate?.didChangeDuration(duration: self.duration)
        
        if self.duration == 0 {
            timer.invalidate()
            self.delegate?.timerIsOver()
        }
    }
}
