//
//  Tiny.swift
//  tinyBoard
//
//  Created by Yixi on 7/16/14.
//  Copyright (c) 2014 Yixi. All rights reserved.
//

import UIKit

struct numberMatix{
    var n_0:[[Int]] = [[0,1,1,1,0],[0,1,0,1,0],[0,1,0,1,0],[0,1,0,1,0],[0,1,1,1,0]]
    var n_1:[[Int]] = [[0,0,1,0,0],[0,1,1,0,0],[0,0,1,0,0],[0,0,1,0,0],[0,1,1,1,0]]
    var n_2:[[Int]] = [[0,1,1,1,0],[0,0,0,1,0],[0,1,1,1,0],[0,1,0,0,0],[0,1,1,1,0]]
    var n_3:[[Int]] = [[0,1,1,1,0],[0,0,0,1,0],[0,1,1,1,0],[0,0,0,1,0],[0,1,1,1,0]]
    var n_4:[[Int]] = [[0,1,0,1,0],[0,1,0,1,0],[0,1,1,1,0],[0,0,0,1,0],[0,0,0,1,0]]
    var n_5:[[Int]] = [[0,1,1,1,0],[0,1,0,0,0],[0,1,1,1,0],[0,0,0,1,0],[0,1,1,1,0]]
    var n_6:[[Int]] = [[0,1,1,1,0],[0,1,0,0,0],[0,1,1,1,0],[0,1,0,1,0],[0,1,1,1,0]]
    var n_7:[[Int]] = [[0,1,1,1,0],[0,0,0,1,0],[0,0,0,1,0],[0,0,0,1,0],[0,0,0,1,0]]
    var n_8:[[Int]] = [[0,1,1,1,0],[0,1,0,1,0],[0,1,1,1,0],[0,1,0,1,0],[0,1,1,1,0]]
    var n_9:[[Int]] = [[0,1,1,1,0],[0,1,0,1,0],[0,1,1,1,0],[0,0,0,1,0],[0,1,1,1,0]]
    var n_s:[[Int]] = [[0,0,0],[0,1,0],[0,0,0],[0,1,0],[0,0,0]]
}

//struct pointsMatix{
var points:[[Int]] = Array()
//}

class Tiny: UIView {
    
    
    var rectSize:CGSize?
    var gapSize:CGSize?
    

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
       
        self.DrawPoint()
    }
    
    
    func DrawPoint(){
//       println(NSDate.date())
        for row in 0..<24{
            for column in 0..<24{
                
                self.drawBLock(Int(row), column:Int(column))
            
            }
        }
//        println(NSDate.date())
    }
    
    
    func drawBLock(row:Int,column:Int){

        var startX = Float(self.rectSize!.width + self.gapSize!.width) * Float(column)
        var startY = Float(self.rectSize!.height + self.gapSize!.height) * Float(row)

        
        var blockFrame = CGRectMake(startX, startY, self.rectSize!.width, self.rectSize!.height)
        var color:UIColor?
        
//        println(NSDate.date())
        var currentColor:Int = points[column][row]
//        println(NSDate.date())
        
//        var currentColor = row % 2
        
        if currentColor == 0{
            color = UIColor.darkGrayColor()
        }else{
            color = UIColor.whiteColor()
        }
        color!.setFill()
        color!.setStroke()
        let path = UIBezierPath(roundedRect: blockFrame, cornerRadius: 5.0)
        path.fill()
        path.stroke()
        
        
//        var context:CGContextRef = UIGraphicsGetCurrentContext()
        
////        println(NSDate.date())
////        var currentColor:Int = self.pointArea[column][row]
////        println(NSDate.date())
//        var currentColor = row % 2
//        if  currentColor == 0{
//            CGContextSetFillColorWithColor(context, UIColor.darkGrayColor().CGColor)
//        }else{
//            CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
//        }
//    
//        CGContextAddRect(context, blockFrame)
//        CGContextFillPath(context)
        
        
    }
    
    
    func initRectSize(){
        self.rectSize = CGSizeMake(10, 10)
        self.gapSize = CGSizeMake(3, 3)
        
        self.allColumn = Int((self.frame.width + gapSize!.width) / (gapSize!.width + rectSize!.width))
        self.allRows = Int((self.frame.height + gapSize!.height) / (gapSize!.height + rectSize!.height))

        points = Array(count:self.allColumn!, repeatedValue:[Int](count:self.allRows!,repeatedValue:0))
        
        
        
        self.onUpdate()
        
        
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "onUpdate", userInfo: nil, repeats: true)
        
    }
    
    func showChar(martix:[[Int]],offsetX:Int,offsetY:Int){

        for row in 0..<martix.count{
            for column in 0..<martix[row].count{
                points[column + offsetX][row + offsetY] = martix[row][column]
            }
        }

    }
    
    func getCharMartix(number:Character)->[[Int]]{
        var matrix:[[Int]]
        switch number{
            case "0":
                matrix = self.timeStruct.n_0
            case "1":
                matrix = self.timeStruct.n_1
        case "2":
            matrix = self.timeStruct.n_2

        case "3":
            matrix = self.timeStruct.n_3

        case "4":
            matrix = self.timeStruct.n_4
        case "5":
            matrix = self.timeStruct.n_5

        case "6":
            matrix = self.timeStruct.n_6
        case "7":
            matrix = self.timeStruct.n_7

        case "8":
            matrix = self.timeStruct.n_8

        case "9":
            matrix = self.timeStruct.n_9
        case ":":
            matrix = self.timeStruct.n_s
        default:
            matrix = [[0]]
            
        }
        return matrix
    }
    
    func onUpdate(){
        println("update")
        points = Array(count:self.allColumn!, repeatedValue:[Int](count:self.allRows!,repeatedValue:0))
//        self.showChar(self.timeStruct.two, offsetX: 10, offsetY: 10)

        var format = NSDateFormatter()
        format.dateFormat = "HH:mm"
        var date = format.stringFromDate(NSDate.date()) as String
        
        format.dateFormat = "ss"
        var ss = format.stringFromDate(NSDate.date()) as String
        var offsetX:Int = 0
        var martix:[[Int]]
        for char in date{
            martix = self.getCharMartix(char)
 
            self.showChar(martix, offsetX: offsetX, offsetY: 5)
            offsetX += martix[0].count
        }
        
        offsetX = 7
        
        for sc in ss{
             martix = self.getCharMartix(sc)
            self.showChar(martix, offsetX: offsetX, offsetY: 13)
            offsetX += martix[0].count
        }
        
        
        self.setNeedsDisplay()
    }
    
    

}
