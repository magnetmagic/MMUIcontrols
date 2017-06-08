//
//  MMHamburgerButton.swift
//  MMUIControls
//
//  Created by magnet-magic on 2017/05/30.
//  Copyright © 2017年 magnet-magic. All rights reserved.
//

import UIKit

@IBDesignable
class MMHamburgerButton: UIButton {

    @IBInspectable var normalColor: UIColor = UIColor.white
    @IBInspectable var highlightedColor: UIColor = UIColor.red
    @IBInspectable var lineWidth:CGFloat = 1.0

    init(frame: CGRect,
         normalColor: UIColor = UIColor.white,
         highlightedColor: UIColor = UIColor.red,
         lineWidth: CGFloat = 1.0){
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
        let lineMarginTop:CGFloat = 0.1 * rect.size.height
        let lineMarginSide:CGFloat = 0.15 * rect.size.width
        
        let insetRect:CGRect = rect.insetBy(dx:lineMarginSide,
                                            dy:lineMarginTop)
        let min:CGPoint = CGPoint(x:insetRect.origin.x  ,
                                  y:insetRect.origin.y + (lineWidth/2.0))
        let max:CGPoint = CGPoint(x:insetRect.origin.x + insetRect.size.width ,
                                  y:insetRect.origin.y - (lineWidth/2.0) + insetRect.size.height)
        
        let path:UIBezierPath = UIBezierPath()
        if(isHighlighted){
            highlightedColor.setStroke()
        }else{
            normalColor.setStroke()
        }
        
        path.move(to: min)
        path.addLine(to: CGPoint(x:max.x ,y:min.y) )
        
        path.move(to: CGPoint(x:min.x ,
                              y:(min.y + max.y)/2.0))
        path.addLine(to: CGPoint(x:max.x ,
                                 y:(min.y + max.y)/2.0) )
        
        path.move(to: CGPoint(x:min.x ,
                              y:max.y))
        path.addLine(to: CGPoint(x:max.x ,
                                 y:max.y))
        
        path.lineWidth = lineWidth
        path.lineCapStyle = .round
        path.stroke()
    }
    override var isHighlighted: Bool {
        didSet {
            setNeedsDisplay()
            
        }
    }

}
