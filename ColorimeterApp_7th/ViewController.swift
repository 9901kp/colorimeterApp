import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let itemsPerRow: CGFloat = 3
    
    var palettes: [ColorPalette] = [
        ColorPalette(id: "1", name: "Sunny Day", hexColors: ["#FFD700", "#FFA500", "#FF8C00"], isFavorite: true),
        ColorPalette(id: "2", name: "Ocean Breeze", hexColors: ["#00BFFF", "#1E90FF", "#0000CD"], isFavorite: true),
        ColorPalette(id: "3", name: "Forest Hike", hexColors: ["#228B22", "#008000", "#006400"], isFavorite: false),
        ColorPalette(id: "4", name: "Pastel Dreams", hexColors: ["#FFB6C1", "#FFDAB9", "#E6E6FA"], isFavorite: false),
        ColorPalette(id: "5", name: "Bloody Red", hexColors: ["#7F0000", "#990000", "#FF0000"], isFavorite: true),
        ColorPalette(id: "6", name: "Lemon Yellow", hexColors: ["#FFF44F", "#FFFACD", "#FFFA78"], isFavorite: false),
        // Add more palettes as needed
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: PaletteCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PaletteCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return palettes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaletteCollectionViewCell.identifier, for: indexPath) as! PaletteCollectionViewCell
        cell.setupView(colorPalette: palettes[indexPath.item])
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout methods

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let collectionViewSize = collectionView.frame.size.width - padding * 4
        
        let width = collectionViewSize / 5
        let height: CGFloat = 60 // Уменьшим высоту до 100

        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
