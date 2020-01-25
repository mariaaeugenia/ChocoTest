//
//  OnBoardingView.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 25/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class OnBoardingView: UIView {
    
    var pageControl: UIPageControl!
    var scrollView: UIScrollView!
    var endOnBoardingButton: UIButton!
    
    
    override init(frame: CGRect) {
      super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
         setup()
    }
    
    func setup() {
        //SUBVIEW
        scrollView = UIScrollView(frame: self.bounds)
        scrollView.delegate = self
        self.addSubview(scrollView)
        
       //PAGECONTROL
        pageControl = UIPageControl()
        let yPageControlPosition = getYPositionFor(height: pageControl.frame.height)
        let xPageControlPosition = getXPositionFor(width: pageControl.frame.width)
        pageControl.frame = CGRect(x: xPageControlPosition, y: yPageControlPosition, width: pageControl.frame.width, height: pageControl.frame.height)
        pageControl.currentPage = 0
        pageControl.numberOfPages = setupImages().count
        self.addSubview(pageControl)
        pageControl.bringSubviewToFront(self)
        //ENDBOARDING BUTTON
        endOnBoardingButton = UIButton(frame: .zero)
        endOnBoardingButton.setTitle("FINISH", for: .normal)
        endOnBoardingButton.tintColor = .white
        endOnBoardingButton.backgroundColor = UIColor(hexString: "007AFF")
        endOnBoardingButton.layer.cornerRadius = 10
        let buttonWidth = self.bounds.width*0.7
        let buttonHeight: CGFloat = 44
        let yButtonPosition = getYPositionFor(height: buttonHeight)
        let xButtonPosition = getXPositionFor(width: buttonWidth)
        endOnBoardingButton.frame = CGRect(x: xButtonPosition, y: yButtonPosition, width: buttonWidth, height: buttonHeight)
        endOnBoardingButton.isHidden = true
        endOnBoardingButton.addTarget(self, action: #selector(endOnboardingAction(_ :)), for: .touchUpInside)
        self.addSubview(endOnBoardingButton)
        setupOnBoarding()
    }
    
    func getYPositionFor(height: CGFloat) -> CGFloat {
        let heightView = self.bounds.height
        return heightView - height - 50
    }
    
    func getXPositionFor(width: CGFloat) -> CGFloat {
        let widthView = self.bounds.width/2
        return widthView - width/2
    }
    
    func setupImages() -> [UIImageView] {
        
        let firstImage = UIImageView(frame: scrollView.frame)
        firstImage.image = UIImage(named: "swipeRightTutorial")
        firstImage.contentMode = .scaleAspectFill
        
        let secondImage = UIImageView(frame: scrollView.frame)
        secondImage.image = UIImage(named: "swipeLeftTutorial")
        secondImage.contentMode = .scaleAspectFill
        
        return [firstImage, secondImage]
    }
    
    func setupOnBoarding() {
        let images = setupImages()
        
        scrollView.contentSize = CGSize(width: self.frame.width * CGFloat(images.count), height: self.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< images.count {
            images[i].frame = CGRect(x: self.frame.width * CGFloat(i), y: 0, width: self.frame.width, height: self.frame.height)
            scrollView.addSubview(images[i])
        }
    }
    
    @objc func endOnboardingAction(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "didSeeOnboarding")
        self.removeFromSuperview()
    }
}

extension OnBoardingView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/self.frame.width)
        pageControl.currentPage = Int(pageIndex)
        let hide = (Int(pageIndex) == pageControl.numberOfPages-1)
        pageControl.isHidden = hide
        endOnBoardingButton.isHidden = !hide
    }
}
