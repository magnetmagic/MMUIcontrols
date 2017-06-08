//
//  MMStrobeView.swift
//  MMUIControls
//
//  Created by magnet-magic on 2017/05/30.
//  Copyright © 2017年 magnet-magic. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable class MMStrobeView: UIView{
    @IBInspectable var normalColor: UIColor = UIColor.white

    init(frame: CGRect,
         normalColor: UIColor = UIColor.white
        ) {
        super.init( frame: frame )
        self.normalColor = normalColor
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    override func draw(_ rect: CGRect) {
        let path = pathStrobe( rect:rect )
        
        path.lineCapStyle = .round
        
        normalColor.setStroke()
        normalColor.setFill()
        
        path.fill()
    }

    func pathStrobe( rect: CGRect ) -> UIBezierPath{
        let distanceTopEdgeHeight:CGFloat = rect.size.height * 0.9 / 2.0
        let distanceTopEdgeWidth:CGFloat = rect.size.height * 0.3 / 2.0
        let distanceSideEdgeHeight:CGFloat = rect.size.width * 0.1 / 2.0
        let distanceSideEdgeWidth:CGFloat = rect.size.width * 0.5 / 2.0
        let distanceCenterWidth:CGFloat = rect.size.width * 0.1 / 2.0
        let distanceCenterHeight:CGFloat = rect.size.width * 0.1 / 2.0
        
        let center:CGPoint = CGPoint(x:(rect.origin.x + rect.size.width) / 2.0,
                                     y:(rect.origin.y + rect.size.height) / 2.0)
        
        let lines:[CGPoint] = [
            CGPoint(x:center.x - distanceSideEdgeWidth, y:center.y + distanceSideEdgeHeight),
            CGPoint(x:center.x - distanceCenterWidth,   y:center.y + distanceCenterHeight),
            CGPoint(x:center.x - distanceTopEdgeWidth,  y:center.y + distanceTopEdgeHeight),
            CGPoint(x:center.x + distanceSideEdgeWidth, y:center.y - distanceSideEdgeHeight),
            CGPoint(x:center.x + distanceCenterWidth,   y:center.y - distanceCenterHeight),
            CGPoint(x:center.x + distanceTopEdgeWidth,  y:center.y - distanceTopEdgeHeight)
            
        ]

        let path:UIBezierPath = UIBezierPath()
        path.move(to: CGPoint(x:center.x + distanceTopEdgeWidth,
                                y:center.y - distanceTopEdgeHeight))
        for i in 0..<6 {
            path.addLine(to: lines[i])
        }
        path.close()

        return path
    }
}
