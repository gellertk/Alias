//
//  CircularProgressBarView.swift
//  Alias
//
//  Created by Полина Дусин on 04.05.2022.
//

import UIKit

class CircularProgressBarView: UIView {
    
    private var progressLayer = CAShapeLayer()
    private var circleLayer = CAShapeLayer()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "\(K.Numeric.roundDuration)"
        label.font = .monospacedDigitSystemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        startCircleAnimation()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        startCircleAnimation()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createCircularPath()
    }
    
    private func createCircularPath() {
        let endPoint = -CGFloat.pi / 2
        let startPoint = 2 * .pi + endPoint
        
        let circularPath = UIBezierPath(
            arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2),
            radius: 30,
            startAngle: startPoint,
            endAngle: endPoint,
            clockwise: false
        )
        
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 5.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor.white.cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 5.0
        progressLayer.strokeEnd = 1.0
        progressLayer.strokeColor = K.Color.secondaryInterfaceBackground.cgColor
        layer.addSublayer(progressLayer)
    }
    
    func startCircleAnimation() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 0
        basicAnimation.duration = CFTimeInterval(K.Numeric.roundDuration)
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        progressLayer.add(basicAnimation, forKey: "progressAnimation")
    }
    
    func updateTimerLabel(_ duration: UInt) {
        timerLabel.text = "\(duration)"
    }
    
}

private extension CircularProgressBarView {
    
    func setupView() {
        addSubviews([timerLabel])
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timerLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}
