//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Felipe Filgueira on 17/01/23.
//

import UIKit

class RMCharacterDetailViewController: UIViewController {
    private var viewModel: RMCharacterDetailViewModel
    private let detailView: RMCharacterDetailView
    
    init(viewModel: RMCharacterDetailViewModel) {
        self.viewModel = viewModel
        self.detailView = RMCharacterDetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        view.addSubview(detailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(didTapShare))
        addConstraints()
        detailView.collectionView?.delegate = self
        detailView.collectionView?.dataSource = self
    }
    
    @objc
    private func didTapShare() {
        //
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension RMCharacterDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionsType = viewModel.sections[section]
        switch sectionsType {
        case .photo:
            return 1
        case .information(let viewModel):
            return viewModel.count
        case .episodes(let viewModel):
            return viewModel.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let sectionsType = viewModel.sections[indexPath.section]
        switch sectionsType {
        case .photo(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RMCharacterPhotoCollectionViewCell.cellIdentifier,
                    for: indexPath) as? RMCharacterPhotoCollectionViewCell
            else {
                fatalError()
            }
            cell.backgroundColor = .systemYellow
            cell.configure(with: viewModel)
            return cell
        case .information(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RMCharacterInfoCollectionViewCell.cellIdentifier,
                    for: indexPath) as? RMCharacterInfoCollectionViewCell
            else {
                fatalError()
            }
            cell.backgroundColor = .systemRed
            cell.configure(with: viewModel[indexPath.row])
            return cell
        case .episodes(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: RMCharacterEpisodeCollectionViewCell.cellIdentifier,
                    for: indexPath) as? RMCharacterEpisodeCollectionViewCell
            else {
                fatalError()
            }
            cell.backgroundColor = .systemOrange
            cell.configure(with: viewModel[indexPath.row])
            return cell
        }
        
    }
    
    
}
