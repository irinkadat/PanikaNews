import UIKit


class NewsCell: UITableViewCell {
    var newsImageView = UIImageView()
    var titleLabel = UILabel()
    var timeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
        
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(newsImageView)
        newsImageView.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.textColor = .white
        timeLabel.font = UIFont(name: "FiraGO-Bold", size: 14)
        timeLabel.textAlignment = .center
        contentView.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -25)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "FiraGO-Bold", size: 14)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 303),
            titleLabel.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        newsImageView.clipsToBounds = true
        let cellSpacing: CGFloat = 15
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: cellSpacing / 2, left: 0, bottom: cellSpacing / 2, right: 0))
    }
    
    func configure(with newsItem: NewsItem) {
        titleLabel.text = newsItem.title
        timeLabel.text = newsItem.time
        newsImageView.loadImage(from: newsItem.photoUrl)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImageView.image = nil
        titleLabel.text = nil
        timeLabel.text = nil
    }
}
