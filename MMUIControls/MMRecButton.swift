//
//  MMRecButton.swift
//  MMUIControls
//
//  Created by magnet-magic on 2017/05/30.
//  Copyright © 2017年 magnet-magic. All rights reserved.
//

import UIKit
import QuartzCore


@IBDesignable class MMRecButton: UIButton{
    @IBInspectable var normalColor: UIColor = UIColor.white
    @IBInspectable var highlightedColor: UIColor = UIColor.red
    @IBInspectable var outerLineWidthRate: CGFloat = 0.05
    @IBInspectable var innerCircleRadiusRate: CGFloat = 0.78
    
    init(frame: CGRect,
                  normalColor: UIColor ,
                  highlightedColor: UIColor ,
                  outerLineWidthRate: CGFloat = 0.05,
                  innerCircleRadiusRate: CGFloat = 0.78 ) {
        super.init( frame: frame )
        self.normalColor = normalColor
        self.highlightedColor = highlightedColor
        self.outerLineWidthRate = outerLineWidthRate
        self.innerCircleRadiusRate = innerCircleRadiusRate
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    //
    override func draw(_ rect: CGRect) {

        let shortSize = CGFloat(fmin( rect.size.height,rect.size.width))
        let outerLineWidth = shortSize * CGFloat(outerLineWidthRate)
        let innerCircleRadius = shortSize * CGFloat(innerCircleRadiusRate)
        
        let path = UIBezierPath( ovalIn: CGRect(x: 0+outerLineWidth, y: 0+outerLineWidth, width: shortSize-outerLineWidth*2, height: shortSize-outerLineWidth*2))
        
        normalColor.setStroke()
        UIColor.clear.setFill()
        
        path.lineWidth = outerLineWidth
        path.fill()
        path.stroke()

        
        if(isHighlighted){
            highlightedColor.setFill()
            highlightedColor.setStroke()
        }else{
            normalColor.setFill()
            normalColor.setStroke()
        }

        let offset =  (shortSize - innerCircleRadius) / 2.0
        let buttonPath = UIBezierPath(ovalIn: CGRect(x: offset, y: offset, width: innerCircleRadius, height: innerCircleRadius))

        buttonPath.fill()
        buttonPath.stroke()
    }
    
    override var isHighlighted: Bool {
        didSet {
            setNeedsDisplay()
            
        }
    }
}
