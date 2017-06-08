//
//  MMCloseButton.swift
//  MMUIControls
//
//  Created by magnet-magic on 2017/05/30.
//  Copyright © 2017年 magnet-magic. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable class MMCloseButton: UIButton {
    
    @IBInspectable var normalColor: UIColor = UIColor.white
    @IBInspectable var highlightedColor: UIColor = UIColor.gray
    @IBInspectable var lineWidth:CGFloat = 2.0
    
    init(frame: CGRect,
         normalColor: UIColor  = UIColor.white,
         highlightedColor: UIColor  = UIColor.gray,
         lineWidth: CGFloat = 2.0
         ) {
        super.init( frame: frame )
        self.normalColor = normalColor
        self.highlightedColor = highlightedColor
        self.lineWidth = lineWidth
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else{
            return
        }
        context.clear(rect)
        
        
        let margin = lineWidth
        
        let pointMin = CGPoint(x: rect.origin.x + margin, y: rect.origin.y + margin)
        let pointMax = CGPoint(x: rect.origin.x + rect.size.width - margin,
                               y: rect.origin.y + rect.size.height - margin)
        
        let lines :[CGPoint] = [
            pointMin,
            pointMax,
            CGPoint(x:pointMin.x , y: pointMax.y),
            CGPoint(x:pointMax.x , y: pointMin.y)
        ]
        
        context.setStrokeColor(self.isHighlighted ? highlightedColor.cgColor:normalColor.cgColor)
        context.setLineCap(.butt)
        context.setLineWidth(lineWidth)
        context.addLines(between: [lines[0],lines[1]])
        context.closePath()
        context.addLines(between: [lines[2],lines[3]])
        context.closePath()
        context.strokePath()
    }
    override var isHighlighted: Bool {
        didSet {
            setNeedsDisplay()
            
        }
    }
}
