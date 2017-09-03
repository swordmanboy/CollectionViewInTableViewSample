//
//  MainTable2TableViewCell.swift
//  UICollectionViewInTableViewSample
//
//  Created by Apinun Wongintawang on 9/3/17.
//  Copyright © 2017 Apinun Wongintawang. All rights reserved.
//

import UIKit

class MainTable2TableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var collectionView : UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        let layout : UICollectionViewFlowLayout! = UICollectionViewFlowLayout.init()
//        layout.sectionInset = UIEdgeInsetsMake(10, 10, 9, 10)
//        layout.itemSize = CGSize.init(width: 44, height: 44)
//        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
//        self.collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
//        self.collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: collectionViewCellIdentifier)
//        self.collectionView.backgroundColor = UIColor.white
//        self.collectionView.showsHorizontalScrollIndicator = false
//        self.contentView.addSubview(self.collectionView)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}

extension MainTable2TableViewCell{
    public func setSelectViewDataSourceDelegate<D: UICollectionViewDelegate & UICollectionViewDataSource>(_ dataSourceDelegate : D,forRow row : Int){
        let layout : UICollectionViewFlowLayout! = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated: false) // Stops collection view if it was scrolling.
        collectionView.register(UINib.init(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        collectionView.reloadData()
    }
    
    var collectionViewOffset : CGFloat{
        set{ collectionView.contentOffset.x = newValue}
        get{ return collectionView.contentOffset.x}
    }
}


