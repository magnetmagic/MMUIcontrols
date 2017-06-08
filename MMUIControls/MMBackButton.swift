//
//  MMBackButton.swift
//  MMUIControls
//
//  Created by magnet-magic on 2017/05/30.
//  Copyright © 2017年 magnet-magic. All rights reserved.
//

import UIKit

@IBDesignable
class MMBackButton: UIButton {

    let margin: CGFloat  = 0.2
    @IBInspectable var lineWidth: CGFloat  = 3.0
    @IBInspectable var normalColor: UIColor = UIColor.white
    @IBInspectable var highlightedColor: UIColor = UIColor.red

    init(frame: CGRect,
         normalColor: UIColor = UIColor.white,
         highlightedColor: UIColor = UIColor.red,
         lineWidth: CGFloat  = 3.0 ){
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
        let x1 = rect.size.height * margin
        let x2 = rect.size.height * 0.5
        
        let y1 = rect.size.height * margin
        let y2 = rect.size.height * 0.5
        let y3 = rect.size.height * ( 1 - margin )

        let path:UIBezierPath = UIBezierPath()
        if(isHighlighted){
            highlightedColor.setStroke()
        }else{
            normalColor.setStroke()
        }

        path.lineCapStyle = .square
        path.lineWidth = lineWidth
        path.move(to: CGPoint(x:x2,y:y1))
        path.addLine(to: CGPoint(x:x1,y:y2))
        path.addLine(to: CGPoint(x:x2,y:y3))
        path.stroke()
    }
    override var isHighlighted: Bool {
        didSet {
            setNeedsDisplay()
            
        }
    }

}

