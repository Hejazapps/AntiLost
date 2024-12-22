//
//  AlarmVc.swift
//  Antilost
//
//  Created by SADIQUL AMIN IBNE AZAD on 21/12/24.
//

import UIKit

class AlarmVc: UIViewController {
    
    let soundsArray = [
      "Air Horn", "Rooster", "Dog", "Whistle", "Gun", "Train",
      "Police", "Cat", "Alarm", "Door Bell", "Drum",
      "Baby", "Hello", "Haha", "Ship", "Piano",
      "Guitar", "Grenade"
    ];
    
    var gap:CGFloat = 20
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
        
        return CGSize(width: width, height: width)
        
        
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
        return  soundsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlarmCell", for: indexPath) as!  AlarmCell
        cell.holderView.addBorder(color: UIColor.lightGray, width: 0.3)
        cell.holderView.roundCorners(radius: 10.0)
        cell.imv.image = UIImage(named: "Alarm\(indexPath.row)")
        cell.lbl.text = soundsArray[indexPath.row]
        cell.lbl.layer.cornerRadius = 7.0
        cell.lbl.clipsToBounds = true
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        
        
        
    }
}



extension UIView {
    // Add shadow with customizable properties
    func addShadow(shadowColor: UIColor = .black,
                   shadowOpacity: Float = 1,
                   shadowOffset: CGSize = CGSize(width: 0, height: 1),
                   shadowRadius: CGFloat = 10.0,
                   cornerRadius: CGFloat = 10.0) {
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
    }
    
    
    class func fromNib(named: String? = nil) -> Self {
        let name = named ?? "\(Self.self)"
        guard
            let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
        else { fatalError("missing expected nib named: \(name)") }
        guard
            /// we're using `first` here because compact map chokes compiler on
            /// optimized release, so you can't use two views in one nib if you wanted to
            /// and are now looking at this
            let view = nib.first as? Self
        else { fatalError("view of type \(Self.self) not found in \(nib)") }
        return view
    }
    
    func roundCorners(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
    
    // Add border with customizable properties
    func addBorder(color: UIColor, width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

