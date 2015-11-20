//
//  ViewController.swift
//  DSSlideDownView
//
//  Created by Dan Stepanov on 11/19/2015.
//  Copyright (c) 2015 Dan Stepanov. All rights reserved.
//

import UIKit
import DSSlideDownView

class ViewController: UIViewController {
    
    lazy var button: UIButton! = {
        let view = UIButton(type: .Custom)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blackColor()
        view.setTitle("Click Me!", forState: UIControlState.Normal)
        view.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        //view.textAlignment = .Center
        view.addTarget(self, action: "presentSlideDownViewButtonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return view
    }()
    
    @IBAction func presentSlideDownViewButtonTouched(sender:AnyObject) {
        print("Slide Down Presented")
        let slideDown = DSSlideDownView(frame: CGRectZero)
        let topMostView = UIApplication.sharedApplication().windows.last
        topMostView?.addSubview(slideDown)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        print("Hello World")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupViews() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(button)
        
        
        self.view.setNeedsUpdateConstraints()
        self.view.updateConstraintsIfNeeded()
    }
    
    override func updateViewConstraints() {
        buttonConstraints()
        super.updateViewConstraints()
    }

    func buttonConstraints() {
        self.view.addConstraint(NSLayoutConstraint(
            item:self.button,
            attribute:NSLayoutAttribute.Width,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self.view,
            attribute:NSLayoutAttribute.Width,
            multiplier:0.5,
            constant:0))
        
        self.view.addConstraint(NSLayoutConstraint(
            item:self.button,
            attribute:NSLayoutAttribute.Height,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self.button,
            attribute:NSLayoutAttribute.Width,
            multiplier:1.0,
            constant:0))
        
        self.view.addConstraint(NSLayoutConstraint(
            item:self.button,
            attribute:NSLayoutAttribute.CenterX,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self.view,
            attribute:NSLayoutAttribute.CenterX,
            multiplier:1.0,
            constant:0))
        
        self.view.addConstraint(NSLayoutConstraint(
            item:self.button,
            attribute:NSLayoutAttribute.CenterY,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self.view,
            attribute:NSLayoutAttribute.CenterY,
            multiplier:1.0,
            constant:0))
    }
    
    

}


