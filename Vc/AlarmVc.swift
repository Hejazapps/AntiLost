//
//  AlarmVc.swift
//  Antilost
//
//  Created by SADIQUL AMIN IBNE AZAD on 21/12/24.
//

import UIKit

class AlarmVc: UIViewController {
    
    var gap:CGFloat = 10
    @IBOutlet weak var collectionViewForAlarm: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reigsterXib()
        
    }
    
    @IBAction func dismissTheView(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    func reigsterXib () {
        
        let nib = UINib(nibName: "AlarmCell", bundle: .main)
        collectionViewForAlarm.register(nib, forCellWithReuseIdentifier: "AlarmCell")
        
        collectionViewForAlarm.delegate = self
        collectionViewForAlarm.dataSource = self
        
        
    }
    
}


extension AlarmVc: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let  numberOfItemsPerRow: CGFloat = 3.0
        
        let bounds = UIScreen.main.bounds
        let width = (bounds.size.width - gap*(numberOfItemsPerRow+2)) / numberOfItemsPerRow
        
        return CGSize(width: width, height: width + 20)
        
        
        // Adjust height if needed
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: gap, left: gap, bottom: gap, right: gap)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return gap
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return gap
    }
}


extension AlarmVc: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlarmCell", for: indexPath) as!  AlarmCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        
        
        
    }
}
