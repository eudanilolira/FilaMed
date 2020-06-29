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
        self.loadAppointments()

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.backgroundColor = GlobalStyle.BackgroundColor
        self.navigationController?.navigationBar.barTintColor = GlobalStyle.BackgroundColor

        self.appointmentsView.appointmentsTable.dataSource = self
        self.appointmentsView.appointmentsTable.delegate = self

        self.setupProfilePicture()
    }

    func loadAppointments() {
        let today = GlobalStyle.comparableDateFormat.string(from: Date())

        if let appointments = AppointmentManager.shared.getAll() {
            for appointment in appointments {
                guard let appointmentDate = appointment.date else {
                    fatalError("A Consulta não possui data marcada")
                }
                let formattedDate = GlobalStyle.comparableDateFormat.string(from: appointmentDate)

                if (today == formattedDate) {
                    todayAppointments.append(appointment)
                } else if (formattedDate > today) {
                    futureAppointments.append(appointment)
                }
            }
        } else {
            print("Nenhuma consulta foi marcada")
        }
    }

}

extension AppointmentsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return todayAppointments.count
        }

        return futureAppointments.count - 1
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
            let appointment = todayAppointments[indexPath.row]

            cell.content.clinicName.text = appointment.realized?.name
            cell.content.specialty.text = appointment.realized?.specialty
            cell.content.time.text = appointment.time
            cell.content.statusLabel.text = appointment.status

            return cell

        } else if indexPath.section == 1 {
            let futureCell = tableView.dequeueReusableCell(withIdentifier: "futureAppointmentCell", for: indexPath)

            guard let cell =  futureCell as? AppointmentCell<FutureAppointmentContent> else {
                fatalError("")
            }
            let appointment = futureAppointments[indexPath.row]

            cell.content.clinicName.text = appointment.realized?.name
            cell.content.specialty.text = appointment.realized?.specialty
            cell.content.dateLabel.text = GlobalStyle.dateFormat.string(from: appointment.date!)
            cell.content.time.text = appointment.time

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
