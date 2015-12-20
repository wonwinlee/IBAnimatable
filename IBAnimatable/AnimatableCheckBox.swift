//
//  Created by Jake Lin on 12/20/15.
//  Copyright © 2015 Jake Lin. All rights reserved.
//

import UIKit

@IBDesignable public class AnimatableCheckBox: UIButton, CornerDesignable, FillDesignable, BorderDesignable, ShadowDesignable, MaskDesignable, CheckBoxDesignable, Animatable {
  
  // MARK: - CornerDesignable
  @IBInspectable public var cornerRadius: CGFloat = 0 {
    didSet {
      configCornerRadius()
    }
  }
  
  // MARK: - FillDesignable
  @IBInspectable public var fillColor: UIColor = UIColor.whiteColor() {
    didSet {
      configFillColor()
    }
  }
  
  @IBInspectable public var opacity: CGFloat = 1 {
    didSet {
      configOpacity()
    }
  }
  
  // MARK: - BorderDesignable
  @IBInspectable public var borderColor: UIColor = UIColor.clearColor()
  @IBInspectable public var borderWidth: CGFloat = 0
  @IBInspectable public var borderSide: String = ""
  
  // MARK: - ShadowDesignable
  @IBInspectable public var shadowColor: UIColor = UIColor.clearColor() {
    didSet {
      configShadowColor()
    }
  }
  
  @IBInspectable public var shadowRadius: CGFloat = 0 {
    didSet {
      configShadowRadius()
    }
  }
  
  @IBInspectable public var shadowOpacity: CGFloat = 0 {
    didSet {
      configShadowOpacity()
    }
  }
  
  @IBInspectable public var shadowOffsetX: CGFloat = 0 {
    didSet {
      configShadowOffsetX()
    }
  }
  
  @IBInspectable public var shadowOffsetY: CGFloat = 0 {
    didSet {
      configShadowOffsetY()
    }
  }
  
  // MARK: - MaksDesignable
  @IBInspectable public var maskType: String = "" {
    didSet {
      configMask()
    }
  }
  
  // MARK: - CheckBoxDesignable
  @IBInspectable public var checked: Bool = false {
    didSet {
      configCheckBoxChecked()
    }
  }
  
  @IBInspectable public var checkedImage: UIImage? = nil {
    didSet {
      configCheckBoxCheckedImage()
    }
  }
  
  @IBInspectable public var uncheckedImage: UIImage? = nil {
    didSet {
      configCheckBoxUncheckedImage()
    }
  }
  
  // MARK: - Animatable
  @IBInspectable public var animationType: String = ""
  @IBInspectable public var duration: Double = 0.7
  @IBInspectable public var delay: Double = 0
  @IBInspectable public var force: CGFloat = 1
  @IBInspectable public var damping: CGFloat = 0.7
  @IBInspectable public var velocity: CGFloat = 0.7
  @IBInspectable public var repeatCount: Float = 1
  
  // MARK: - Lifecycle
  public override func prepareForInterfaceBuilder() {
    configDesignableProperties()
  }
  
  public override func awakeFromNib() {
    configDesignableProperties()
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    
    startAnimation()
  }
  
  public override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    if touchInside {
      checked = !checked
      selected = checked
      sendActionsForControlEvents(.ValueChanged)
    }
    super.touchesEnded(touches, withEvent: event)
  }
  
  // MARK: - Private
  private func configDesignableProperties() {
    configBorder()
  }
}