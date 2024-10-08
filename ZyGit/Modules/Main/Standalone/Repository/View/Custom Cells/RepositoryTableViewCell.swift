//
//  RepositoryTableViewCell.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit

class RepositoryTableViewCell: TableViewCell, InterfaceBuilderTableViewCell {

    override class var reuseIdentifier: String { return String(describing: RepositoryTableViewCell.self) }
    override class var nib: UINib { return UINib(nibName: String(describing: RepositoryTableViewCell.self), bundle: nil) }
    
    @IBOutlet weak var ownerTextView: IconicTextView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starsNumericView: IconicNumericView!
    @IBOutlet weak var languageTextView: IconicTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        ownerTextView.cancelIconLoading()
        nameLabel.text = nil
        descriptionLabel.text = nil
        starsNumericView.numbers = nil
        languageTextView.text = nil
    }
    
}

struct RepositoryCellActionProvider {
    
    var isBookmarked: Bool
    var toggleBookmark: () -> Void
    var openInSafari: () -> Void
    var share: () -> Void
    
}
