import UIKit

class DetailsVC: UIViewController {
    var newsItem: NewsItem?
    
    private let imageView = UIImageView()
    private let timeLabel = UILabel()
    private let titleLabel = UILabel()
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        setupViews()
        configureViewsWithData()
    }
    
    private func setupViews() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.layer.masksToBounds = true
        
        timeLabel.font = UIFont(name: "FiraGO-Bold", size: 16)
        titleLabel.font = UIFont(name: "FiraGO-Bold", size: 14)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        
        view.addSubview(imageView)
        view.addSubview(timeLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(titleLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            imageView.heightAnchor.constraint(equalToConstant: 190),
            timeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            timeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 13),
            
            scrollView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 58),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160),
            
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            titleLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
    }
    
    private func configureViewsWithData() {
        titleLabel.text = newsItem?.title
        timeLabel.text = newsItem?.time
        if let imageUrl = newsItem?.photoUrl {
            imageView.loadImage(from: imageUrl)
        }
    }
}



