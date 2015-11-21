//
//  DSSlideDownView.swift
//  Pods
//
//  Created by Daniel Stepanov on 11/19/15.
//
//

import Foundation
import UIKit

var animateInDuration: NSTimeInterval = 0.35
var animateOutDuration: NSTimeInterval = 0.133

public class DSSlideDownView: UIView, UIGestureRecognizerDelegate {
    
    private var didSetConstraints: Bool = false
    
    public lazy var background: UIImageView! = {
        let view = UIImageView(frame: CGRectZero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "background")
        
        return view
    }()
    
    public lazy var titleLabel: UILabel! = {
        let view = UILabel(frame: CGRectZero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Slide Down Menu"
        view.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        view.textAlignment = NSTextAlignment.Center
        view.textColor = UIColor.blackColor()
        
        return view
    }()
    
    public lazy var descriptionLabel: UILabel! = {
        let view = UILabel(frame: CGRectZero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = NSTextAlignment.Left
        view.numberOfLines = 30;
        var style = NSMutableParagraphStyle()
        style.lineSpacing = 2.0
        var string = NSString(string: "This is an example of the DSSlideDownView. Feel free to add any buttons or your own text. \n\nThis version of the component has a static height but the next release will contain a dynamic height that will vary with the amount of the contents in the component. \n\nThis example may be dismissed via either the 'OK' button or by tapping the overlay behind the slide down menu. \n\n- Dan")
        let attrString = NSAttributedString(
            string: string as String,
            attributes: [
                NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 14.0)!,
                NSForegroundColorAttributeName: UIColor.blackColor(),
                NSParagraphStyleAttributeName: style
            ])
        view.attributedText = attrString
        
        return view
    }()
    
    public lazy var dismissButton: UIButton! = {
        let view = UIButton(type: .Custom)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "dismiss button"), forState: UIControlState.Normal)
        view.setImage(UIImage(named: "dismiss button selected"), forState: UIControlState.Highlighted)
        view.addTarget(self, action: "dismissButtonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return view
    }()
    
    private var slideDownPositionConstraint: NSLayoutConstraint = NSLayoutConstraint()
    private var overlayView: OverlayView = OverlayView()
    
    public required init!(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(background)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(dismissButton)
//        addSubview(overlayView)
        
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
    }
    
    public override func updateConstraints() {
        backgroundConstraints()
        titleConstraints()
        descriptionConstraints()
        dismissButtonConstraints()
        super.updateConstraints()
    }
    
    public func backgroundConstraints() {
        self.addConstraint(NSLayoutConstraint(
            item:self.background,
            attribute:NSLayoutAttribute.Width,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Width,
            multiplier:1.0,
            constant:0))
        
        self.addConstraint(NSLayoutConstraint(
            item:self.background,
            attribute:NSLayoutAttribute.Height,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Height,
            multiplier:1.0,
            constant:0))
        
        self.addConstraint(NSLayoutConstraint(
            item:self.background,
            attribute:NSLayoutAttribute.CenterX,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.CenterX,
            multiplier:1.0,
            constant:0))
        
        self.addConstraint(NSLayoutConstraint(
            item:self.background,
            attribute:NSLayoutAttribute.CenterY,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.CenterY,
            multiplier:1.0,
            constant:0))
        
    }
    
    public func titleConstraints() {
        self.addConstraint(NSLayoutConstraint(
            item:self.titleLabel,
            attribute:NSLayoutAttribute.Width,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Width,
            multiplier:1.0,
            constant:0))
        
        self.addConstraint(NSLayoutConstraint(
            item:self.titleLabel,
            attribute:NSLayoutAttribute.Height,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self.titleLabel,
            attribute:NSLayoutAttribute.Width,
            multiplier:0.07,
            constant:0))
        
        self.addConstraint(NSLayoutConstraint(
            item:self.titleLabel,
            attribute:NSLayoutAttribute.CenterX,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.CenterX,
            multiplier:1.0,
            constant:0))
        
        self.addConstraint(NSLayoutConstraint(
            item:self.titleLabel,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Bottom,
            multiplier:0.07,
            constant:0))
    }
    
    public func descriptionConstraints() {
        self.addConstraint(NSLayoutConstraint(
            item:self.descriptionLabel,
            attribute:NSLayoutAttribute.Width,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Width,
            multiplier:0.815,
            constant:0))
        
        self.addConstraint(NSLayoutConstraint(
            item:self.descriptionLabel,
            attribute:NSLayoutAttribute.Height,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self.descriptionLabel,
            attribute:NSLayoutAttribute.Width,
            multiplier:1.1,
            constant:0))
        
        self.addConstraint(NSLayoutConstraint(
            item:self.descriptionLabel,
            attribute:NSLayoutAttribute.CenterX,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.CenterX,
            multiplier:1.0,
            constant:0))
        
        self.addConstraint(NSLayoutConstraint(
            item:self.descriptionLabel,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Bottom,
            multiplier:0.162,
            constant:0))
    }
    
