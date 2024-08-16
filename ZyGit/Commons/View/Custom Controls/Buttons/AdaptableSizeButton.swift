//
//  AdaptableSizeButton.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class AdaptableSizeButton: UIButton {
    
    override var intrinsicContentSize: CGSize {
        let labelSize = titleLabel?.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude)) ?? .zero
        let desiredButtonSize = CGSize(width: labelSize.width + titleEdgeInsets.left + titleEdgeInsets.right, height: labelSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom)
        
        return desiredButtonSize
    }
    
}
