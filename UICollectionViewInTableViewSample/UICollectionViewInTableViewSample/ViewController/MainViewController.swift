//
//  MainViewController.swift
//  UICollectionViewInTableViewSample
//
//  Created by Apinun Wongintawang on 9/2/17.
//  Copyright © 2017 Apinun Wongintawang. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var colorArray : NSArray! = NSArray()
    var contentOffsetDictionary : NSMutableDictionary! = NSMutableDictionary.init()
    var storedOffsets = [Int : CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        super.loadView()
        let numberOfTableViewRows : Int! = 20
        let numberOfCollectionViewCells : Int! = 15
        
        let mutableArray : NSMutableArray! = NSMutableArray.init(capacity: numberOfTableViewRows)
        
        for _ in 0..<numberOfTableViewRows{
            let colorArray = NSMutableArray.init(capacity: numberOfCollectionViewCells)
            
            for _ in 0..<numberOfCollectionViewCells{
                colorArray.insert(UIColor.random(), at: colorArray.count)
            }
            mutableArray.insert(colorArray, at: mutableArray.count)
        }
        
        self.colorArray = mutableArray.copy() as! NSArray
        contentOffsetDictionary = NSMutableDictionary.init()
    }

}

extension MainViewController : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.colorArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let CellIdentifier : String! = "Cell"
        tableView.register(UINib.init(nibName: "MainTable2TableViewCell", bundle: nil), forCellReuseIdentifier: CellIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? MainTable2TableViewCell else { return }

        tableViewCell.setSelectViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = self.storedOffsets[indexPath.row] ?? 0
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? MainTable2TableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
    
}

extension MainViewController  : UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let collectionViewArray  = self.colorArray[collectionView.tag] as? NSArray{
            return collectionViewArray.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let colors = self.colorArray[collectionView.tag] as! NSArray
        cell.backgroundColor = colors[indexPath.row] as? UIColor ?? UIColor.white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}

extension CGFloat{
    static func randomForColor() -> CGFloat{
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor{
    class func random() -> UIColor{
        return UIColor.init(red: .randomForColor(),
                            green: .randomForColor(),
                            blue: .randomForColor(),
                            alpha: 1.0)
    }
}
