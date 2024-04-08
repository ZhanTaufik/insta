//
//  FeedViewController.swift
//  Instagram
//
//  Created by Mac Students on 06.02.2024.
//
import SnapKit
import UIKit

class FeedViewController: UIViewController{
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    //MARK: - Private properties
    private let tableView = UITableView()
    private var items: [FeedItemType] = [
        .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "mimo")!, username: "zhuzhuzhazhan", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "nono")!, username: "none_uhm", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "nono")!, username: "none_uhm", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "nono")!, username: "none_uhm", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "nono")!, username: "none_uhm", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "nono")!, username: "none_uhm", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "nono")!, username: "none_uhm", isAddButtonVisible: false, isNewStory: true)
        ]),
        .post(FeedPostItemInfo(userImage: UIImage(named: "mimo")!, username: "zhuzhuzhazhan", postSubtitle: "Sponsored", postImage: UIImage(named: "mimo")!, numberOfLikes: 33, comment: CommentShortInfo(username: "nono", commentText: "Very beautiful")))
    ]
}

// MARK: Private methods
private extension FeedViewController {
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self))
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self))
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }
    
    func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(didTapPlusButton))
        let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(didTapDirectButton))
        return [directBarButtonItem, addBarButtonItem]
    }
    
    @objc func didTapPlusButton() {
        print("Add")
    }
    
    @objc func didTapDirectButton() {
        print("Direct")
    }
    
    func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.3"))  { _ in
            print("subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("favs")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
}

// MARK: - UITableViewDataSource
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
}
