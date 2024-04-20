//
//  ViewController.swift
//  PanikaNews
//
//  Created by Irinka Datoshvili on 19.04.24.
//

import UIKit
import UIKit

class MainVC: UIViewController {
    var tableView = UITableView()
    var newsItems: [NewsItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Panika News"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureNavTitle()
        view.backgroundColor = .white

        setupTableView()
        
        NetworkManager.shared.fetchNews { [weak self] newsItems in
            self?.newsItems = newsItems ?? []
            self?.tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
    }
    func configureNavTitle() {
        if let customFont = UIFont(name: "SpaceGrotesk-Bold", size: 34) {
            let attrs = [
                NSAttributedString.Key.foregroundColor: UIColor.label,
                NSAttributedString.Key.font: customFont
            ]
            navigationController?.navigationBar.largeTitleTextAttributes = attrs
        }

    }
}

// MARK: - UITableViewDataSource

extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        let newsItem = newsItems[indexPath.row]
        cell.configure(with: newsItem)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailsVC()
        detailVC.newsItem = newsItems[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

#Preview {
    MainVC()
}
