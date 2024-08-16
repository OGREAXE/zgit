//
//  EmptyView.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class EmptyView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    class func instanceFromNib() -> EmptyView {
        let bundle = Bundle(for: EmptyView.self)
        let view = UINib(nibName: "EmptyView", bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as! EmptyView
        return view
    }
    
    func show(on superView: UIView, with emptyModel: EmptyViewModel?) {
        imageView.image = emptyModel?.image
        titleLabel.text = emptyModel?.title
        frame = superView.bounds
        superView.addSubview(self)
    }
    
    func hide() {
        removeFromSuperview()
    }

}