    public func dismissButtonConstraints() {
        self.addConstraint(NSLayoutConstraint(
            item:self.dismissButton,
            attribute:NSLayoutAttribute.Width,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Width,
            multiplier:0.85,
            constant:0))
        
        self.addConstraint(NSLayoutConstraint(
            item:self.dismissButton,
            attribute:NSLayoutAttribute.Height,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self.dismissButton,
            attribute:NSLayoutAttribute.Width,
            multiplier:0.164,
            constant:0))
        
        self.addConstraint(NSLayoutConstraint(
            item:self.dismissButton,
            attribute:NSLayoutAttribute.CenterX,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.CenterX,
            multiplier:1.0,
            constant:0))
        
        self.addConstraint(NSLayoutConstraint(
            item:self.dismissButton,
            attribute:NSLayoutAttribute.Top,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self,
            attribute:NSLayoutAttribute.Bottom,
            multiplier:0.84,
            constant:0))
    }
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if self.superview == nil {return}
        
        setupOverlay()
        
        let screenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
        
        self.superview!.addConstraint(NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.Width,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self.superview,
            attribute:NSLayoutAttribute.Width,
            multiplier:0.877,
            constant:0))
        
        self.superview!.addConstraint(NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.Height,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self.superview,
            attribute:NSLayoutAttribute.Height,
            multiplier:0.71,
            constant:0))
        
        self.superview!.addConstraint(NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.CenterX,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self.superview,
            attribute:NSLayoutAttribute.CenterX,
            multiplier:1.0,
            constant:0))
        
        self.slideDownPositionConstraint = NSLayoutConstraint(
            item:self,
            attribute:NSLayoutAttribute.CenterY,
            relatedBy:NSLayoutRelation.Equal,
            toItem:self.superview,
            attribute:NSLayoutAttribute.Bottom,
            multiplier:1.0,
            constant:-(3.0*screenHeight)/2.0)
        
        self.superview?.addConstraint(slideDownPositionConstraint)
        
        layoutIfNeeded()
        
        UIView.animateWithDuration(
            animateInDuration,
            animations: {
                self.slideDownPositionConstraint.constant = -(screenHeight/2.0) + 0.1*screenHeight
                self.overlayView.alpha = 1.0
                self.layoutIfNeeded()
            },
            definitelyCompleted: {
                UIView.animateWithDuration(
                    animateOutDuration,
                    animations: {
                        self.slideDownPositionConstraint.constant = -(screenHeight/2.0)
                        self.layoutIfNeeded()
                    })
            })
    }

    public func setupOverlay() {
        self.overlayView = OverlayView()
        self.overlayView.frame = self.superview!.bounds
        self.overlayView.alpha = 0.0
        self.superview?.insertSubview(self.overlayView, belowSubview: self)
        
        var dismissViewTap: UITapGestureRecognizer = UITapGestureRecognizer()
        dismissViewTap.numberOfTapsRequired = 1
        dismissViewTap = UITapGestureRecognizer.init(target: self, action: "dismissButtonTouched:")
        self.overlayView.addGestureRecognizer(dismissViewTap)
    }
    
    public func dismissButtonTouched(sender: AnyObject) {
        print("Slide Down Dismissed")
        
        let screenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
        
        UIView.animateWithDuration(
            animateOutDuration,
            animations: {
                self.slideDownPositionConstraint.constant = -(screenHeight/2.0) - 0.1*screenHeight
                self.layoutIfNeeded()
            },
            definitelyCompleted: {
                UIView.animateWithDuration(
                    animateOutDuration,
                    animations: {
                        self.slideDownPositionConstraint.constant = screenHeight
                        self.overlayView.alpha = 0.0
                        self.layoutIfNeeded()
                    },
                    definitelyCompleted: {
                        self.overlayView.dismissView()
                        self.removeFromSuperview()
                    }
                )
            }
        )
    }
}

extension UIView {
    public class func animateWithDuration(
                        duration:NSTimeInterval,
                        animations:(() -> Void),
                        definitelyCompleted:() -> Void) {
        let onComplete = { (finished: Bool) in
            if finished {
                definitelyCompleted()
            } else {
                let when = dispatch_time(DISPATCH_TIME_NOW, Int64(duration * Double(NSEC_PER_SEC)))
                let queue = dispatch_get_main_queue()
                dispatch_after(when, queue, {
                    definitelyCompleted()
                })
            }
        }
    
    UIView.animateWithDuration(
                duration,
                animations: animations,
                completion: onComplete)
    
    }
}
