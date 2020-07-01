//
//  AppointmentsProfile.swift
//  FilaMed
//
//  Created by Danilo Araújo on 24/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import Foundation
import UIKit

extension AppointmentsViewController {

    func setupProfilePicture() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }

        let tapped = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))

        imageView.layer.cornerRadius = GlobalSize.ImageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapped)

        navigationBar.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -GlobalSize.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -GlobalSize.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: GlobalSize.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])

    }

    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
//            self.navigationController?.pushViewController(ProfileViewController(), animated: true)
            let profileNavigationController:UINavigationController = UINavigationController(rootViewController: ProfileViewController())
            self.present(profileNavigationController, animated: true)
        }
    }

    func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - GlobalSize.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (GlobalSize.NavBarHeightLargeState - GlobalSize.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()

        let factor = GlobalSize.ImageSizeForSmallState / GlobalSize.ImageSizeForLargeState

        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()

        // Value of difference between icons for large and small states
        let sizeDiff = GlobalSize.ImageSizeForLargeState * (1.0 - factor) // 8.0
        let yTranslation: CGFloat = {
            let maxYTranslation = GlobalSize.ImageBottomMarginForLargeState - GlobalSize.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation - coeff * (GlobalSize.ImageBottomMarginForSmallState + sizeDiff))))
        }()

        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)

        imageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let height = navigationController?.navigationBar.frame.height else { return }
        self.moveAndResizeImage(for: height)
    }
}
