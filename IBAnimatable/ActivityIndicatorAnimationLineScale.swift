//
//  Created by Tom Baranes on 23/08/16.
//  Copyright (c) 2016 IBAnimatable. All rights reserved.
//

import UIKit

public class ActivityIndicatorAnimationLineScale: ActivityIndicatorAnimating {

  // MARK: Properties

  private let duration: CFTimeInterval = 1
  private let timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.68, 0.18, 1.08)

  // MARK: ActivityIndicatorAnimating

  public func configAnimation(in layer: CALayer, size: CGSize, color: UIColor) {
    let lineSize = size.width / 9
    let x = (layer.bounds.size.width - size.width) / 2
    let y = (layer.bounds.size.height - size.height) / 2
    let beginTime = CACurrentMediaTime()
    let beginTimes = [0.1, 0.2, 0.3, 0.4, 0.5]

    let animation = self.animation
    for i in 0 ..< 5 {
      let line = ActivityIndicatorShape.Line.createLayerWith(size: CGSize(width: lineSize, height: size.height), color: color)
      let frame = CGRect(x: x + lineSize * 2 * CGFloat(i), y: y, width: lineSize, height: size.height)

      animation.beginTime = beginTime + beginTimes[i]
      line.frame = frame
      line.addAnimation(animation, forKey: "animation")
      layer.addSublayer(line)
    }
  }

}

// MARK: - Setup

private extension ActivityIndicatorAnimationLineScale {

  var animation: CAKeyframeAnimation {
    let animation = CAKeyframeAnimation(keyPath: "transform.scale.y")
    animation.keyTimes = [0, 0.5, 1]
    animation.timingFunctions = [timingFunction, timingFunction]
    animation.values = [1, 0.4, 1]
    animation.duration = duration
    animation.repeatCount = .infinity
    animation.removedOnCompletion = false
    return animation
  }

}
