//
//  Tiny.swift
//  tinyBoard
//
//  Created by Yixi on 7/16/14.
//  Copyright (c) 2014 Yixi. All rights reserved.
//

import UIKit

class Tiny: UIView {
    
    
    var rectSize:CGSize?
    var gapSize:CGSize?
    
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
    }

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
        for row in 0..<8{
            for column in 0..<8{
                self.drawBLock(Int(row), column:Int(column))
            }
        }
    }

    
    func drawBLock(row:Int,column:Int){
        var block = (self.rectSize!.width + self.gapSize!.width) * (CGFloat(7) - CGFloat(column)) + CGFloat(1)
    }
    
    
    func initRectSize(){
        self.rectSize = CGSizeMake(30, 30)
        self.gapSize = CGSizeMake(3, 3)
    }
    
    
    

}