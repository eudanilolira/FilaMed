//
//  AppointmentsViewController.swift
//  FIlaMed
//
//  Created by Danilo Araújo on 22/06/20.
//  Copyright © 2020 FilaMed. All rights reserved.
//

import UIKit

private struct Const {
    /// Image height/width for Large NavBar state
    static let ImageSizeForLargeState: CGFloat = 40
    /// Margin from right anchor of safe area to right anchor of Image
    static let ImageRightMargin: CGFloat = 16
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Large NavBar state
    static let ImageBottomMarginForLargeState: CGFloat = 8
    /// Margin from bottom anchor of NavBar to bottom anchor of Image for Small NavBar state
    static let ImageBottomMarginForSmallState: CGFloat = 6
    /// Image height/width for Small NavBar state
    static let ImageSizeForSmallState: CGFloat = 32
    /// Height of NavBar for Small state. Usually it's just 44
    static let NavBarHeightSmallState: CGFloat = 44
    /// Height of NavBar for Large state. Usually it's just 96.5 but if you have a custom font for the title, please make sure to edit this value since it changes the height for Large state of NavBar
    static let NavBarHeightLargeState: CGFloat = 96.5
}

class AppointmentsViewController: UIViewController {
    
    private let imageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
    
    let appointmentsView = AppointmentsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.appointmentsView

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        
        self.appointmentsView.appointmentsTable.dataSource = self
        self.appointmentsView.appointmentsTable.delegate = self
        
        self.setupProfilePicture()
    }
    
    private func setupProfilePicture() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(imageView)
        imageView.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -Const.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
            ])
    }
    
    private func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - Const.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Const.NavBarHeightLargeState - Const.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()

        let factor = Const.ImageSizeForSmallState / Const.ImageSizeForLargeState

        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()

        // Value of difference between icons for large and small states
        let sizeDiff = Const.ImageSizeForLargeState * (1.0 - factor) // 8.0
        let yTranslation: CGFloat = {
            /// This value = 14. It equals to difference of 12 and 6 (bottom margin for large and small states). Also it adds 8.0 (size difference when the image gets smaller size)
            let maxYTranslation = Const.ImageBottomMarginForLargeState - Const.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation, (maxYTranslation - coeff * (Const.ImageBottomMarginForSmallState + sizeDiff))))
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

extension AppointmentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 104 : 122
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell", for: indexPath) as! AppointmentCell
            
            cell.content.clinicName.text = "Dra.Judith da Matta"
            cell.content.specialty.text = "Ortodontista"
            cell.content.time.text = "10:30"
            cell.content.statusLabel.text = "Você ainda não entrou na fila"
            
            return cell
        }
        else if(indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "futureAppointmentCell", for: indexPath) as! FutureAppointmentCell
            
            cell.content.clinicName.text = "Dr.Marcio Danilo"
            cell.content.specialty.text = "Ortodontista"
            cell.content.time.text = "10:30"
            cell.content.dateLabel.text = "26/06/2020"
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:"appointmentsHeader") as! AppointmentsHeader
        view.title.text = section == 0 ? "Hoje" : "Próximas"

        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
}

