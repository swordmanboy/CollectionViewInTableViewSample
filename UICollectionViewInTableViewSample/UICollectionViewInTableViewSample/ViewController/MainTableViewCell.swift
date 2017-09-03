//
//  MainTableViewCell.swift
//  UICollectionViewInTableViewSample
//
//  Created by Apinun Wongintawang on 9/2/17.
//  Copyright © 2017 Apinun Wongintawang. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    var collectionView: UICollectionView!
    let collectionViewCellIdentifier : String! = "CollectionViewCellIdentifier"
    var indexPath : IndexPath! = IndexPath.init()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let layout : UICollectionViewFlowLayout! = UICollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 9, 10)
        layout.itemSize = CGSize.init(width: 44, height: 44)
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        self.collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        self.collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: collectionViewCellIdentifier)
        self.collectionView.backgroundColor = UIColor.white
        self.collectionView.showsHorizontalScrollIndicator = false
        self.contentView.addSubview(self.collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.collectionView.frame = self.contentView.bounds
    }
    
    func setCollectionViewDataSourceDelegate(datasource:UICollectionViewDataSource,delegate:UICollectionViewDelegate,indexPath:IndexPath){
        self.collectionView.dataSource = datasource
        self.collectionView.delegate = delegate
        self.indexPath = indexPath
        self.collectionView.setContentOffset(self.collectionView.contentOffset, animated: true)
        self.collectionView.reloadData()
    }
}
