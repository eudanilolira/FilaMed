import UIKit
import CoreData

class AppointmentsViewController: UIViewController {

    let imageView = UIImageView(image: UIImage(systemName: "person.circle.fill"))
    let appointmentsView = AppointmentsView()
    var todayAppointments: [Appointment] = []
    var futureAppointments: [Appointment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.appointmentsView
        self.separateAppointments()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)

        self.appointmentsView.appointmentsTable.dataSource = self
        self.appointmentsView.appointmentsTable.delegate = self

        self.setupProfilePicture()

    }

    func separateAppointments() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let today = dateFormatter.string(from: Date())

        SeedDataBase.shared.createAppointments()
        SeedDataBase.shared.createFutureAppointments()

        if let appointments = AppointmentManager.shared.getAll() {
//            self.todayAppointments = appointments

            for appointment in appointments {
                guard let appointmentDate = appointment.date else { fatalError() }
                let formattedDate = dateFormatter.string(from: appointmentDate)

                if (today == formattedDate) {
                    todayAppointments.append(appointment)
                } else if (formattedDate > today) {
                    futureAppointments.append(appointment)
                }

            }
        } else {
            print("Nenhuma consulta")
        }
    }

}

extension AppointmentsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return todayAppointments.count
        }

        return futureAppointments.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 104 : 122
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let appointmentCell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell", for: indexPath)

            guard let cell = appointmentCell as? AppointmentCell<TodayAppointmentContent> else {
                fatalError("")
            }

            cell.content.clinicName.text = todayAppointments[indexPath.row].realized!.name
            cell.content.specialty.text = todayAppointments[indexPath.row].realized!.specialty
            cell.content.time.text = "10:30"
            cell.content.statusLabel.text = "Você ainda não entrou na fila"

            return cell

        } else if indexPath.section == 1 {
            let futureCell = tableView.dequeueReusableCell(withIdentifier: "futureAppointmentCell", for: indexPath)

            guard let cell =  futureCell as? AppointmentCell<FutureAppointmentContent> else {
                fatalError("")
            }

            cell.content.clinicName.text = futureAppointments[indexPath.row].realized!.name
            cell.content.specialty.text = futureAppointments[indexPath.row].realized!.specialty
            cell.content.time.text = "10:30"
            cell.content.dateLabel.text = "26/06/2020"

            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let viewHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "appointmentsHeader")

        guard let view = viewHeader as? AppointmentsHeader else {
            fatalError("")
        }
        view.title.text = section == 0 ? "Hoje" : "Próximas"

        return view
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20.0
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }

}
