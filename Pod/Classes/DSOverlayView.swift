//
//  DSOverlayView.swift
//  Pods
//
//  Created by Daniel Stepanov on 11/19/15.
//
//

import UIKit

var navAndStatusBarHeight: NSInteger = 64

class OverlayView: UIView, UIGestureRecognizerDelegate {

    required init!(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews() {
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        
        let dismissOverlayViewTapGesture = UITapGestureRecognizer(target: self, action: "dismissOverlayView")
        self.addGestureRecognizer(dismissOverlayViewTapGesture)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        setNeedsUpdateConstraints()
    }
    
    @IBAction func dismissOverlayView(sender: AnyObject) {
        self.removeFromSuperview()
    }
    
    func dismissView() {
        self.removeFromSuperview()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if self.superview == nil {
            return
        }
        
        self.superview!.addConstraint(NSLayoutConstraint(item:self,
        attribute:NSLayoutAttribute.CenterX,
        relatedBy:NSLayoutRelation.Equal,
        toItem:self.superview,
        attribute:NSLayoutAttribute.CenterX,
        multiplier:1.0,
        constant:0))
        
        self.superview!.addConstraint(NSLayoutConstraint(item:self,
        attribute:NSLayoutAttribute.Width,
        relatedBy:NSLayoutRelation.Equal,
        toItem:self.superview,
        attribute:NSLayoutAttribute.Width,
        multiplier:1.0,
        constant:0))
        
        self.superview!.addConstraint(NSLayoutConstraint(item:self,
        attribute:NSLayoutAttribute.Height,
        relatedBy:NSLayoutRelation.Equal,
        toItem:self.superview,
        attribute:NSLayoutAttribute.Height,
        multiplier:1.0,
        constant:0))
        
        self.superview!.addConstraint(NSLayoutConstraint(item:self,
        attribute:NSLayoutAttribute.Top,
        relatedBy:NSLayoutRelation.Equal,
        toItem:self.superview,
        attribute:NSLayoutAttribute.Top,
        multiplier:1.0,
        constant:0))
        
        self.layoutIfNeeded()
    }
    
    
}
