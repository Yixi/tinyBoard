//
//  Tiny.swift
//  tinyBoard
//
//  Created by Yixi on 7/16/14.
//  Copyright (c) 2014 Yixi. All rights reserved.
//

import UIKit

struct numberMatix{
    var zero:[[Int]] = [[0,1,1,1,0],[0,1,0,1,0],[0,1,0,1,0],[0,1,0,1,0],[0,1,1,1,0]]
    var one:[[Int]] = [[0,0,1,0,0],[0,1,1,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,1,1,1,0]]
    var two:[[Int]] = [[0,1,1,1,0],[0,0,0,1,0],[0,1,1,1,0],[0,1,0,0,0],[0,1,1,1,0]]
    var three:[[Int]] = [[0,1,1,1,0],[0,0,0,1,0],[0,1,1,1,0],[0,0,0,1,0],[0,1,1,1,0]]
    var four:[[Int]] = [[0,1,0,1,0],[0,1,0,1,0],[0,1,1,1,0],[0,0,0,1,0],[0,0,0,1,0]]
}


class Tiny: UIView {
    
    
    var rectSize:CGSize?
    var gapSize:CGSize?
    
    var pointArea:[[Int]] = Array()
    var allRows:Int?
    var allColumn:Int?
    var timer:NSTimer?
    var timeStruct = numberMatix()
    
    init(frame: CGRect) {
        super.init(frame: frame)
        // Initialization code
        self.initRectSize()
    }

    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        self.initRectSize()
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
        // Drawing code
       
//        self.DrawPoint()
    }
    
    
    func DrawPoint(){
        for row in 0..<self.allRows!{
            for column in 0..<self.allColumn!{
                self.drawBLock(Int(row), column:Int(column))
            }
        }
    }
    
    func reDrawPoint(){
        
        self.DrawPoint()
    }
    
    func drawBLock(row:Int,column:Int){
        var startX = Float(self.rectSize!.width + self.gapSize!.width) * Float(column)
        var startY = Float(self.rectSize!.height + self.gapSize!.height) * Float(row)
        
        var blockFrame = CGRectMake(startX, startY, self.rectSize!.width, self.rectSize!.height)
        var color:UIColor?
        if self.pointArea[column][row] as Int == 0{
            color = UIColor.darkGrayColor()
        }else{
            color = UIColor.whiteColor()
        }
//        var color = UIColor.darkGrayColor()
        
        color!.setFill()
        color!.setStroke()
        let path = UIBezierPath(roundedRect: blockFrame, cornerRadius: 5.0)
        path.fill()
        path.stroke()
        
    }
    
    
    func initRectSize(){
        self.rectSize = CGSizeMake(10, 10)
        self.gapSize = CGSizeMake(3, 3)
        
        self.allColumn = Int((self.frame.width + gapSize!.width) / (gapSize!.width + rectSize!.width))
        self.allRows = Int((self.frame.height + gapSize!.height) / (gapSize!.height + rectSize!.height))
        
        self.pointArea = Array(count:self.allColumn!, repeatedValue:[Int](count:self.allRows!,repeatedValue:0))
        
        
        
        self.showChar(timeStruct.one, offsetX: 10, offsetY: 10)
        
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "onUpdate", userInfo: nil, repeats: true)
        
    }
    
    func showChar(martix:[[Int]],offsetX:Int,offsetY:Int){

        for row in 0..<martix.count{
            for column in 0..<martix[row].count{
                self.pointArea[column + offsetX][row + offsetY] = martix[row][column]
            }
        }

    }
    
    func onUpdate(){
        println("update")
//        self.pointArea = Array(count:self.allColumn!, repeatedValue:[Int](count:self.allRows!,repeatedValue:0))
        self.showChar(self.timeStruct.two, offsetX: 10, offsetY: 10)
        self.reDrawPoint()
    }
    
    

}
