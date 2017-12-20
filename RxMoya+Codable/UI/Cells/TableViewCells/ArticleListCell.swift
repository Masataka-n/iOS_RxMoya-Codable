//
//  ArticleListCell.swift
//  RxMoya+Codable
//
//  Created by Masataka Nakagawa on 2017/12/20.
//  Copyright © 2017年 Masataka Nakagawa. All rights reserved.
//

import UIKit

class ArticleListCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCellData( article: Article)  {
        self.titleLabel.text = article.title
        self.contentLabel.text = article.body
        self.createdAtLabel.text = article.createdAt
        if let likesCount = article.likesCount {
            self.likeCountLabel.text = String(describing: likesCount)
        }
        if let commentsCount = article.commentsCount {
            self.commentCountLabel.text = String(describing: commentsCount)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
