//
//  SearchHistoryViewController.swift
//  ZyGit
//
// Created by Kevin on 16/08/2024
//

import UIKit
import Kingfisher
import SVProgressHUD

class SearchHistoryViewController<T: SearchHistoryViewModel>: DPSFViewController {
    
    // MARK: - Properties
    
    weak var delegate: SearchHistoryDelegate!
    var viewModel = T()
    
    var collectionViewDataSource: CollectionViewDataSource<T.ObjectCellViewModelType>!
    var collectionViewDelegate: SearchHistoryCollectionViewDelegate<T>!
    var tableViewDataSource: SearchHistoryTableViewDataSource<T>!
    var tableViewDelegate: SearchHistoryTableViewDelegate<T>!
    
    // MARK: - View Outlets
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerTitleStackView: UIStackView!
    @IBOutlet weak var collectionView: CollectionView!
    @IBOutlet weak var tableView: TableView!
    @IBOutlet weak var collectionContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableContainerHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Initialization
    
    required init?(coder: NSCoder, delegate: SearchHistoryDelegate) {
        super.init(coder: coder)
        self.delegate = delegate
        emptyViewModel = EmptyConstants.SearchHistory.viewModel
        subscribeToKeyboardNotifications()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    static func instatiateFromStoryboard(with delegate: SearchHistoryDelegate) -> SearchHistoryViewController<T> {
        let storyBoard = UIStoryboard(name: "Search", bundle: nil)
        return storyBoard.instantiateViewController(identifier: "HistoryVC", creator: {coder -> SearchHistoryViewController<T> in
            self.init(coder: coder, delegate: delegate)!
                })
    }
    
    deinit {
        debugPrint(String(describing: self) + " deallocated")
        unSubscribeFromKeyboardNotifications()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        layoutView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - View Helper Methods
    
    func configureView() {
        collectionView.cornerRadius = 10.0
        collectionView.cornerCurve = .continuous
        collectionViewDataSource = SearchHistoryCollectionViewDataSource<T.ObjectCellViewModelType>.raw()
        collectionViewDelegate = SearchHistoryCollectionViewDelegate<T>(self)
        collectionView.setDataSource(collectionViewDataSource)
        collectionView.setDelegate(collectionViewDelegate)
    
        tableView.cornerRadius = 10.0
        tableView.cornerCurve = .continuous
        tableViewDataSource = SearchHistoryTableViewDataSource(self)
        tableViewDelegate = SearchHistoryTableViewDelegate(self)
        tableView.setDataSource(tableViewDataSource)
        tableView.setDelegate(tableViewDelegate)
        
        bindToViewModel()
    }
    
    func layoutView() {
        layoutHeaderView()
        layoutCollectionView()
        layoutTableView()
    }
    
    func layoutHeaderView() {
        let headerShouldBeHidden = viewModel.objectCellViewModelArray.isEmpty && viewModel.queryCellViewModelArray.isEmpty
        switch headerShouldBeHidden {
        case true: headerTitleStackView?.isHidden = true
                   xView.transition(to: .empty(emptyViewModel))
        case false: headerTitleStackView?.isHidden = false
                    xView.transition(to: .presenting)
        }
    }
    
    func layoutCollectionView() {
        let collectionShouldBeHidden = viewModel.objectCellViewModelArray.isEmpty
        let collectionContentHeight = collectionView.collectionViewLayout.collectionViewContentSize.height
        switch collectionShouldBeHidden {
        case true: collectionView.isHidden = true
                   collectionContainerHeightConstraint.constant = 0.0
        case false: collectionView.isHidden = false
                    collectionContainerHeightConstraint.constant = collectionContentHeight
        }
    }
    
    func layoutTableView() {
        let tableShouldBeHidden = viewModel.queryCellViewModelArray.isEmpty
        let tableContentHeight = tableView.contentSize.height
        switch tableShouldBeHidden {
        case true: tableView.isHidden = true
                   tableContainerHeightConstraint.constant = 0.0
        case false: tableView.isHidden = false
                    tableContainerHeightConstraint.constant = tableContentHeight
        }
    }
    
    func updateView() {
        updateCollectionView()
        updateTableView()
    }
    
    func updateCollectionView() {
        collectionView?.reloadData()
    }
    
    func updateTableView() {
        tableView?.reloadData()
    }
    
    // MARK: - View Actions
    
    @IBAction func clear(_ sender: UIButton) {
        AlertHelper.showAlert(alert: .clearSearchHistory({ [weak self] in
            self?.viewModel.clear()
            self?.updateView()
            self?.layoutView()
        }))
    }
    
    func toggleBookmark(atItem item: Int) {
        viewModel.toggleBookmark(atItem: item)
    }
    
    func saveImage(atItem item: Int) {
        if let cellViewModelItem = viewModel.objectCellViewModelArray[item] as? UserCollectionCellViewModel {
            KingfisherManager.shared.retrieveImage(with: cellViewModelItem.avatarURL) { result in
                if let retreiveResult = try? result.get() {
                    UIImageWriteToSavedPhotosAlbum(retreiveResult.image, self, nil, nil)
                    SVProgressHUD.showSuccess(withStatus: "Image Saved".localized())
                }
            }
        } else if let cellViewModelItem = viewModel.objectCellViewModelArray[item] as? RepositoryCollectionCellViewModel {
            KingfisherManager.shared.retrieveImage(with: cellViewModelItem.owner.avatarURL) { result in
                if let retreiveResult = try? result.get() {
                    UIImageWriteToSavedPhotosAlbum(retreiveResult.image, self, nil, nil)
                    SVProgressHUD.showSuccess(withStatus: "Image Saved".localized())
                }
            }
        }
    }
    
    func openInSafari(atItem item: Int) {
        if let cellViewModelItem = viewModel.objectCellViewModelArray[item] as? UserCollectionCellViewModel {
            URLHelper.openWebsite(cellViewModelItem.htmlURL)
        } else if let cellViewModelItem = viewModel.objectCellViewModelArray[item] as? RepositoryCollectionCellViewModel {
            URLHelper.openWebsite(cellViewModelItem.htmlURL)
        }
    }
    
    func share(atItem item: Int) {
        if let cellViewModelItem = viewModel.objectCellViewModelArray[item] as? UserCollectionCellViewModel {
            URLHelper.shareWebsite(cellViewModelItem.htmlURL)
        } else if let cellViewModelItem = viewModel.objectCellViewModelArray[item] as? RepositoryCollectionCellViewModel {
            URLHelper.shareWebsite(cellViewModelItem.htmlURL)
        }
    }
    
    func reloadObject(atItem item: Int) {
        let objectCellViewModel = viewModel.reloadObject(atItem: item)
        if let cellViewModelItem = objectCellViewModel as? UserCollectionCellViewModel {
            delegate.dismissHistoryKeyboard()
            let detailVC = UserDetailViewController.instatiate(collectionCellViewModel: cellViewModelItem)
            NavigationRouter.push(viewController: detailVC)
        } else if let cellViewModelItem = objectCellViewModel as? RepositoryCollectionCellViewModel {
            delegate.dismissHistoryKeyboard()
            let detailVC = RepositoryDetailViewController.instatiate(collectionCellViewModel: cellViewModelItem)
            NavigationRouter.push(viewController: detailVC)
        }
    }
    
    func deleteObject(atItem item: Int) {
        viewModel.deleteObject(atItem: item)
    }
    
    func reloadQuery(atRow row: Int) {
        let query = viewModel.reloadQuery(atRow: row)
        delegate.reloadQuery(with: query)
    }
    
    func deleteQuery(atRow row: Int) {
        viewModel.deleteQuery(atRow: row)
    }
    
    // MARK: - Reset Method
    
    func reset() {
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
    }
    
    // MARK: - Bind to View Model Method
    
    func bindToViewModel() {
        viewModel.bindObject { [weak self] objectCellViewModelArray in
            if let objectCellViewModelArray = objectCellViewModelArray {
                self?.collectionViewDataSource?.cellViewModels = objectCellViewModelArray
                self?.updateCollectionView()
                self?.layoutHeaderView()
                self?.layoutCollectionView()
            }
        }
        viewModel.bindQuery { [weak self] queryCellViewModelArray in
            if let queryCellViewModelArray = queryCellViewModelArray {
                self?.tableViewDataSource?.cellViewModels = queryCellViewModelArray
                self?.updateTableView()
                self?.layoutHeaderView()
                self?.layoutTableView()
            }
        }
    }
    
    // MARK: - Keyboard Adjustment Methods
    
    func subscribeToKeyboardNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func unSubscribeFromKeyboardNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }

    @objc func onKeyboardDisappear(_ notification: NSNotification) {
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }

}
