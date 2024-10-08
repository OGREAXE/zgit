//
//  IconicTextView.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

@IBDesignable
class IconicTextView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var iconImageView: SFImageView!
    @IBOutlet weak var textLabel: UILabel!
    
    @IBInspectable var icon: UIImage? {
        didSet {
            iconImageView.image = icon
        }
    }
    
    @IBInspectable var iconTintColor: UIColor? {
        didSet {
            iconImageView.tintColor = iconTintColor
        }
    }
    
    @IBInspectable var iconCornerRadius: CGFloat = 0.0 {
        didSet {
            iconImageView.cornerRadius = iconCornerRadius
            iconImageView.cornerCurve = .continuous
            iconImageView.masksToBounds = true
        }
    }
    
    @IBInspectable var text: String? {
        didSet {
            if let text = text {
                textLabel.text = text
                isHidden = false
            } else {
                isHidden = true
            }
        }
    }
    
    @IBInspectable var isLink: Bool = false {
        didSet {
            if isLink {
                stackView.isUserInteractionEnabled = true
                textLabel.font = UIFont.boldSystemFont(ofSize: textLabel.font.pointSize)
            } else {
                stackView.isUserInteractionEnabled = false
                textLabel.font = UIFont.systemFont(ofSize: textLabel.font.pointSize)
            }
        }
    }
    
    var action: (() -> Void)?
    
    @IBAction func textTapped(_ sender: UITapGestureRecognizer) {
        action?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureView()
    }

    func instantiateFromNib() -> UIView? {
        let bundle = Bundle(for: IconicNumericView.self)
        let nib = UINib(nibName: "IconicTextView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func configureView() {
        guard let view = instantiateFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
    }
    
    func loadIcon(at url: URL) {
        iconImageView.load(at: url)
    }
    
    func cancelIconLoading() {
        icon = nil
        iconImageView.cancel()
    }

}
