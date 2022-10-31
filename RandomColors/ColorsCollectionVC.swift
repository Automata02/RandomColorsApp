//
//  ColorsCollectionVC.swift
//  RandomColors
//
//  Created by roberts.kursitis on 27/10/2022.
//

import UIKit

class ColorsCollectionVC: UIViewController {
    
    var colors: [UIColor] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    enum Cells {
        static let colorCell = "myCell"
    }
    
    enum Segues {
        static let toDetail = "ToColorsDetailVC"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appendRandomColors()
    }
    
    @IBAction func refreshColorsTapped(_ sender: Any) {
        colors.removeAll()
        appendRandomColors()
        collectionView.reloadData()
    }
    
    func appendRandomColors() {
        for _ in 0..<420 {
            colors.append(.randomize())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailVC
        destVC.color = sender as? UIColor
    }
}

extension ColorsCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cells.colorCell, for: indexPath)
        let color = colors[indexPath.row]
        cell.backgroundColor = color
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color = colors[indexPath.row]
        performSegue(withIdentifier: Segues.toDetail, sender: color)
    }
    
}
